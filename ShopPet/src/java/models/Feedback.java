package models;

import java.sql.Timestamp;

public class Feedback {
    private int id;
    private String content;
    private int star;
    private Timestamp createdAt ;
    private boolean  isDeleted;
    
    private int orderItemId;

    public Feedback() {
    }

    public Feedback(int id, String content, int star, Timestamp createdAt, boolean isDeleted, int orderItemId) {
        this.id = id;
        this.content = content;
        this.star = star;
        this.createdAt = createdAt;
        this.isDeleted = isDeleted;
        this.orderItemId = orderItemId;
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public boolean isIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }
    
    
}
