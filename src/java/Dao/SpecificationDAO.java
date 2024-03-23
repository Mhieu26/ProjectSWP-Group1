/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Image;
import Model.Products;
import Model.Specification;
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
public class SpecificationDAO extends DBContext{
    

    Connection cnn; // ket noi db
    Statement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu
//      public ArrayList<Specification> getSpecificationbyProductID(int pid) {
//      ArrayList<Specification> list = new ArrayList<>();
//        try {
//            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
//            String sql = "select * from specification where productid = " +pid;
//            rs = stm.executeQuery(sql);
//            while (rs.next()) {
//                int id=rs.getInt(1);
//                String name=rs.getString(2);
//                String value=rs.getString(3);
//                int productid=rs.getInt(4);
//                int cateid=rs.getInt(5);
//                list.add(new Specification(id, name, value, productid, cateid));
//            }
//        } catch (Exception e) {
//            System.out.println("getlist Error:" + e.getMessage());
//        }
//        return list;
//}
      public ArrayList<Specification> getSpecByPId(int pid ){
        String sql = "  select * from specification where productid = ?"
                ;
        ArrayList<Specification> imgs = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
             statement.setInt(1, pid);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Specification s = new Specification();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setValue(rs.getString("value"));
                s.setProductid(rs.getInt("productid"));
                s.setCateid(rs.getInt("categoryid"));
                imgs.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return imgs;
    }
}
