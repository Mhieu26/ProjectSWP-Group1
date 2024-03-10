/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Order;
import Model.Products;
import Model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext {

    public Order getOrderByID(long id) {
        try {
            Order order = new Order();
            String sql = "SELECT *\n"
                    + "FROM `swp391`.`orders` where id = ? ;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            UserDAO uDAO = new UserDAO();
            while (rs.next()) {

                order.setId(rs.getInt(1));
                order.setOrderDate(rs.getDate(2));
                order.setStatus(rs.getString(4));
                order.setTotal(rs.getInt(3));
                order.setUser(uDAO.getUserByID((long) rs.getInt("userid")));
            }
            return order;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public HashMap<String, Integer> getOrderByStatus() {
        try {
            HashMap<String, Integer> map = new HashMap<>();
            String sql = "SELECT status, COUNT(*) AS so_luong\n"
                    + "FROM orders\n"
                    + "GROUP BY status";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                map.put(rs.getString(1), rs.getInt(2));
            }
            return map;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Long getTotal() {
        try {
            String sql = "SELECT sum(total) FROM swp391.orders";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                return rs.getLong(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Order> getTop5Orders() {
        try {
            List<Order> orders = new ArrayList<>();
            String sql = "select * from orders order by id desc limit 5 ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setOrderDate(rs.getDate(2));
                order.setStatus(rs.getString(4));
                order.setTotal(rs.getInt(3));
                UserDAO udao = new UserDAO();
                User user = udao.getUserByID(rs.getInt(5));
                order.setUser(user);
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Order> getTop7Orders(Timestamp fromDate, Timestamp toDate) {
        try {
            List<Order> orders = new ArrayList<>();
            String sql = "select * from orders where `status` = 'complete' and orderdate >= ? and orderdate <= ? limit 7";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDate(1, Date.valueOf(fromDate.toLocalDateTime().toLocalDate()));
            statement.setDate(2, Date.valueOf(toDate.toLocalDateTime().toLocalDate()));
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setOrderDate(rs.getDate(2));
                order.setStatus(rs.getString(4));
                order.setTotal(rs.getInt(3));
                UserDAO udao = new UserDAO();
                User user = udao.getUserByID(rs.getInt(5));
                order.setUser(user);
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public HashMap<Products, Integer> getTop5Products() {
        try {
            HashMap<Products, Integer> map = new HashMap<>();
            String sql = "SELECT od.productid, SUM(od.quantity) AS total_quantity_sold\n"
                    + "FROM orderline od\n"
                    + "JOIN product p ON od.productid = p.id\n"
                    + "GROUP BY od.productid\n"
                    + "ORDER BY total_quantity_sold DESC\n"
                    + "LIMIT 5";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                ProductsDAO pdo = new ProductsDAO();
                Products products = pdo.getProductsbyID(rs.getInt(1));
                map.put(products, rs.getInt(2));
            }
            return map;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateOrderStatus(long orderID, String status) {

        String sql = "UPDATE `swp391`.`orders`\n"
                + "SET\n"
                + "`status` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setLong(2, orderID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public List<Order> getAllOrders() {
        try {
            List<Order> orders = new ArrayList<>();
            String sql = "select * from orders ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setOrderDate(rs.getDate(2));
                order.setStatus(rs.getString(4));
                order.setTotal(rs.getInt(3));
                orders.add(order);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
