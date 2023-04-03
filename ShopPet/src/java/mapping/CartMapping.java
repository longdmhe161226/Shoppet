/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Cart;

/**
 *
 * @author ADMIN
 */
public class CartMapping {
       public static Cart daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        double price  = rs.getDouble("price");
        int accountId = rs.getInt("account_id");
        
        try {
            Cart c = new Cart(id, price, accountId);
            return c;
        } catch (Exception e) {
             Logger.getLogger(CartMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
       
}
