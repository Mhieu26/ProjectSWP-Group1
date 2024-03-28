/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *Order :id , ngay dat hang , ten nguoi mua , ten nguoi ban , ten san pham , , trang thai
 * @author Admin
 */

import Dao.ProductsDAO;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class Orders {
    private int id;
    private LocalDateTime orderDate;
    private String userName;
    private ArrayList<String> productName;
    private int total;
    private String status;


    public Orders(int id, LocalDateTime orderDate, String userName, ArrayList<String> productName, int total, String status) {
        this.id = id;
        this.orderDate = orderDate;
        this.userName = userName;
        this.productName = productName;
        this.total = total;
        this.status = status;
    }
    public Orders() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProductName() {
        
            return productName.toString();
        
    }
    public ArrayList<Products> getListProduct() {
        ArrayList<Products> listProducts = new ArrayList<Products>();
        ArrayList<Products> filteredList = new ArrayList<Products>();
        ProductsDAO proDao = new ProductsDAO();
        listProducts = proDao.getProducts();
        for (Products product  : listProducts) {
            
                if(productName.contains(product.getName())){
                    filteredList.add(product);
                
            }
        }
        return filteredList;  
        
    }
    

    public void setProductName(ArrayList<String> productName) {
        this.productName = productName;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
