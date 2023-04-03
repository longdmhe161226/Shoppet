/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.OrderDAO;
import dal.OrderItemDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.util.List;
import models.Order;
import models.OrderItem;
import models.Product;
import models.Shipping;

/**
 *
 * @author ADMIN
 */
public class ShippingService {

    private ShippingDAO shippingDAO = null;
    private OrderItemDAO orderItemDAO;

//    private OrderService orderService = null;
    private ProductDAO productDAO = null;
    private OrderDAO orderDAO = null;

    public ShippingService() {
        shippingDAO = new ShippingDAO();
        orderItemDAO = new OrderItemDAO();
        productDAO = new ProductDAO();
        orderDAO = new OrderDAO();
    }

    public int createShipping(double price) {
        Shipping shipping = new Shipping();
        shipping.setPhone(Shipping.SHIPPER_PHONE);
        shipping.setShippingPrice(price);

        return shippingDAO.createShipping(shipping);
    }

    public List<Shipping> getShippingsById(List<Integer> shippingIds) {
        return shippingDAO.getShippingsById(shippingIds);
    }

    public List<Shipping> getAllShipping() {
        return shippingDAO.getShippingsAll();
    }

    public List<Order> getShippingNeedShip() {
        List<Order> orderWithShipping = orderDAO.getOrderNeedShip();
        for (Order o : orderWithShipping) {
//            orderDAO.getOrderById(s)
            o.setShipping(shippingDAO.getShippingById(o.getShippingId()));
        }
        return orderWithShipping;
    }

    public Shipping getShippingById(int shippingId) {
        return shippingDAO.getShippingById(shippingId);
    }

    public void setShippingDone(int shippingId) {
        shippingDAO.updateShippingStatus(shippingId, Shipping.STATUS_SUCCESS);
        Order order = orderDAO.getOrderByShippingId(shippingId);

        
//        List<OrderItem> listItems = orderItemDAO.getOrderItemByOrderId(order.getId());
//        for (OrderItem item : listItems) {
//            Product p = productDAO.getProductById(item.getProductId());
//            item.setProduct(p);
//        }
//        // update Product quantity after Order
//        for (OrderItem item : order.getItems()) {
//            productDAO.updateProductQuantity(
//                    item.getProductId(),
//                    item.getProduct().getQuantity() - item.getQuantity()
//            );
//        }
    }

    public void setShippingCancel(int shippingId) {
        shippingDAO.updateShippingStatus(shippingId, Shipping.STATUS_CANCEL);
        Order order = orderDAO.getOrderByShippingId(shippingId);

        
        List<OrderItem> listItems = orderItemDAO.getOrderItemByOrderId(order.getId());
        for (OrderItem item : listItems) {
            Product p = productDAO.getProductById(item.getProductId());
            item.setProduct(p);
        }
        // update Product after deny Order
        for (OrderItem item : listItems) {
            productDAO.updateProductQuantity(
                    item.getProductId(),
                    item.getProduct().getQuantity() + item.getQuantity()
            );
        }
    }

}
