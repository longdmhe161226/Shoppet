/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.CartItem;

/**
 *
 * @author ADMIN
 */
public class CartItemMapping {
    public static CartItem daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int quantity = rs.getInt("quantity");
        int productId  = rs.getInt("product_id");
                
        
        try {
            CartItem i = new CartItem();
                i.setId(id);
                i.setQuantity(quantity);
                i.setProductId(productId);
            return i;
        } catch (Exception e) {
             Logger.getLogger(CartItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
