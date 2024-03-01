/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Category;
import Model.Products;
import Model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author toanl
 */
public class CategoryDAO extends DBContext{
    
  public CategoryDAO() {
        connectDB();
    }

    Connection cnn; // ket noi db
    Statement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu

    private void connectDB() {
        try {
            cnn = (new DBContext().connection);
            System.out.println("Connect successfully!");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select id,category from category";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                int id=rs.getInt(1);
                String category=rs.getString(2);
                list.add(new Category(id, category));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
        public Category getCategoryByID(long cateId) {
        Category cate = new Category();
        try {
            
            String sql = "select id,category from category where id =?";
            
            PreparedStatement statement = connection.prepareStatement(sql);
             statement.setLong(1, cateId);
            ResultSet rs = statement.executeQuery();
            
           
            while (rs.next()) {
                int id=rs.getInt(1);
                String category=rs.getString(2);
                cate=new Category(id, category);
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return cate;
    }
//        public static void main(String[] args) {
//        CategoryDAO pd=new CategoryDAO();
//        ArrayList<Category> list=pd.getCategory();
//        for (Category products : list) {
//            System.out.println(products);
//            
//        }
//    }
    
}
