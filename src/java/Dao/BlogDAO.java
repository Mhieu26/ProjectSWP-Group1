/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Blog;
import util.Helper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getBlogs(String search, String blogcategory) {
        try {
            List<Object> params = new ArrayList<>();
            List<Blog> blogs = new ArrayList<>();
<<<<<<< HEAD
            String sql = "SELECT * FROM swp391.blog where";
=======
            String sql = "SELECT `blog`.`id`,\n"
                    + "    `blog`.`title`,\n"
                    + "    `blog`.`briefinfor`,\n"
                    + "    `blog`.`content`,\n"
                    + "    `blog`.`author`,\n"
                    + "    `blog`.`postdate`,\n"
                    + "    `blog`.`status`,\n"
                    + "    `blog`.`blogcategoryid`,\n"
                    + "    `blog`.`image` FROM swp391.blog where 1=1";
>>>>>>> 85ed51ce1246e92b4a193bed197a0ddcc066f3cf
            if (search != null && !search.trim().isEmpty()) {
                sql += " and title like ?";
                params.add("%" + search + "%");
            }
            if (blogcategory != null && !blogcategory.trim().isEmpty()) {
                sql += " and blogcategoryid = ?";
                params.add(Integer.parseInt(blogcategory));
            }
            Connection con = connection;
            PreparedStatement prepareStatement = con.prepareStatement(sql);
            Helper.mapParams(prepareStatement, params);
            ResultSet rs = prepareStatement.executeQuery();
            BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt(1));
                blog.setTitle(rs.getString(2));
                blog.setBriefinfo(rs.getString(3));
                blog.setContent(rs.getString(4));
                blog.setAuthor(rs.getString(5));
                blog.setPostedDate(rs.getTimestamp(6).toLocalDateTime());
                blog.setStatus(rs.getBoolean(7));
                blog.setImage(rs.getString(9));
                blog.setBlogCategory(blogCategoryDAO.getBlogCategoryByID(rs.getInt(8)));
                blogs.add(blog);
            }
            return blogs;
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addBlog(Blog blog) {
        try {
            String sql = "INSERT INTO swp391.blog (title, briefinfor, content, author, postdate, status, blogcategoryid, image) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            Connection con = connection;
            PreparedStatement prepareStatement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            prepareStatement.setString(1, blog.getTitle());
            prepareStatement.setString(2, blog.getBriefinfo());
            prepareStatement.setString(3, blog.getContent());
            prepareStatement.setString(4, blog.getAuthor());
            prepareStatement.setTimestamp(5, Timestamp.valueOf(blog.getPostedDate()));
            prepareStatement.setBoolean(6, blog.getStatus());
            prepareStatement.setInt(7, blog.getBlogCategory().getId());
            prepareStatement.setString(8, blog.getImage());

            int affectedRows = prepareStatement.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = prepareStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    blog.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Blog getBlogByID(int id) {
        try {
            String sql = "SELECT * FROM swp391.blog where id = ?";
            Connection con = connection;
            PreparedStatement prepareStatement = con.prepareStatement(sql);
            prepareStatement.setInt(1, id);
            ResultSet rs = prepareStatement.executeQuery();
            BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt(1));
                blog.setTitle(rs.getString(2));
                blog.setBriefinfo(rs.getString(3));
                blog.setContent(rs.getString(4));
                blog.setAuthor(rs.getString(5));
                blog.setPostedDate(rs.getTimestamp(6).toLocalDateTime());
                blog.setStatus(rs.getBoolean(7));
                blog.setImage(rs.getString(9));
                blog.setBlogCategory(blogCategoryDAO.getBlogCategoryByID(rs.getInt(8)));
                return blog;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateBlog(Blog blog) {
        try {
            String sql = "UPDATE swp391.blog SET title=?, briefinfor=?, content=?, author=?, postdate=?, "
                    + "status=?, blogcategoryid=?, image=? WHERE id=?";
            Connection con = connection;
            PreparedStatement prepareStatement = con.prepareStatement(sql);

            prepareStatement.setString(1, blog.getTitle());
            prepareStatement.setString(2, blog.getBriefinfo());
            prepareStatement.setString(3, blog.getContent());
            prepareStatement.setString(4, blog.getAuthor());
            prepareStatement.setTimestamp(5, Timestamp.valueOf(blog.getPostedDate()));
            prepareStatement.setBoolean(6, blog.getStatus());
            prepareStatement.setInt(7, blog.getBlogCategory().getId());
            prepareStatement.setString(8, blog.getImage());
            prepareStatement.setInt(9, blog.getId());

            prepareStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBlog(int blogId) {
        try {
            String sql = "DELETE FROM swp391.blog WHERE id = ?";
            Connection con = connection;
            PreparedStatement prepareStatement = con.prepareStatement(sql);
            prepareStatement.setInt(1, blogId);
            prepareStatement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        BlogDAO dao = new BlogDAO();
        System.out.println(dao.getBlogs("", ""));
    }
}
