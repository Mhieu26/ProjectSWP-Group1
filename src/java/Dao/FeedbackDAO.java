/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Feedback;
import Model.Image;
import Model.Products;
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
public class FeedbackDAO extends DBContext {

    Connection cnn; // ket noi db
    Statement stm; // thuc thi cac cau lenh sql
    ResultSet rs; // luu tru va xu ly du lieu

    public ArrayList<Feedback> getFeedbackByProducgtID(int pID) {
        String sql = " select * from feedback where productid= ? and status= 1 ";
        ArrayList<Feedback> f = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, pID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setContent(rs.getString("content"));
                fb.setStar(rs.getInt("star"));
                fb.setPostdate(rs.getTimestamp("postdate"));
                fb.setStatus(rs.getBoolean("status"));
                fb.setUserid(rs.getInt("userid"));
                fb.setProductid(rs.getInt("productid"));
                fb.setParentFeedback(rs.getInt("parentFeedback"));
                f.add(fb);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }
    public ArrayList<Feedback> getAllFeedbackByProducgtID(int pID) {
        String sql = " select * from feedback where productid= ? ";
        ArrayList<Feedback> f = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, pID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setContent(rs.getString("content"));
                fb.setStar(rs.getInt("star"));
                fb.setPostdate(rs.getTimestamp("postdate"));
                fb.setStatus(rs.getBoolean("status"));
                fb.setUserid(rs.getInt("userid"));
                fb.setProductid(rs.getInt("productid"));
                fb.setParentFeedback(rs.getInt("parentFeedback"));
                f.add(fb);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }
    public void insertFeedback(String content, int star, long userid, int productid) {
        String sql = "insert into feedback(content,star,postdate,status,userid,productid)\n"
                + "values(?,?,(now() + interval 1 minute),1,?,?);";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, content);
            statement.setInt(2, star);
            statement.setLong(3, userid);
            statement.setInt(4, productid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteFeedback(int id) {
        String sql = " Delete from feedback where id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Feedback> getAllFeedback() {
        String sql = " SELECT * FROM swp391.feedback;";
        ArrayList<Feedback> f = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setContent(rs.getString("content"));
                fb.setStar(rs.getInt("star"));
                fb.setPostdate(rs.getTimestamp("postdate"));
                fb.setStatus(rs.getBoolean("status"));
                fb.setUserid(rs.getInt("userid"));
                fb.setProductid(rs.getInt("productid"));
                fb.setParentFeedback(rs.getInt("parentFeedback"));
                f.add(fb);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public static void main(String[] args) {
        FeedbackDAO fd = new FeedbackDAO();
        fd.deleteFeedback(Integer.parseInt("4"));

    }

    public void updateFeedbackStatus(int feedbackid, String status) {

        String sql = "UPDATE `swp391`.`feedback`\n"
                + "SET\n"
                + "`status` = ? \n"
                + "WHERE `id` = ? ;";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setBoolean(1, Boolean.parseBoolean(status));
            statement.setInt(2, feedbackid);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    public ArrayList<Feedback> getFeedbackByAllElenment(String status, String productid, String star, String content) {
        String sql = " SELECT * FROM swp391.feedback \n"
                + "WHERE id IS NOT NULL \n"
                + status
                + productid
                + star
                + content + ";";
        ArrayList<Feedback> f = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("id"));
                fb.setContent(rs.getString("content"));
                fb.setStar(rs.getInt("star"));
                fb.setPostdate(rs.getTimestamp("postdate"));
                fb.setStatus(rs.getBoolean("status"));
                fb.setUserid(rs.getInt("userid"));
                fb.setProductid(rs.getInt("productid"));
                fb.setParentFeedback(rs.getInt("parentFeedback"));
                f.add(fb);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }
     public Feedback getFeedbackByID(int fID) {
        String sql = "  SELECT * FROM swp391.feedback \n"
                + "WHERE id = ? ; ";
        Feedback fb = new Feedback();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, fID);
            ResultSet rs = statement.executeQuery();
             while (rs.next()) {             
                fb.setId(rs.getInt("id"));
                fb.setContent(rs.getString("content"));
                fb.setStar(rs.getInt("star"));
                fb.setPostdate(rs.getTimestamp("postdate"));
                fb.setStatus(rs.getBoolean("status"));
                fb.setUserid(rs.getInt("userid"));
                fb.setProductid(rs.getInt("productid"));
                fb.setParentFeedback(rs.getInt("parentFeedback"));

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return fb;
    }
}
