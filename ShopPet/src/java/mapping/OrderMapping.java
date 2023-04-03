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
import models.Order;

/**
 *
 * @author ADMIN
 */
public class OrderMapping {

    public static Order daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String customerName = rs.getString("customer_name");
        String customerPhone = rs.getString("customer_phone");
        String customerAddress = rs.getString("customer_address");
        Timestamp createdAt = rs.getTimestamp("created_at");
        String status = rs.getString("status");
        double totalPrice = rs.getDouble("total_price");
        int shippingId = rs.getInt("shipping_id");
        int accountId = rs.getInt("account_id");
        try {
            Order o = new Order(id, createdAt, status, customerName, customerPhone, customerAddress, totalPrice, shippingId, accountId);
            return o;
        } catch (Exception e) {
             Logger.getLogger(OrderMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
