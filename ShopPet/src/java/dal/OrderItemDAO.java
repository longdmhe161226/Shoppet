/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.OrderItemMapping;
import models.OrderItem;

/**
 *
 * @author ADMIN
 */
public class OrderItemDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public OrderItem getOrderItemById(int orderItemId) {
        OrderItem item = null;
        try {

            String sql_getItemByOrder = "select * from shop_pet.`orderitem` where id = ?;";
            connection = DBContext.getConnection();
            stm = connection.prepareStatement(sql_getItemByOrder);
            stm.setInt(1, orderItemId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 item = OrderItemMapping.daoToObject(rs);
                
            }

        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return item;
    }
    
    public OrderItem getOrderItemByFeedbackId(int feedbackId) {
        OrderItem item = null;
        try {

            String sql_getItemByOrder = "select oi.* from shop_pet.`orderItem` oi left join shop_pet.Feedback f on  oi.id = f.order_item_id where f.id= ?;;";
            connection = DBContext.getConnection();
            stm = connection.prepareStatement(sql_getItemByOrder);
            stm.setInt(1, feedbackId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 item = OrderItemMapping.daoToObject(rs);
                
            }

        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return item;
    }
    
    
    
    public ArrayList<OrderItem> getOrderItemByOrderId(int orderId) {
        ArrayList<OrderItem> items = new ArrayList<>();
        try {

            String sql_getItemByOrder = "select * from shop_pet.`orderitem` where order_id = ?;";
            connection = DBContext.getConnection();
            stm = connection.prepareStatement(sql_getItemByOrder);
            stm.setInt(1, orderId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderItem i = OrderItemMapping.daoToObject(rs);

                items.add(i);
            }

        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return items;
    }

    public List<OrderItem> getOrderItemsByOrderIds(List<Integer> orderIds) {
        List<OrderItem> items = new ArrayList<>();
        try {
            connection = db.getConnection();
            String query = "select * from shop_pet.OrderItem where order_id  in (0 ";
            String temp = "";
            for (int i = 0; i < orderIds.size(); i++) {
                temp += ",?";
            }
            temp += ");";

            query = query + temp;
            stm = connection.prepareStatement(query);
            for (int i = 0; i < orderIds.size(); i++) {
                stm.setInt(i + 1, orderIds.get(i));
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                OrderItem item = OrderItemMapping.daoToObject(rs);
                items.add(item);
            }

        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return items;
    }
}
