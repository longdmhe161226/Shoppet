/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.OrderItem;

/**
 *
 * @author ADMIN
 */
public class OrderItemMapping {
    public static OrderItem daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String productName = rs.getString("product_name");
        String productImage= rs.getString("product_image");
        double price = rs.getInt("price");
        int quantity = rs.getInt("quantity");
        int productId = rs.getInt("product_id");
        int orderId = rs.getInt("order_id");
        
        try {
            OrderItem oi = new OrderItem(id, productName, productImage, price, quantity, productId, orderId);
            return oi;
        } catch (Exception e) {
             Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    
    
}
