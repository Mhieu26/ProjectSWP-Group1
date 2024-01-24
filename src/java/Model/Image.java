/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 * class represent image on web page like: avt, product,thumbnail,...
 * @author Admin
 */
public class Image {
    private long id;
    private String source;
    private String type;
    private Long productId = null;
    private Long blogId = null;
    private Long sliderId = null;
    private Long userId = null;

    public Image() {
    }

    public Image(long id, String source, String type, Long productId, Long blogId, Long sliderId, Long userId) {
        this.id = id;
        this.source = source;
        this.type = type;
        this.productId = productId;
        this.blogId = blogId;
        this.sliderId = sliderId;
        this.userId = userId;
    }

    

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getBlogId() {
        return blogId;
    }

    public void setBlogId(Long blogId) {
        this.blogId = blogId;
    }

    public Long getSliderId() {
        return sliderId;
    }

    public void setSliderId(Long sliderId) {
        this.sliderId = sliderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    
}
