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
import models.Feedback;

/**
 *
 * @author ADMIN
 */
public class FeedbackMapping {

    public static Feedback daoToObject(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String content = rs.getString("content");
        int star = rs.getInt("star");;
        Timestamp createdAt = rs.getTimestamp("created_at");
        boolean isDeleted = rs.getBoolean("is_deleted");
        int orderItemId = rs.getInt("order_item_id");
        try {
            Feedback feedback = new Feedback(id, content, star, createdAt, isDeleted, orderItemId);
            return feedback;
        } catch (Exception e) {
            Logger.getLogger(FeedbackMapping.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
