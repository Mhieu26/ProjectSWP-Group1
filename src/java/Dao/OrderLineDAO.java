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

    public void updateSalerForOrderLine(int orderLineID, int saleID) {

        String sql = "UPDATE `swp391`.`orderline`\n"
                + "SET\n"
                + "`saleid` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, saleID);
            statement.setInt(2, orderLineID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
       

    }

    public void updateSaleNoteForOrderLine(int orderLineID, String saleNote) {

        String sql = "UPDATE `swp391`.`orderline`\n"
                + "SET\n"
                + "`salenote` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, saleNote);
            statement.setInt(2, orderLineID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

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

    public ArrayList<OrderLine> getOrderLinesByOrderID(long id) {
        ArrayList<OrderLine> orderlines = new ArrayList<>();

        String sql = " SELECT `orderline`.`id`,\n"
                + "                    `orderline`.`quantity`,\n"
                + "                 `orderline`.`price`,\n"
                + "                  `orderline`.`orderid`,\n"
                + "                    `orderline`.`saleid`,\n"
                + "                   `orderline`.`productid`,\n"
                + "                  `orderline`.`orderdate`,\n"
                + "                  `orderline`.`enddate`,\n"
                + "                  `orderline`.`status`,\n"
                + "                  `orderline`.`salenote`\n"
                + "                FROM `swp391`.`orderline` Where orderid = ?  ; ";
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
                o.setSaleNote(rs.getString("salenote"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

    public OrderLine getOrderLinesByID(int id) {
        OrderLine o = new OrderLine();

        String sql = " SELECT `orderline`.`id`,\n"
                + "                    `orderline`.`quantity`,\n"
                + "                 `orderline`.`price`,\n"
                + "                  `orderline`.`orderid`,\n"
                + "                    `orderline`.`saleid`,\n"
                + "                   `orderline`.`productid`,\n"
                + "                  `orderline`.`orderdate`,\n"
                + "                  `orderline`.`enddate`,\n"
                + "                  `orderline`.`status`,\n"
                + "                  `orderline`.`salenote`\n"
                + "                FROM `swp391`.`orderline` Where id = ?  ; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                o.setId(rs.getInt("id"));
                o.setQuantity(rs.getInt("quantity"));
                o.setPrice(rs.getInt("price"));
                o.setOrderID(rs.getInt("orderid"));
                o.setSaleID(rs.getInt("saleid"));
                o.setProductID(rs.getInt("productid"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                o.setSaleNote(rs.getString("salenote"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return o;
    }
}
