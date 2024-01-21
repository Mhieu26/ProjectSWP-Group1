/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.User;

/**
 *
 * @author DELL
 */
public class UserDAO extends MyDAO{
    
    
    
    public void updatePassword(User x, String newPassword) {
        xSql = "UPDATE [dbo].[user]\n"
                + "   SET [password] =?\n"
                + " WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, newPassword);
            ps.setInt(2, x.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
