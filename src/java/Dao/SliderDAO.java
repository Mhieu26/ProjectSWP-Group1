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
    
    public void deleteSlider(long id) {

        String sql = " delete from slider where id = ? ";
        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void createSlider(Slider slider) {

        String sql = " insert into slider(title, backlink, status, image) values(?, ?, ?, ?) ";
        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, slider.getTitle());
            statement.setString(2, slider.getBackLink());
            statement.setBoolean(3, true);
            statement.setString(4, slider.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Slider getSliderById(long id) {
        Slider slider = null;

        String sql = " select * from slider where id = ? ";
        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                slider = new Slider();
                slider.setId(rs.getLong("id"));
                slider.setTitle(rs.getString("title"));                
                slider.setBackLink(rs.getString("backlink"));
                slider.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return slider;
    }
    
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
