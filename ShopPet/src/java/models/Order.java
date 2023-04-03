/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Order {
    @Positive(message = "ID must a Positive number")
    private int id;
    private Timestamp createAt;
     @Pattern(regexp = "^"+STATUS_ACCEPT+"$"
          + "|^"+STATUS_DENY+"$")
    private String status;
     private String customerName;
     private String customerPhone;
     private String customerAddress;
     private double totalPrice; 
     

    private int shippingId;
    private Shipping shipping;
    private int accountId;
    
    private ArrayList<Integer> items_id = new ArrayList<>() ;
    
    private ArrayList<OrderItem> items = new ArrayList<>();
    
    
    public static final String STATUS_ACCEPT = "ACCEPT";
    public static final String STATUS_DENY = "DENY"; 
     public static final String STATUS_NULL = "NULL"; 

    public Order() {
         this.id = OrderItem.ID_NULL;
        this.createAt = Timestamp.from(Instant.now());
        this.status = null;
        this.shippingId = OrderItem.ID_NULL;
        this.accountId = OrderItem.ID_NULL;
    }

    public Order(int id, Timestamp createAt, String status, String customerName, String customerPhone, String customerAddress, double totalPrice, int shippingId, int accountId) {
        this.id = id;
        this.createAt = createAt;
        this.status = status;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.totalPrice = totalPrice;
        this.shippingId = shippingId;
        this.accountId = accountId;
    }

    



   

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }    

    public ArrayList<Integer> getItems_id() {
        return items_id;
    }

    public void setItems_id(ArrayList<Integer> items_id) {
        this.items_id = items_id;
    }

    public ArrayList<OrderItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<OrderItem> items) {
        this.items = items;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    
    
    
}
