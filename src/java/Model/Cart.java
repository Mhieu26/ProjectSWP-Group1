/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 * class represent each user's cart
 * @author Admin
 */
public class Cart {
    private Long id;
    private List<CartItem> items ;
    private double total;
    private Long userid;
    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(Long id, double total, Long userid, List<CartItem> items) {
        this.id = id;
        this.total = total;
        this.userid = userid;
        this.items = items;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    
    
    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal() {
        total = 0;
        for (CartItem item : items) {
            total += item.getPrice();
        }
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", items=" + items + ", total=" + total + ", userid=" + userid + '}';
    }

    
    
}
