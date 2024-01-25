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

/**
 * object that get Images 
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
 
         public ArrayList<Image> getThumbnailImagebyProductID(int pID) {
        String sql = "     select i.id,i.source,i.type,i.productid,p.name,p.price,p.description,p.maker from image i join product p on p.id=i.productid\n" +
"where i.type=\"thumbnail\" and i.productid= ? ";
ArrayList<Image> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
              statement.setInt(1, pID);

            if (rs.next()) {             
                Image img = new Image();
                img.setId(rs.getLong("id"));
                img.setSource(rs.getString("source"));
                img.setType(rs.getString("type"));        
                img.setProductId(rs.getLong("productid"));
                list.add(img);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
        
             public static void main(String[] args) {
                 ImageDAO pd=new ImageDAO();
                 try {
                        
        ArrayList<Image> list=pd.getThumbnailImagebyProductID(1);
                 
                     System.out.println("success");
                     
                 } catch (Exception e) {
                     System.out.println("false");
                 }
     
                 
    }

}
