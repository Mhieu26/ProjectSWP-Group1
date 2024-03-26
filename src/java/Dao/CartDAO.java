/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Cart;
import Model.CartItem;
import java.sql.Date;
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
    //pay with momo
    public void insertOrder(Long id, Date orderdate, double total, String status, Long userid) {
        String sql = " Insert into Orders(id, orderdate, total, status, userid)\n"
                + "Values(?,?,?,?,?); ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, id);
            statement.setDate(2, orderdate);
            statement.setDouble(3, total);
            statement.setString(4, status);
            statement.setLong(5, userid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertOrderLine(int quantity, double price, Long orderid, Long saleid, Long productid, Date orderdate, String status) {
        String sql = " Insert into OrderLine(quantity, price, orderid, saleid, productid, orderdate, status)\n"
                + "Values(?,?,?,?,?,?,?); ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, quantity);
            statement.setDouble(2, price);
            statement.setLong(3, orderid);
            statement.setLong(4, saleid);
            statement.setLong(5, productid);
            statement.setDate(6, orderdate);
            statement.setString(7, status);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertMomo(String partnerCode, String requestId, Long amount, String signature,
            String recipientName, String recipientAddr, String recipientPhone, Long orderid) {
        String sql = " Insert into Momo(partnerCode, requestId, amount, signature"
                + ", recipientName, recipientAddr, recipientPhone, orderid)\n"
                + "values(?,?,?,?,?,?,?,?); ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, partnerCode);
            statement.setString(2, requestId);
            statement.setLong(3, amount);
            statement.setString(4, signature);
            statement.setString(5, recipientName);
            statement.setString(6, recipientAddr);
            statement.setString(7, recipientPhone);
            statement.setLong(8, orderid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Long getSaleId() {
        String sql = " select* from user\n"
                + "where roleid = 3 ";

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getLong("id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateStatusOrder(Long orderid) {
        String sql = " update Orders\n"
                + "set status = \"pending\"\n"
                + "where id = ? ;\n";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, orderid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateStatusOrderLine(Long orderid){
        String sql = " update OrderLine\n"
                + "set status = \"pending\"\n"
                + "where orderid = ? ; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, orderid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateInventory(Long productid, int inventory) {
        String sql = " Update Product "
                + " Set inventory = ? "
                + " Where id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, inventory);
            statement.setLong(2, productid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void clearCartItems(Long cartid){
        String sql = "delete from cartitem\n"
                + "where cartid = ?; ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, cartid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void clearCart(Long cartid) {
        String sql = " update cart\n"
                + "set total = 0\n"
                + "where id = ?;\n";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1, cartid);

            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


}
