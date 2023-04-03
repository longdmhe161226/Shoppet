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
import mapping.ImageProductMapping;
import models.ImageProduct;

/**
 *
 * @author 12050
 */
public class ImageProductDAO {

    Connection connection = null;
    ResultSet rs = null;
    PreparedStatement stm = null;
    DBContext db = DBContext.getInstance();

    public List<ImageProduct> getAllImage() {

        List<ImageProduct> list = new ArrayList<>();
        String query = "select * from shop_pet.`ProductImage`";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);;
            rs = stm.executeQuery();
            while (rs.next()) {
                ImageProduct images = ImageProductMapping.daoToObject(rs);
                list.add(images);
            }

        } catch (Exception e) {
           
        
    }
        return list;
    }

    public List<ImageProduct> getImagebyProductID(int productId) {

        List<ImageProduct> list = new ArrayList<>();
        String query = "SELECT * FROM `shop_pet`.`ProductImage` WHERE  product_id= " + productId;
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                ImageProduct images = ImageProductMapping.daoToObject(rs);
                list.add(images);
            }

        } catch (Exception e) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return list;
    }

    public ImageProduct getImageByID(int productId) {
        // Thực hiện truy vấn tới database để lấy thông tin sản phẩm dựa theo id
        // Ví dụ:
        String sql = "SELECT * FROM `shop_pet`.`ProductImage` WHERE  product_id= " + productId;

        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                ImageProduct images = ImageProductMapping.daoToObject(rs);
                return images;
            }
        } catch (Exception e) {
            Logger.getLogger(ImageProductDAO.class.getName()).log(Level.SEVERE, null, e);
        } 
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return null;
    }
    public void insertImgProduct(int id,String imgUrl,int productId){
          try {
         connection = db.getConnection();
         String query = "INSERT INTO `shop_pet`.`ProductImage` (`id`, `image_url`, `product_id`) VALUES(?,?,?)";
         stm = connection.prepareStatement(query);
         stm.setInt(1, id);
         stm.setString(2, imgUrl);
         stm.setInt(3, productId);
         stm.executeUpdate();
          }catch(Exception e){
              Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
          }
     }
    public int getTotalImg() {

        try {

            connection = db.getConnection();
            String sql = "select count(*) from shop_pet.`ProductImage`";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return 0;
    }
    public int getMaxIDImg() {

        try {

            connection = db.getConnection();
            String sql = " select max(id) from shop_pet.`ProductImage`";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
//        finally {
//            db.closeConnection(rs, stm, connection);
//        }
        return 0;
    }
        public void updateImgProduct(int id,String imgUrl){
          try {
         connection = db.getConnection();
         String query = "UPDATE ProductImage  set image_url= ? WHERE product_id = ?";
         stm = connection.prepareStatement(query);
         stm.setString(1, imgUrl);
         stm.setInt(2, id);
         stm.executeUpdate();
          }catch(Exception e){
              Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
          }
     }
        public void deleteImgProduct(int id){
          try {               
         connection = db.getConnection();
         String query = "DELETE from  productimage WHERE product_id = ?";
         stm = connection.prepareStatement(query);
         stm.setInt(1, id);
        
         stm.executeUpdate();
          }catch(Exception e){
              Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
          }
     }

    public static void main(String[] args) {
        ImageProductDAO a = new ImageProductDAO();
        System.out.println(a.getImagebyProductID(1));
    }
}
