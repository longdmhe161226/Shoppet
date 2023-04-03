/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import dal.CartDAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;

/**
 *
 * @author win
 */
public class CategoryMapping {
    public static Category daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String description = rs.getString("description");
        String image=rs.getString("image");
        try {
            Category c = new Category(id, name, description,image);
            return c;
        } catch (Exception e) {
             Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }

    }
}
