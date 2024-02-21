/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.OrderLine;
import Model.Role;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class OrderLineDAO extends DBContext {
        public ArrayList<OrderLine> getOrderLines() {
        ArrayList<OrderLine> orderlines = new ArrayList<>();

        String sql = " SELECT `orderline`.`id`,\n" +
"    `orderline`.`quantity`,\n" +
"    `orderline`.`price`,\n" +
"    `orderline`.`orderid`,\n" +
"    `orderline`.`saleid`,\n" +
"    `orderline`.`productid`\n" +
"FROM `swp391`.`orderline`; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                OrderLine o = new OrderLine();
                o.setId(rs.getInt("id"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getDouble("price"));
                o.setOrderID(rs.getInt("orderid"));
                o.setSaleID(rs.getInt("saleid"));
                o.setProductID(rs.getInt("productid"));                
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
         public ArrayList<OrderLine> getOrderLinesBySaleID(long id) {
        ArrayList<OrderLine> orderlines = new ArrayList<>();

                String sql = " SELECT `orderline`.`id`,\n" +
        "    `orderline`.`quantity`,\n" +
        "    `orderline`.`price`,\n" +
        "    `orderline`.`orderid`,\n" +
        "    `orderline`.`saleid`,\n" +
        "    `orderline`.`productid`\n" +
        "FROM `swp391`.`orderline` Where saleid = ? ; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                OrderLine o = new OrderLine();
                o.setId(rs.getInt("id"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getDouble("price"));
                o.setOrderID(rs.getInt("orderid"));
                o.setSaleID(rs.getInt("saleid"));
                o.setProductID(rs.getInt("productid"));                
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
    
}
