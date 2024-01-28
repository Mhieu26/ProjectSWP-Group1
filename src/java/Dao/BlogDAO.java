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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BlogDAO extends DBContext {

    public List<Blog> getBlogs(String search,String blogcategory) {
        try {
            List<Object> params = new ArrayList<>();
            List<Blog> blogs = new ArrayList<>();
            String sql = "SELECT * FROM swp391.blog where 1=1";
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
}
