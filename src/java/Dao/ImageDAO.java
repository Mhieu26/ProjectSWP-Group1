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
 
         public Image getThumbnailImagebyProductID(Long pID) {
        String sql = "     select i.id, i.source, i.type, i.productid, i.blogid, i.sliderid, i.userid  from image i join product p on p.id=i.productid\n" +
"where i.type=\"thumbnail\" and i.productid= ? ";
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
        
//             public static void main(String[] args) {
//                 ImageDAO pd=new ImageDAO();
//                 try {
//                        
//      Image list=pd.getThumbnailImagebyProductID(Long.parseLong("5"));
//                 
//                     System.out.println(list.getSource());
//                     
//                 } catch (Exception e) {
//                     System.out.println("false");
//                 }
//     
//                 
//    }

}
