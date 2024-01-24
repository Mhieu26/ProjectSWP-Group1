/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

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
//    public static void main(String[] args) {
//        ProductsDAO pd=new ProductsDAO();
//        ArrayList<Products> list=pd.getProducts();
//        for (Products products : list) {
//            System.out.println(products);
//            
//        }
//    }

}
