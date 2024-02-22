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
    public ArrayList<Orders> getOrdersByUserID(long id) {
        ArrayList<Orders> orderlines = new ArrayList<>();

        String sql = " SELECT `orders`.`id`, orders.orderdate,`orders`.`userid`,        `product`.`name`,    `orders`.`total`,    `orders`.`status` ,`user`.`name` as userName     \n" +
" FROM `swp391`.`user`     \n" +
"                 JOIN `swp391`.`orders`    \n" +
"                 ON `swp391`.`orders`.`userid`=`swp391`.`user`.`id`    \n" +
"                 JOIN    `swp391`.`orderline`     \n" +
"                 ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`    \n" +
"                 JOIN     `swp391`.`product`     \n" +
"                 ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`\n" +
"                  where userid = ?\n" +
" GROUP BY id , name    \n" +
" ORDER BY    id";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        int flag = 0, index =0,total =0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                if (flag != rs.getInt("id")) {
                    orderlines.add(o);
                    flag = rs.getInt("id");
                    total=0;
                    nameOfProduct = new ArrayList<String>();
                }
                o.setId(rs.getInt("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(rs.getString("userName"));
                o.setProductName(nameOfProduct);
                total=total+rs.getInt("total");
                o.setTotal(total);
                o.setStatus(rs.getString("status"));

                nameOfProduct.add(rs.getString("name"));    
                o.setProductName(nameOfProduct);
                index= orderlines.size()-1;
                orderlines.set( index, o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
    public ArrayList<Orders> getOrders(String condition) {
        User user = new User();
        UserDAO userDao = new UserDAO();
        ArrayList<Orders> orderlines = new ArrayList<>();

        String sql = " SELECT `orders`.`id`, orders.orderdate,`orders`.`userid`,        `product`.`name`,    `orders`.`total`,    `orders`.`status` ,`user`.`name` as userName \n" +
"FROM `swp391`.`user` \n" +
"                JOIN `swp391`.`orders`\n" +
"                ON `swp391`.`orders`.`userid`=`swp391`.`user`.`id`\n" +
"                JOIN    `swp391`.`orderline` \n" +
"                ON `swp391`.`orders`.`id` = `swp391`.`orderline`.`orderid`\n" +
"                JOIN     `swp391`.`product` \n" +
"                ON `swp391`.`orderline`.`productid` = `swp391`.`product`.`id`\n" +
"GROUP BY id , name\n" +
"ORDER BY  " + condition+"id";
        ArrayList<String> nameOfProduct = new ArrayList<String>();
        int flag = 0, index =0,total=0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Orders o = new Orders();
                if (flag != rs.getInt("id")) {
                    orderlines.add(o);
                    flag = rs.getInt("id");
                    total=0;
                    nameOfProduct = new ArrayList<String>();
                }
                o.setId(rs.getInt("id"));
                o.setOrderDate(rs.getTimestamp("orderdate").toLocalDateTime());
                o.setUserName(rs.getString("userName"));
                o.setProductName(nameOfProduct);
                total=total+rs.getInt("total");
                o.setTotal(total);
                o.setStatus(rs.getString("status"));

                nameOfProduct.add(rs.getString("name"));    
                o.setProductName(nameOfProduct);
                index= orderlines.size()-1;
                orderlines.set( index, o);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
}
