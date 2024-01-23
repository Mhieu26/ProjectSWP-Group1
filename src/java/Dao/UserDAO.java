/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.xml.bind.DatatypeConverter;
import Model.Role;
import Model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();

        String sql = " select user.id, email, password, name, phone, address, sex, "
                + "status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                users.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return users;
    }

    public User getUserByLogin(String email, String hashPassword) {
        String sql = "select user.id, email, password, name, phone, address, sex, status, verificationCode, roleid, role \n"
                + "from user join role on user.roleid = role.id\n"
                + "where email=? AND password=? AND status = true";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, hashPassword);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(new Role(rs.getLong("roleid"), rs.getString("role")));

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        String sql = " select * from user where email = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                User u = new User();
                u.setId(rs.getLong("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setPhone(rs.getString("phone"));
                u.setAddress(rs.getString("address"));
                u.setSex(rs.getBoolean("sex"));
                u.setStatus(rs.getBoolean("status"));
                u.setVerificationCode(rs.getString("verificationCode"));
                u.setRole(null);

                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(String email, String password, String name, String phone, String address, boolean sex, String verificationCode) {
        String sql = " insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)\n "
                + " values(?, ?, ?, ?, ?, ?, null, ?, 1) ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, phone);
            statement.setString(5, address);
            statement.setBoolean(6, sex);
            statement.setString(7, verificationCode);

            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int verifyUser(String email, String verifyCode) {
        String sql = " update user\n"
                + " set status=true, verificationCode=null\n"
                + " Where email = ?  AND verificationCode = ? ";
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, verifyCode);
            row = statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return row;
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        UserDAO udb = new UserDAO();
//        ArrayList<User> users = udb.getUsers();
//
//        for (User u : users) {
//            System.out.println(u);
//        }

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update("123".getBytes());
        byte[] digest = md.digest();
        String hashPassword = DatatypeConverter
                .printHexBinary(digest).toUpperCase();

        System.out.println(udb.getUserByLogin("abc7@gmail.com", "202CB962AC59075B964B07152D234B70"));
        System.out.println(hashPassword);

    }

}
