/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Cart;
import Model.CartItem;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * get cart data from db
 *
 * @author Admin
 */
public class CartDAO extends DBContext {

    public List<CartItem> getCartItemsByUserID(Long userid) {
        String sql = " select ci.cartid, c.total, c.userid, ci.quantity\n"
                + "			, ci.price, ci.id, ci.productid\n"
                + "            ,p.name, p.price as \"unitprice\"\n"
                + "            , i.source\n"
                + "from cart c left outer join cartitem ci on c.id = ci.cartid\n"
                + "			join product p on ci.productid = p.id\n"
                + "            join image i on ci.productid = i.productid\n"
                + "where c.userid = ? and i.type = \"thumbnail\" ";
        List<CartItem> cartitems = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, userid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem(rs.getLong("id"), rs.getLong("productid"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("source"), rs.getLong("cartid"));
                cartitems.add(item);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cartitems;
    }

    public Cart getCartByUserID(Long userid) {
        String sql = " Select * from cart where userid = ? ";
        Cart cart = new Cart();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, userid);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                cart.setId(rs.getLong("id"));
                cart.setUserid(userid);

                cart.setItems(getCartItemsByUserID(userid));

                cart.setTotal();
            }

        } catch (SQLException e) {

        }
        return cart;
    }

    public void setCartTotal(Long cartid, double total) {
        String sql = " update cart set total = ? Where id = ? ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, total);
            statement.setLong(2, cartid);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCartItem(Long cartItemId) {
        String sql = " Delete from CartItem where id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, cartItemId);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getInventoryById(Long id) {
        String sql = " Select product.inventory from product where id = ?";
        int inventory = -1;
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                inventory = rs.getInt("inventory");
                return inventory;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return inventory;
    }

    public CartItem getCartItemById(Long id) {
        String sql = " select * from CartItem join Product on cartitem.productid = product.id where CartItem.id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                CartItem item = new CartItem();
                item.setId(id);
                item.setQuantity(rs.getInt("quantity"));
                item.setProductid(rs.getLong("productid"));
                item.setName(rs.getString("name"));
                item.setPrice(rs.getDouble("price"));
                return item;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCartItem(Long id, int quantity, double price) {
        String sql = " update cartitem \n"
                + " set quantity = ?, price = ? \n"
                + " where id = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setDouble(2, price);
            statement.setLong(3, id);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertNewCartItem(int quantity, double price, Long cartid, Long productid) {
        String sql = "insert into cartitem(quantity, price, cartid, productid)\n"
                + "values(?, ?, ?, ?);";
        
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setDouble(2, price);
            statement.setLong(3, cartid);
            statement.setLong(4, productid);
            
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CartDAO dao = new CartDAO();
        Cart cart = dao.getCartByUserID(new Long(76));

        System.out.println(cart);

    }

}
