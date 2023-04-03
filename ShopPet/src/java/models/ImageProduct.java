/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author 12050
 */
public class ImageProduct {
    private int id;
    private String img;
    private int productId;
    
    

    public ImageProduct() {
    }

    public ImageProduct(int id, String img, int productId) {
        this.id = id;
        this.img = img;
        this.productId = productId;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "ImageProduct{" + "id=" + id + ", img=" + img + ", productId=" + productId + '}';
    }

    

    
    

    
    
}
