/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class OrderLine {

    private int id;
    private int quantity;
    private int price;
    private int orderID;
    private int saleID;
    private int productID;
    private LocalDateTime orderDate;
    private LocalDateTime endDate;
    private String status;
    private String saleNote ;
    private Products product;
    private User saler;

    public User getSaler() {
        return saler;
    }

    public void setSaler(User saler) {
        this.saler = saler;
    }
    
    public String getSaleNote() {
        return saleNote;
    }

    public OrderLine(int id, int quantity, int price, int orderID, int saleID, int productID, LocalDateTime orderDate, LocalDateTime endDate, String status, String saleNote, Products product) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
        this.saleID = saleID;
        this.productID = productID;
        this.orderDate = orderDate;
        this.endDate = endDate;
        this.status = status;
        this.saleNote = saleNote;
        this.product = product;
    }

    public Products getProduct() {
        return product;
    }

    public void setProduct(Products product) {
        this.product = product;
    }
    

    public void setSaleNote(String saleNote) {
        this.saleNote = saleNote;
    }

    public OrderLine(int id, int quantity, int price, int orderID, int saleID, int productID, LocalDateTime orderDate, LocalDateTime endDate, String status, String saleNote) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
        this.saleID = saleID;
        this.productID = productID;
        this.orderDate = orderDate;
        this.endDate = endDate;
        this.status = status;
        this.saleNote = saleNote;
    }
    
    public OrderLine() {
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public OrderLine(int id, int quantity, int price, int orderID, int saleID, int productID, LocalDateTime orderDate, LocalDateTime endDate, String status) {
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
        this.saleID = saleID;
        this.productID = productID;
        this.orderDate = orderDate;
        this.endDate = endDate;
        this.status = status;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    @Override
    public String toString() {
        return "OrderLine{" + "id=" + id + ", quantity=" + quantity + ", price=" + price + ", orderID=" + orderID + ", saleID=" + saleID + ", productID=" + productID + ", orderDate=" + orderDate + ", endDate=" + endDate + ", status=" + status + ", saleNote=" + saleNote + ", product=" + product + ", saler=" + saler + '}';
    }
    

}
