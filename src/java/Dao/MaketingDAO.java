/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class MaketingDAO extends DBContext {

    public String[][] getDataCharts() {
        String[][] data = null;

        String sql = " SELECT MONTH(postdate) AS month, COUNT(*) AS post_count FROM blog GROUP BY MONTH(postdate) ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            ArrayList<String[]> dataList = new ArrayList<>();
            while (rs.next()) {
                int month = rs.getInt("month");
                String monthName = getMonthName(month);
                String postCount = String.valueOf(rs.getInt("post_count"));
                String[] row = {monthName, postCount};
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

    private static String getMonthName(int month) {
        switch (month) {
            case 1:
                return "January";
            case 2:
                return "February";
            case 3:
                return "March";
            case 4:
                return "April";
            case 5:
                return "May";
            case 6:
                return "June";
            case 7:
                return "July";
            case 8:
                return "August";
            case 9:
                return "September";
            case 10:
                return "October";
            case 11:
                return "November";
            case 12:
                return "December";
            default:
                return "";
        }
    }

    public int getStaticCustomers() {
        int value = 0;

        String sql = " select count(*) from user where roleid = 1 ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                value = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return value;
    }

    public int getStaticBlogs() {
        int value = 0;

        String sql = " select count(*) from blog ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                value = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return value;
    }

    public int getStaticProducts() {
        int value = 0;

        String sql = " select count(*) from product ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                value = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return value;
    }

    public int getStaticFeedBacks() {
        int value = 0;

        String sql = " select count(*) from feedback ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                value = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return value;
    }

}
