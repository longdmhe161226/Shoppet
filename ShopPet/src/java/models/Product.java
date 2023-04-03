/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author win
 */
public class Product {

    private int id;
    private String name;
    private String code;
    private float price;
    private int quantity;
    private String description;
    private Date deleteAt;
    private int petId;
    private int subcategoryId;
    private int originId;
    private List<Origin> origin;
    private List<ImageProduct> imageProduct;
    private List<Pet> pet;
    private List<SubCategory> subCategorys;
    
    public Product() {
    }

    public Product(int id, String name, String code, float price, int quantity, String description, Date deleteAt,int petId,int subcategoryId,int originId) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.deleteAt = deleteAt;
        this.petId = petId;
        this.subcategoryId = subcategoryId;
        this.originId=originId;
    }

//    public Product(String name, String code, int price, int quantity, String description, int subId, int petId, String origin, String imgUrl, Date valueOf, String healthStatus, String gender, int weight, String color, String vaccinated, String identification) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    public int getOriginId() {
        return originId;
    }

    public void setOriginId(int originId) {
        this.originId = originId;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public int getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDeleteAt() {
        return deleteAt;
    }

    public void setDeleteAt(Date deleteAt) {
        this.deleteAt = deleteAt;
    }

    public List<ImageProduct> getImageProduct() {
        return imageProduct;
    }
    
    public void setImageProduct(List<ImageProduct> imageProduct) {
        this.imageProduct = imageProduct;
    }

    public List<Origin> getOrigin() {
        return origin;
    }

    public void setOrigin(List<Origin> origin) {
        this.origin = origin;
    }

    public List<Pet> getPet() {
        return pet;
    }

    public void setPet(List<Pet> pet) {
        this.pet = pet;
    }

    public List<SubCategory> getSubCategorys() {
        return subCategorys;
    }

    public void setSubCategorys(List<SubCategory> subCategorys) {
        this.subCategorys = subCategorys;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", code=" + code + ", price=" + price + ", quantity=" + quantity + ", description=" + description + ", deleteAt=" + deleteAt + ", origin=" + origin + ", imageProduct=" + imageProduct + ", pet=" + pet + ", subCategorys=" + subCategorys + '}';
    }
    
    

    

    

   

    
    
    
}
    

    
    
    
    

    

    

    


