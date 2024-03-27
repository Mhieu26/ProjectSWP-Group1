/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.BlogCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BlogCategoryDAO extends DBContext {
    
    
   public BlogCategoryDAO() {
   }

   public BlogCategory getBlogCategoryByID(int id) {
      try {
         String sql = "SELECT * FROM swp391.blogcategory where id = ?";
         Connection con = this.connection;
         PreparedStatement prepareStatement = con.prepareStatement(sql);
         prepareStatement.setInt(1, id);
         ResultSet rs = prepareStatement.executeQuery();
         if (rs.next()) {
            return new BlogCategory(rs.getInt(1), rs.getString(2));
         }
      } catch (SQLException var6) {
         Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, (String)null, var6);
      }

      return null;
   }

   public List<BlogCategory> getBlogCategorys() {
      try {
         List<BlogCategory> list = new ArrayList();
         String sql = "SELECT * FROM swp391.blogcategory ";
         Connection con = this.connection;
         PreparedStatement prepareStatement = con.prepareStatement(sql);
         ResultSet rs = prepareStatement.executeQuery();

         while(rs.next()) {
            BlogCategory blogCategory = new BlogCategory(rs.getInt(1), rs.getString(2));
            list.add(blogCategory);
         }

         return list;
      } catch (SQLException var7) {
         Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, (String)null, var7);
         return null;
      }
   }
}
