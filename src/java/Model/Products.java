/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author toanl
 */
public class Products {
    Long id;
    String name;
    double price;
    String description;
    String maker;
    int status;
    int inventory;
    int categoryid;

    public Products() {
    }

    public Products(Long id, String name, double price, String description, String maker, int status, int inventory, int categoryid) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.maker = maker;
        this.status = status;
        this.inventory = inventory;
        this.categoryid = categoryid;
    }



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", maker=" + maker + ", status=" + status + ", inventory=" + inventory + ", categoryid=" + categoryid + '}';
    }
    
    
}
