/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Product;

/**
 *
 * @author 12050
 */
public class ProductMapping {

    public static Product daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String code = rs.getString("code");
        float price = rs.getFloat("price");
        int quantity = rs.getInt("quantity");
        String description = rs.getString("description");
        Date deletedAt = rs.getDate("deleted_at");
        int petId = rs.getInt("pet_id");
        int subcategoryId = rs.getInt("subcategory_id");
         int originId = rs.getInt("origin_id");
         
        try {
            Product oi = new Product(id, name, code, price, quantity, description, deletedAt, petId, subcategoryId,originId);
            return oi;
        } catch (Exception e) {
            Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
