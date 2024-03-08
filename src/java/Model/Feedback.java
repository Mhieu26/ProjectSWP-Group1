/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author toanl
 */
public class Feedback {
    int id;
    String content;
    int star;
    Timestamp postdate;
    boolean status;
    int userid;
    int productid;
    int parentFeedback;

    public Feedback() {
    }

    public Feedback(int id, String content, int star, Timestamp postdate, boolean status, int userid, int productid, int parentFeedback) {
        this.id = id;
        this.content = content;
        this.star = star;
        this.postdate = postdate;
        this.status = status;
        this.userid = userid;
        this.productid = productid;
        this.parentFeedback = parentFeedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public Timestamp getPostdate() {
        return postdate;
    }

    public void setPostdate(Timestamp postdate) {
        this.postdate = postdate;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getParentFeedback() {
        return parentFeedback;
    }

    public void setParentFeedback(int parentFeedback) {
        this.parentFeedback = parentFeedback;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", content=" + content + ", star=" + star + ", postdate=" + postdate + ", status=" + status + ", userid=" + userid + ", productid=" + productid + ", parentFeedback=" + parentFeedback + '}';
    }
    
    
}
