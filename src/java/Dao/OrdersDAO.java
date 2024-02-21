/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.OrderLine;
import Model.Orders;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class OrdersDAO extends DBContext {

    public ArrayList<Orders> getOrderLinesIn7Day() {
        User user = new User();
        UserDAO userDao = new UserDAO();
        ArrayList<Orders> orderlines = new ArrayList<>();

        String sql = " SELECT `orders`.`id`,\n"
                + "`orderdate`,\n"
                + "`orders`.`userid`,\n"
                + "    \n"
                + "    `product`.`name`,\n"
                + "    `orders`.`total`,\n"
                + "    `orders`.`status`\n"
                + "    \n"
                + "    \n"
                + "FROM `swp391`.`orders`\n"
                + "JOIN \n"
                + "   `swp391`.`orderline` ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`\n"
                + "JOIN \n"
                + "    `swp391`.`product` ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`order by `orders`.`id`";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        int flag = 1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                o.setId(rs.getInt("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(userDao.getUserByID(rs.getLong("userid")).getName());
                o.setProductName(nameOfProduct);
                o.setTotal(rs.getInt("total"));
                o.setStatus(rs.getString("status"));
                if (flag == rs.getInt("id")) {
                    nameOfProduct.add(rs.getString("name"));
                }
                if (flag != rs.getInt("id")) {
                    nameOfProduct = null;
                    flag = rs.getInt("id");

                }
                o.setProductName(nameOfProduct);
                orderlines.set(rs.getInt("id"), o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
}
