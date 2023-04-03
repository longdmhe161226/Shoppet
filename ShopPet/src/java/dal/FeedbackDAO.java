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
import mapping.FeedbackMapping;
import models.Feedback;
import models.OrderInfo;

/**
 *
 * @author ADMIN
 */
public class FeedbackDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public void createFeedback(Feedback feedback) {
        try {
            String sql_createFeedback = "insert into shop_pet.feedback (content, star, created_at, is_deleted, order_item_id) values (? , ?, now(), false, ?);";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql_createFeedback);
            stm.setString(1, feedback.getContent());
            stm.setInt(2, feedback.getStar());
            stm.setInt(3, feedback.getOrderItemId());
            stm.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }

    public void updateFeedback(Feedback feedback) {

        try {
            connection = db.getConnection();

            String sql = "update shop_pet.Feedback set content = ?, star = ?, updated_at = now() where  id = ? ;";

            stm = connection.prepareStatement(sql);
            stm.setString(1, feedback.getContent());
            stm.setInt(2, feedback.getStar());
            stm.setInt(3, feedback.getId());
            stm.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }
    
    public List<Feedback> getFeedbackByOrderItem(List<Integer> orderItemIds) {
        List<Feedback> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String query = "select * from shop_pet.feedback where order_item_id  in ( ";
            String temp = "";
            for (int i = 0; i < orderItemIds.size(); i++) {
                temp += ",?";
            }
            temp = temp.replaceFirst(",", "");
            temp += ")";

            query = query + temp;
            stm = connection.prepareStatement(query);
            for (int i = 0; i < orderItemIds.size(); i++) {
                stm.setInt(i + 1, orderItemIds.get(i));
            }

            rs = stm.executeQuery();
            
            while (rs.next()) {
                Feedback product = FeedbackMapping.daoToObject(rs);
                list.add(product);
                 
            }

        } catch (Exception e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return list; 
    }

    
     public Feedback getFeedbackByItem(int orderItemId) {
      Feedback feedback = null;
        try {
            System.out.println("in out");
            connection = db.getConnection();
            String query = "select * from shop_pet.feedback where order_item_id  =?;";
            System.out.println("in quẻy");
            stm = connection.prepareStatement(query);
           stm.setInt(1, orderItemId);

            rs = stm.executeQuery();
            
            while (rs.next()) {
                feedback = FeedbackMapping.daoToObject(rs);
                
                 
            }

        } catch (Exception e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return feedback; 
    }
    public void deleteFeedback(int feedbackId) {
        try {
            String sql_createFeedback = "delete from shop_pet.feedback where id = ?;";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql_createFeedback);
            stm.setInt(1, feedbackId);
            stm.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }
}
