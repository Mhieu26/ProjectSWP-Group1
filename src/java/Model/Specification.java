/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author toanl
 */
public class Specification {
    int id;
    String name;
    String value;
    int productid;
    int cateid;

    public Specification() {
    }

    public Specification(int id, String name, String value, int productid, int cateid) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.productid = productid;
        this.cateid = cateid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    @Override
    public String toString() {
        return "Specification{" + "id=" + id + ", name=" + name + ", value=" + value + ", productid=" + productid + ", cateid=" + cateid + '}';
    }
    
}
