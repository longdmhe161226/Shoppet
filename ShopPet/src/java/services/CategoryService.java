/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.CategoryDAO;
import dal.SubCategoryDAO;
import java.util.List;
import models.Category;
import models.SubCategory;

/**
 *
 * @author win
 */
public class CategoryService {
    private CategoryDAO categoryDAO = null;
    private SubCategoryDAO subCategoryDAO = null;
    
    public CategoryService(){
        categoryDAO = new CategoryDAO();
        subCategoryDAO = new SubCategoryDAO();
    }
    
    
    public List<SubCategory> getSubAndCategory(){
        List<SubCategory> sub = subCategoryDAO.getAllSubCat();
        for (SubCategory subCategory : sub) {
            List<Category> cat = categoryDAO.getAllCategory();
            for (Category category : cat) {
                if (subCategory.getCategoryId()==category.getId()) {
                    subCategory.setCategories(cat);
                }
            }
          
        }
        return sub;
    }
    
    public List<SubCategory> getSubAndCategoryByID(int x){
        List<SubCategory> sub = subCategoryDAO.getSubCatbyId(x);
        for (SubCategory subCategory : sub) {
            List<Category> cat = categoryDAO.getCatbyId(subCategory.getCategoryId());
            for (Category category : cat) {
                if (subCategory.getCategoryId()==category.getId()) {
                    subCategory.setCategories(cat);
                }
            }
          
        }
        return sub;
    }
     public List<Category> getAllCategory(){
        List<Category> sub = categoryDAO.getAllCategory();
        return sub;
    }
    
    public static void main(String[] args) {
        CategoryService a = new CategoryService();
        
    }
}
