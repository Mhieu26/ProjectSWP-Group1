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
        public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public String[][] getCompletedOrderLineDataCharts(String saleSelected) {
        String[][] data = null;

        String sql = "WITH DateRange AS (\n"
                + "    SELECT CURDATE() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS date\n"
                + "    FROM \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS a\n"
                + "        CROSS JOIN \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS b\n"
                + "        CROSS JOIN \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS c\n"
                + ")\n"
                + "SELECT \n"
                + "    DATE(DateRange.date) AS order_day,\n"
                + "    COUNT(orderline.orderdate) AS order_count\n"
                + "FROM \n"
                + "    DateRange\n"
                + "LEFT JOIN \n"
                + "    orderline ON DATE(orderline.orderdate) = DATE(DateRange.date) AND orderline.status = 'Complete' " + saleSelected + " \n"
                + "WHERE \n"
                + "    DateRange.date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)\n"
                + "GROUP BY \n"
                + "    order_day\n"
                + "ORDER BY \n"
                + "    order_day;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            ArrayList<String[]> dataList = new ArrayList<>();
            while (rs.next()) {
                String day = rs.getString("order_day");
                String order_count = String.valueOf(rs.getInt("order_count"));
                String[] row = {day, order_count};
                dataList.add(row);
            }

            data = new String[dataList.size()][];
            for (int i = 0; i < dataList.size(); i++) {
                data[i] = dataList.get(i);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public String[][] getAllOrderLineDataCharts(String saleSelected) {
        String[][] data = null;

        String sql = " WITH DateRange AS (\n"
                + "    SELECT CURDATE() - INTERVAL (a.a + (10 * b.a) + (100 * c.a)) DAY AS date\n"
                + "    FROM \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS a\n"
                + "        CROSS JOIN \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS b\n"
                + "        CROSS JOIN \n"
                + "        (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7) AS c\n"
                + ")\n"
                + "SELECT \n"
                + "    DATE(DateRange.date) AS order_day,\n"
                + "    COUNT(orderline.orderdate) AS order_count\n"
                + "FROM \n"
                + "    DateRange\n"
                + "LEFT JOIN \n"
                + "    orderline ON DATE(orderline.orderdate) = DATE(DateRange.date) " + saleSelected + " \n"
                + "WHERE \n"
                + "    DateRange.date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)\n"
                + "GROUP BY \n"
                + "    order_day\n"
                + "ORDER BY \n"
                + "    order_day;";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            ArrayList<String[]> dataList = new ArrayList<>();
            while (rs.next()) {
                String day = rs.getString("order_day");
                String order_count = String.valueOf(rs.getInt("order_count"));
                String[] row = {day, order_count};
                dataList.add(row);
            }

            data = new String[dataList.size()][];
            for (int i = 0; i < dataList.size(); i++) {
                data[i] = dataList.get(i);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public ArrayList<OrderLine> getOrderLines() {
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
                + "FROM `swp391`.`orderline`   ;";
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
                if(rs.getTimestamp("enddate")!=null){
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}}
                o.setStatus(rs.getString("status"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

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
                + "FROM `swp391`.`orderline` WHERE orderline.orderdate >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)  ;";
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
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

    public void updateEndDateForOrderLine(int orderLineID, String enddate) {

        String sql = "UPDATE `swp391`.`orderline`\n"
                + "SET\n"
                + "`enddate` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, enddate);
            statement.setInt(2, orderLineID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateOrderDateForOrderLine(int orderLineID, String orderdate) {

        String sql = "UPDATE `swp391`.`orderline`\n"
                + "SET\n"
                + "`orderdate` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, orderdate);
            statement.setInt(2, orderLineID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateStatusForOrderLine(int orderLineID, String status) {

        String sql = "UPDATE `swp391`.`orderline`\n"
                + "SET\n"
                + "`status` = ?\n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setInt(2, orderLineID);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public ArrayList<OrderLine> getOrderLinesBySaleID(long id) {
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
                + "                FROM `swp391`.`orderline`; ";
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
                o.setStatus(rs.getString("status"));
                o.setSaleNote(rs.getString("salenote"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return o;
    }

    public ArrayList<OrderLine> getOrderLinesBySaleIdByStatusByProductid(String selectedSale, String selectedStatus, String selectedProduct, String selectedStartDate, String selectedEndDate) {
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
                + "                FROM `swp391`.`orderline` Where id IS NOT NULL " + selectedSale + selectedStatus + selectedProduct + selectedStartDate + selectedEndDate + " ; ";
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
                o.setStatus(rs.getString("status"));
                o.setSaleNote(rs.getString("salenote"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }

    public ArrayList<OrderLine> getOrderLinesByStringSaleId(String selectedSale) {
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
                + "                FROM `swp391`.`orderline` Where orderline.orderdate >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) " + selectedSale + " ; ";
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
                if(rs.getTimestamp("enddate")!=null){
                o.setEndDate(rs.getTimestamp("enddate").toLocalDateTime());}
                o.setStatus(rs.getString("status"));
                o.setSaleNote(rs.getString("salenote"));
                orderlines.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderlines;
    }
    public static void main(String[] args) {
        OrderLineDAO od=new OrderLineDAO();
        ArrayList<OrderLine> list=od.getOrderLinesIn7Day();
        for (OrderLine orderLine : list) {
            System.out.println(orderLine);
            
        }
    }
}
