/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.OrderInfo;

/**
 *
 * @author ADMIN
 */
public class OrderInfoMapping {
      public static OrderInfo daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String customerName = rs.getString("customer_name");
        String phone = rs.getString("phone");
        String addressDetail = rs.getString("address_detail");
        String street = rs.getString("street");
        String city = rs.getString("city");
        int accountId = rs.getInt("account_id");

        
        try {
            OrderInfo oi = new OrderInfo(id,customerName, phone, addressDetail, street, city, accountId);
            return oi;
        } catch (Exception e) {
             Logger.getLogger(OrderInfoMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
