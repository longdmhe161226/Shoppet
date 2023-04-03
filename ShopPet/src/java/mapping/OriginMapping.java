/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Origin;

/**
 *
 * @author 12050
 */
public class OriginMapping {
    public static Origin daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String origin = rs.getString("region");       
               
        try {
            Origin oi = new Origin(id, origin);
            return oi;
        } catch (Exception e) {
            Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
