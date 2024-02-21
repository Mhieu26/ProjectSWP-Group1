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

    public ArrayList<OrderLine> getOrderLinesIn7Day() {
        ArrayList<OrderLine> orderlines = new ArrayList<>();

        String sql = " SELECT `orderline`.`id`,\n"
                + "    `orderline`.`quantity`,\n"
                + "    `orderline`.`price`,\n"
                + "    `orderline`.`orderid`,\n"
                + "    `orderline`.`saleid`,\n"
                + "    `orderline`.`productid`,\n"
                + "    `orderline`.`orderdate`,\n"
                + "    `orderline`.`enddate`,\n"
                + "    `orderline`.`status`\n"
                + "FROM `swp391`.`orderline`  WHERE orderdate >= CURDATE() - INTERVAL 7 DAY ;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                OrderLine o = new OrderLine();
                o.setId(rs.getInt("id"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getInt("price"));
                o.setOrderID(rs.getInt("orderid"));
                o.setSaleID(rs.getInt("saleid"));
                o.setProductID(rs.getInt("productid"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

    public ArrayList<OrderLine> getOrderLinesBySaleIDIn7Day(long id) {
        ArrayList<OrderLine> orderlines = new ArrayList<>();

        String sql = " SELECT `orderline`.`id`,\n"
                + "                    `orderline`.`quantity`,\n"
                + "                 `orderline`.`price`,\n"
                + "                  `orderline`.`orderid`,\n"
                + "                    `orderline`.`saleid`,\n"
                + "                   `orderline`.`productid`,\n"
                + "                  `orderline`.`orderdate`,\n"
                + "                  `orderline`.`enddate`,\n"
                + "                  `orderline`.`status`\n"
                + "                FROM `swp391`.`orderline` Where saleid = ? and orderdate >= CURDATE() - INTERVAL 7 DAY ; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                OrderLine o = new OrderLine();
                o.setId(rs.getInt("id"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getInt("price"));
                o.setOrderID(rs.getInt("orderid"));
                o.setSaleID(rs.getInt("saleid"));
                o.setProductID(rs.getInt("productid"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

}
