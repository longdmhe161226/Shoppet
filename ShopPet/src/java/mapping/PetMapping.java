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
import models.Pet;

/**
 *
 * @author 12050
 */
public class PetMapping {
public static Pet daoToObject(ResultSet rs) throws SQLException {
        int petId = rs.getInt("id");
                Date dob = rs.getDate("date_of_birth");
                String healthStatus = rs.getString("health_status");
                boolean gender = rs.getBoolean("gender");
                float weight = rs.getFloat("weight");            
                String color = rs.getString("color");
                boolean vaccinated = rs.getBoolean("vaccinated");
                 String identification = rs.getString("identification");
                 
        try {
            Pet oi = new Pet(petId, dob, healthStatus, gender, weight, color, vaccinated, identification);
            return oi;
        } catch (Exception e) {
            Logger.getLogger(OrderItemMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
