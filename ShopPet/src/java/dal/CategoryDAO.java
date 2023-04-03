/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.CategoryMapping;
import models.Category;


/**
 *
 * @author win
 */
public class CategoryDAO {
    DBContext db = DBContext.getInstance();
    Connection connection = null ;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category c = CategoryMapping.daoToObject(rs);
                list.add(c);
            }

        } catch (Exception e) {
        }
        return list;
    }
    public  List<Category> getCatbyId(int id){
        List<Category> list = new ArrayList<>();
         String query = "select * from category where id ="+id;
         try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                Category a = CategoryMapping.daoToObject(rs);
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Category getCatByID(int id) {
        // Thực hiện truy vấn tới database để lấy thông tin sản phẩm dựa theo id
        // Ví dụ:

        try {
            connection = db.getConnection();
            String sql = "SELECT * FROM shop_pet.categoty WHERE id = " + id;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                Category cat = CategoryMapping.daoToObject(rs);
                return cat;
            }
        } catch (Exception e) {
            Logger.getLogger(PetDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return null;
    }    
     public static void main(String[] args) {
        CategoryDAO dal = new CategoryDAO();
         System.out.println(dal.getAllCategory());
     }   
        
    }    
    

