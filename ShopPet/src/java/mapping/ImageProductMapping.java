/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.ImageProduct;

/**
 *
 * @author 12050
 */
public class ImageProductMapping {
    public static ImageProduct daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String iamgeUrl = rs.getString("image_url");       
        int productId = rs.getInt("product_id");       
        try {
            ImageProduct oi = new ImageProduct(id, iamgeUrl, productId);
            return oi;
        } catch (Exception e) {
            Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
