/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class OrderInfo {
    private int id;
    private String customerName;
    private String phone;
    private String addressDetail;
    private String street;
    private String city;
    private int accountId;

    class City {
    private String city;
     private List<String> listStreet ;

        public City() {
        }

        public City(String city, List<String> listStreet) {
            this.city = city;
            this.listStreet = listStreet;
        }
     
    }
    
    public final static  List<String> listCity = new ArrayList<>(Arrays.asList("Hà Nội", "TP. HCM", "Sơn Tây"));
    public final static  List<String> listStreet = new ArrayList<>(Arrays.asList("Nguyễn Trãi", "Thăng Long", "Hòa Kiếm"));


    
     public OrderInfo() {
    }

    public OrderInfo(int id, String customerName, String phone, String addressDetail, String street, String city, int accountId) {
        this.id = id;
        this.customerName = customerName;
        this.phone = phone;
        this.addressDetail = addressDetail;
        this.street = street;
        this.city = city;
        this.accountId = accountId;
    }
    public OrderInfo(int id, String customerName, String phone, String addressDetail, String street, String city) {
        this.id = id;
        this.customerName = customerName;
        this.phone = phone;
        this.addressDetail = addressDetail;
        this.street = street;
        this.city = city;
    }
    public OrderInfo(String customerName, String phone, String addressDetail, String street, String city, int accountId) {
        this.customerName = customerName;
        this.phone = phone;
        this.addressDetail = addressDetail;
        this.street = street;
        this.city = city;
        this.accountId = accountId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

   
    
}
