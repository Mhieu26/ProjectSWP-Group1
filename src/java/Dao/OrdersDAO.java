/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.*;
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
        public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public ArrayList<Orders> getOrdersByUserID(long id) {
        ArrayList<Orders> orderlines = new ArrayList<>();

        String sql = " SELECT `orders`.`id`, orders.orderdate,`orders`.`userid`,        `product`.`name`,    `orders`.`total`,    `orders`.`status` ,`user`.`name` as userName     \n"
                + " FROM `swp391`.`user`     \n"
                + "                 JOIN `swp391`.`orders`    \n"
                + "                 ON `swp391`.`orders`.`userid`=`swp391`.`user`.`id`    \n"
                + "                 JOIN    `swp391`.`orderline`     \n"
                + "                 ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`    \n"
                + "                 JOIN     `swp391`.`product`     \n"
                + "                 ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`\n"
                + "                  where userid = ?\n"
                + " GROUP BY id , name    \n"
                + " ORDER BY    id";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        long flag = 0;
        int index = 0, total = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                if (flag != rs.getLong("id")) {
                    orderlines.add(o);
                    flag = rs.getLong("id");
                    total = 0;
                    nameOfProduct = new ArrayList<String>();
                }
                o.setId(rs.getLong("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(rs.getString("userName"));
                o.setProductName(nameOfProduct);
                total = total + rs.getInt("total");
                o.setTotal(total);
                o.setStatus(rs.getString("status"));

                nameOfProduct.add(rs.getString("name"));
                o.setProductName(nameOfProduct);
                index = orderlines.size() - 1;
                orderlines.set(index, o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

    public Orders getOrdersByOrdersID(long id) {

        String sql = " SELECT * FROM swp391.orders where id = ?;";
        Orders o = new Orders();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            UserDAO u = new UserDAO();
            while (rs.next()) {

                o.setId(rs.getLong("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                o.setUserName(u.getUserByID(rs.getInt("userid")).getName());
                o.setTotal(rs.getInt("total"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return o;
    }

    public ArrayList<Orders> getOrders() {
        ArrayList<Orders> orderlines = new ArrayList<>();

        String sql = " SELECT `orders`.`id`, orders.orderdate,`orders`.`userid`,        `product`.`name`,    `orders`.`total`,    `orders`.`status` ,`user`.`name` as userName \n"
                + "FROM `swp391`.`user` \n"
                + "                JOIN `swp391`.`orders`\n"
                + "                ON `swp391`.`orders`.`userid`=`swp391`.`user`.`id`\n"
                + "                JOIN    `swp391`.`orderline` \n"
                + "                ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`\n"
                + "                JOIN     `swp391`.`product` \n"
                + "                ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`\n"
                + "GROUP BY id , name\n"
                + "ORDER BY id";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        int index = 0, total = 0;
        long flag = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                if (flag != rs.getLong("id")) {
                    orderlines.add(o);
                    flag = rs.getLong("id");
                    total = 0;
                    nameOfProduct = new ArrayList<String>();
                }
                o.setId(rs.getLong("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(rs.getString("userName"));
                o.setProductName(nameOfProduct);
                total = total + rs.getInt("total");
                o.setTotal(total);
                o.setStatus(rs.getString("status"));

                nameOfProduct.add(rs.getString("name"));
                o.setProductName(nameOfProduct);
                index = orderlines.size() - 1;
                orderlines.set(index, o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

    public ArrayList<Orders> getOrdersByCustomerByStatusByOrderDate(String selectedCustomer, String selectedStatus, String fromdate, String todate) {
        ArrayList<Orders> orders = new ArrayList<>();

        String sql = "SELECT \n"
                + "    `orders`.`id`, \n"
                + "    `orders`.`orderdate`, \n"
                + "    `orders`.`userid`, \n"
                + "    `product`.`name`, \n"
                + "    `orders`.`total`, \n"
                + "    `orders`.`status`,\n"
                + "    `user`.`name` AS userName\n"
                + "FROM \n"
                + "    `swp391`.`user` \n"
                + "JOIN \n"
                + "    `swp391`.`orders` ON `swp391`.`orders`.`userid` = `swp391`.`user`.`id`\n"
                + "JOIN \n"
                + "    `swp391`.`orderline` ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`\n"
                + "JOIN \n"
                + "    `swp391`.`product` ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`\n"
                + "WHERE\n"
                + "    `orders`.`id` IS NOT NULL " + selectedCustomer + selectedStatus + fromdate + todate +"\n"
                + "GROUP BY \n"
                + "    `orders`.`id`, `product`.`name`\n"
                + "ORDER BY \n"
                + "    `orders`.`id`;";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        long flag = 0;
        int index = 0, total = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                if (flag != rs.getLong("id")) {
                    orders.add(o);
                    flag = rs.getLong("id");
                    total = 0;
                    nameOfProduct = new ArrayList<String>();
                }
                o.setId(rs.getLong("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(rs.getString("userName"));
                o.setProductName(nameOfProduct);
                total = total + rs.getInt("total");
                o.setTotal(total);
                o.setStatus(rs.getString("status"));

                nameOfProduct.add(rs.getString("name"));
                o.setProductName(nameOfProduct);
                index = orders.size() - 1;
                orders.set(index, o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orders;
    }
}
