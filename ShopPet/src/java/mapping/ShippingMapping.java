/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Shipping;

/**
 *
 * @author ADMIN
 */
public class ShippingMapping {
        public static Shipping daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String phone = rs.getString("phone");
        Timestamp startAt = rs.getTimestamp("start_at");
        Timestamp doneAt = rs.getTimestamp("done_at");
        Timestamp cancelAt = rs.getTimestamp("cancel_at");
        double shippingPrice = rs.getInt("shipping_price");
        try {
            Shipping s = new Shipping(id, phone, startAt, doneAt, cancelAt, shippingPrice);
            return s;
        } catch (Exception e) {
             Logger.getLogger(ShippingMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
