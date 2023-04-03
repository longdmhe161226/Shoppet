/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Cart {
    private int id;
    private double price;
    private ArrayList<CartItem> items;
    private int accountId;

    public Cart() {
        this.items = new ArrayList<>();
    }

    public Cart(int id, double price) {
        this.id = id;
        this.price = price;
        this.items = new ArrayList<>();
    }

    public Cart(int id, double price, int accountId) {
        this.id = id;
        this.price = price;
        this.accountId = accountId;
        this.items = new ArrayList<>();
    }
    

    public ArrayList<CartItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<CartItem> items) {
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
