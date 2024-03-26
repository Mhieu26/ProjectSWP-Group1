/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Image;
import Model.Products;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * object that get Images
 *
 * @author Admin
 */
public class ImageDAO extends DBContext {

    public Image getAvatarByUserId(Long userId) {
        String sql = "  select image.id, image.source, image.type, image.productid, image.blogid, image.sliderid, image.userid \n"
                + "from user join image on user.id = image.userid\n"
                + "where userid = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, userId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));
                img.setUserId(userId);

                return img;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Image getThumbnailImagebyProductID(Long pID) {
        String sql = "     select i.id, i.source, i.type, i.productid, i.blogid, i.sliderid, i.userid  from image i join product p on p.id=i.productid\n"
                + "where i.type=\"thumbnail\" and i.productid= ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, pID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));
                img.setProductId(pID);
                return img;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Image> getThumbmails() {
        String sql = "  select i.id, i.source, i.type, i.productid, i.blogid, i.sliderid, i.userid  from image i join product p on p.id=i.productid\n"
                + "where i.type=\"thumbnail\"";
        ArrayList<Image> imgs = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));
                img.setProductId(rs.getLong("productid"));
                imgs.add(img);
                
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return imgs;
    }

    public ArrayList<Image> getDetails() {
        String sql = "  select i.id, i.source, i.type, i.productid, i.blogid, i.sliderid, i.userid  from image i join product p on p.id=i.productid\n"
                + "where i.type=\"detail\"";
        ArrayList<Image> imgs = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));
                img.setProductId(rs.getLong("productid"));
                imgs.add(img);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return imgs;
    }

    public List<Image> getImagesByProductId(Long productid) {
        String sql = " select*\n"
                + "from product inner join image on product.id = image.productid\n"
                + "where product.id = ? \n"
                + "order by type desc ";
        List<Image> imgs = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, productid);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Image i = new Image();
                i.setId(rs.getLong(9));
                i.setSource(rs.getString(10));
                i.setType(rs.getString(11));
                i.setProductId(rs.getLong(12));

                imgs.add(i);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return imgs;
    }

    public void deleteImageById(Long id) {
        String sql = " delete from Image where id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertImage(String source, String type, Long productid) {

        String sql = " insert into Image(source, type, productid)\n"
                + "values(?, ?, ?) ";
        
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, source);
            statement.setString(2, type);
            statement.setLong(3, productid);
            
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }


}
