/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Category;
import Model.Products;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author toanl
 */
public class ProductsDAO extends DBContext {

    public ProductsDAO() {
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

    public ArrayList<Products> getProducts() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id=rs.getLong(1);
                String name=rs.getString(2);
                double price=rs.getDouble(3);
                String description=rs.getString(4);
                String maker=rs.getString(5);
                int status=rs.getInt(6);
                int inventory=rs.getInt(7);
                int categoryid=rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
     public ArrayList<Products> get3Newest() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product order by id desc limit 0,3";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id=rs.getLong(1);
                String name=rs.getString(2);
                double price=rs.getDouble(3);
                String description=rs.getString(4);
                String maker=rs.getString(5);
                int status=rs.getInt(6);
                int inventory=rs.getInt(7);
                int categoryid=rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
  
    
    public ArrayList<Products> getProductsbyCateID(int cateid) {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from product where categoryid = " +cateid;
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id=rs.getLong(1);
                String name=rs.getString(2);
                double price=rs.getDouble(3);
                String description=rs.getString(4);
                String maker=rs.getString(5);
                int status=rs.getInt(6);
                int inventory=rs.getInt(7);
                int categoryid=rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
     public ArrayList<Products> getFeaturedProducts() {
        ArrayList<Products> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "SELECT * FROM product\n" +
"WHERE (maker = \"apple\" OR maker = \"samsung\")\n" +
"AND categoryid != \"5\";";
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id=rs.getLong(1);
                String name=rs.getString(2);
                double price=rs.getDouble(3);
                String description=rs.getString(4);
                String maker=rs.getString(5);
                int status=rs.getInt(6);
                int inventory=rs.getInt(7);
                int categoryid=rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
      public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from category";
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
       public ArrayList<Products> getAllProduct(String search, String categories,  String minPrice, String maxPrice) {
        String whereSql = "";
        if (search != null) {
            whereSql = "where p.name like '%" + search + "%';";
        }
        if (categories != null) {
            whereSql = "where c.id like '" + categories + "'";
        }
      
        if (minPrice != null && maxPrice == null) {
            whereSql = "where (p.price-(p.price*10/100)) >= " + minPrice;
        } else if (minPrice == null && maxPrice != null) {
            whereSql = "where (p.price-(p.price*10/100)) <= " + maxPrice;
        } else if (minPrice != null && maxPrice != null) {
            whereSql = "where (p.price IS NOT NULL AND (p.price-(p.price*10/100)) BETWEEN " + minPrice + " AND " + maxPrice + ")";
        }
      
       
      ArrayList<Products> list = new ArrayList<>();
        try {
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select p.id,p.name,p.price,p.description,p.maker,p.status,p.inventory,c.id from product p  join category c on p.categoryid=c.id "+
                    whereSql;
            
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Long id=rs.getLong(1);
                String name=rs.getString(2);
                double price=rs.getDouble(3);
                String description=rs.getString(4);
                String maker=rs.getString(5);
                int status=rs.getInt(6);
                int inventory=rs.getInt(7);
                int categoryid=rs.getInt(8);
                list.add(new Products(id, name, price, description, maker, status, inventory, categoryid));
            }
        } catch (Exception e) {
            System.out.println("getlist Error:" + e.getMessage());
        }
        return list;
    }
//    public static void main(String[] args) {
//        ProductsDAO pd=new ProductsDAO();
//        ArrayList<Products> list=pd.getAllProduct(null, null, "5000000", "30000000");
//        for (Products products : list) {
//            System.out.println(products);
//            
//        }
//    }

}
