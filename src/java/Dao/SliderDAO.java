/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Role;
import Model.Slider;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class SliderDAO extends DBContext{
    
    public ArrayList<Slider> getSliders() {
        ArrayList<Slider> sliders = new ArrayList<>();

        String sql = " select * from slider ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getLong("id"));
                s.setTitle(rs.getString("title"));                
                s.setBackLink(rs.getString("backlink"));
                s.setImage(rs.getString("image"));

                sliders.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sliders;
    }
    
}
