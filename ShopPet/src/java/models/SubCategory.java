/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author win
 */
public class SubCategory {
    private int id;
    private String name;
    private String description;
    private int categoryId;
    private List<Category> Categories;

    public SubCategory() {
    }

    public SubCategory(int id, String name, String description, int categoryId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.categoryId = categoryId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public List<Category> getCategories() {
        return Categories;
    }

    public void setCategories(List<Category> Categories) {
        this.Categories = Categories;
    }

    @Override
    public String toString() {
        return "SubCategory{" + "id=" + id + ", name=" + name + ", description=" + description + ", Categories=" + Categories + '}';
    }

    

    
  
}
