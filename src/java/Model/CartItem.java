/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * object represent each item in a cart
 * @author Admin
 */
public class CartItem {
    private Long id;
    private Long productid;
    private String name;
    private int quantity;
    private double price; // unit price * quantity
    private String source; // thumbnail url
    private Long cartid;

    public CartItem() {
    }

    public CartItem(Long id, Long productid, String name, int quantity, double price, String source, Long cartid) {
        this.id = id;
        this.productid = productid;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.source = source;
        this.cartid = cartid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCartid() {
        return cartid;
    }

    public void setCartid(Long cartid) {
        this.cartid = cartid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    

    public Long getProductid() {
        return productid;
    }

    public void setProductid(Long productid) {
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartItem{" + "id=" + id + ", productid=" + productid + ", name=" + name + ", quantity=" + quantity + ", price=" + price + ", source=" + source + ", cartid=" + cartid + '}';
    }

    
}
