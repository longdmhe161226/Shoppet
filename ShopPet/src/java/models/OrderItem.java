/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.PositiveOrZero;

/**
 *
 * @author ADMIN
 */

public class OrderItem {
    @Positive(message = "ID must a Positive number")
    private int id;
    
    @NotEmpty(message = "Product name must not empty")
    private String productName;
    
    private String productImage;
    
    @PositiveOrZero(message = "price must a Positive number")
    private double price;
    
    
    @Positive(message = "quantity must a Positive number")
    private int quantity;
    
    @Positive(message = "ID must a Positive number" )
    private int productId;
    
    @Positive(message = "ID must a Positive number" )
    private int orderId;
    
    @Valid()
    private Product product;
public static final int ID_NULL = -1;
private static final String PRODUCT_NAME_NULL = "PRODUCT NAME";
private static final int QUANTITY_NULL = -1;
private static final int PRICE_NULL = -1;

private Feedback feedback;
    public OrderItem() {
        this.id = ID_NULL;
        this.productName = PRODUCT_NAME_NULL;
        this.price = PRICE_NULL;
        this.quantity = QUANTITY_NULL;
        this.productId = ID_NULL;
        this.orderId = ID_NULL;
    }

    public OrderItem(int id, String productName, String productImage, double price, int quantity, int productId, int orderId) {
        this.id = id;
        this.productName = productName;
        this.productImage = productImage;
        this.price = price;
        this.quantity = quantity;
        this.productId = productId;
        this.orderId = orderId;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    
    
    
    
    
    
}
