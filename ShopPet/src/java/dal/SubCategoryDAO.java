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
import mapping.SubCategoryMapping;
import models.SubCategory;

/**
 *
 * @author win
 */
public class SubCategoryDAO {
    DBContext db = DBContext.getInstance();
    Connection connection = null ;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    public List<SubCategory> getAllSubCat() {
        List<SubCategory> list = new ArrayList<>();
        String query = "select * from subcategory";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory a = SubCategoryMapping.daoToObject(rs);
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public  List<SubCategory> getSubCatbyId(int id){
        List<SubCategory> list = new ArrayList<>();
         String query = "select * from subcategory where id ="+id;
         try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory a = SubCategoryMapping.daoToObject(rs);
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public SubCategory getSubCatByID(int id) {
        // Thực hiện truy vấn tới database để lấy thông tin sản phẩm dựa theo id
        // Ví dụ:

        try {
            connection = db.getConnection();
            String sql = "SELECT * FROM shop_pet.subcategoty WHERE id = " + id;
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                SubCategory cat = SubCategoryMapping.daoToObject(rs);
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
      public List<SubCategory> getNameSubCategoryByCategoryId(int categoryId) {
        List<SubCategory> list = new ArrayList<>();
        try {

            connection = db.getConnection();
            String sql = "select* from subcategory as s join category as c where s.category_id=c.id and c.id=?;";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            rs = stm.executeQuery();
           while (rs.next()) {
                SubCategory a = SubCategoryMapping.daoToObject(rs);
                list.add(a);
                }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list ;
    }
//test     
    public static void main(String[] args) {
        SubCategoryDAO dal = new SubCategoryDAO();
        
            System.out.println(dal.getNameSubCategoryByCategoryId(1));
        }
    
}
