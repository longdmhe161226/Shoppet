/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.SubCategory;

/**
 *
 * @author win
 */
public class SubCategoryMapping {
   public static SubCategory daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        int categoryId = rs.getInt("category_id");
        
        try {
            SubCategory sb = new SubCategory(id, name, description, categoryId);
            return sb;
        } catch (Exception e) {
            Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }

    } 
}
