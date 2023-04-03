/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Shipping {
    private int id;
    private String phone;
    private Timestamp startAt ;
    private Timestamp doneAt ;
    private Timestamp cancelAt ;
    private Double shippingPrice;

     public static final String STATUS_SHIPPING = "SHIPPING"; 
     public static final String STATUS_SUCCESS = "SUCCESS"; 
     public static final String STATUS_CANCEL = "CANCEL"; 
     
     public static final String SHIPPER_PHONE = "0989898989"; 
    
    public Shipping() {
    }

    public Shipping(int id, String phone, Timestamp startAt, Timestamp doneAt, Timestamp cancelAt, Double shippingPrice) {
        this.id = id;
        this.phone = phone;
        this.startAt = startAt;
        this.doneAt = doneAt;
        this.cancelAt = cancelAt;
        this.shippingPrice = shippingPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Timestamp getStartAt() {
        return startAt;
    }

    public void setStartAt(Timestamp startAt) {
        this.startAt = startAt;
    }

    public Timestamp getDoneAt() {
        return doneAt;
    }

    public void setDoneAt(Timestamp doneAt) {
        this.doneAt = doneAt;
    }

    public Timestamp getCancelAt() {
        return cancelAt;
    }

    public void setCancelAt(Timestamp cancelAt) {
        this.cancelAt = cancelAt;
    }

    public Double getShippingPrice() {
        return shippingPrice;
    }

    public void setShippingPrice(Double shippingPrice) {
        this.shippingPrice = shippingPrice;
    }
    
    
    
}
