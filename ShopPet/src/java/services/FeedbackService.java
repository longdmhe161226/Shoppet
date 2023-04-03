/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.FeedbackDAO;
import dal.OrderItemDAO;
import models.Feedback;
import models.OrderItem;

/**
 *
 * @author ADMIN
 */
public class FeedbackService {
    FeedbackDAO feedbackDAO = null;
     OrderItemDAO orderItemDAO = null;
    public FeedbackService() {
        feedbackDAO = new FeedbackDAO();
         orderItemDAO = new OrderItemDAO();
    }
    
    public void addItemFeedback(Feedback feedback){
        // OrderItem i = orderItemDAO.getOrderItem(feedback.getItemId());
        // if (i == null) {Do sth}
        feedbackDAO.createFeedback(feedback);
    }

    public void deleteItemFeedback(int feedbackId) {
        feedbackDAO.deleteFeedback(feedbackId);
    }
    
    public void editItemFeedback(Feedback feedback) {
        feedbackDAO.updateFeedback(feedback);
    }
    
    public OrderItem getOrderItemByFeedbackId(int feedbackId) {
        return orderItemDAO.getOrderItemByFeedbackId(feedbackId);
    }
    public Feedback getFeedbackByOrderItem(int orderItemId) {
        System.out.println("ind sẻvic");
        return feedbackDAO.getFeedbackByItem(orderItemId);
    }
    
}
