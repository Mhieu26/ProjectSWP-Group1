/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Role;

/**
 * object that get roles in aplication
 * @author Admin
 */
public class RoleDAO extends DBContext {

    public Role getRoleById(long id) {
        String sql = " select * from role where id=" + id;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Role role = new Role(rs.getLong("id"), rs.getString("role"));

                return role;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

}
