/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.OrderDAO;
import dal.OrderInfoDAO;
import dal.OrderItemDAO;
import dal.ProductDAO;
import dal.ShippingDAO;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Cart;
import models.CartItem;
import models.Feedback;
import models.Order;
import models.OrderInfo;
import models.OrderItem;
import models.Paging;
import models.Product;
import models.Shipping;

/**
 *
 * @author ADMIN
 */
public class OrderService {

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;
    private CartService cartService;
    private OrderInfoDAO orderInfoDAO;
    private ProductDAO productDAO;
    private ShippingService shippingService;
    private FeedbackService feedbackService;

    public static void main(String[] args) {
        OrderService os = new OrderService();
//        System.out.println("order His" + os.get(
//                2,
//                null,
//                null,
//                null,
//                null,
//                false,
//                5,
//                1
//        ).getItems().toString());
    }

    public OrderService() {
        orderDAO = new OrderDAO();
        orderItemDAO = new OrderItemDAO();
        cartService = new CartService();
        orderInfoDAO = new OrderInfoDAO();
        shippingService = new ShippingService();
        feedbackService = new FeedbackService();
        productDAO = new ProductDAO();
    }

    public OrderInfo addOrderInfo(OrderInfo info) {
        int orderId = orderInfoDAO.createOrderInfo(info);
        return this.getOrderInfoById(orderId);
    }

    public void editOrderInfo(OrderInfo info) {
        orderInfoDAO.editOrderInfo(info);
    }

    public void deleteOrderInfo(int orderInfoId) {
        orderInfoDAO.deleteOrderInfo(orderInfoId);
    }

    ;
    
    public Order getOrderByOrderItemId(int orderItemId) {
        OrderItem oi = orderItemDAO.getOrderItemById(orderItemId);
        if (oi == null) {
            return null;
        }
        Order o = orderDAO.getOrderById(oi.getOrderId());
        Shipping s = shippingService.getShippingById(o.getShippingId());
        o.setShipping(s);

        return o;
    }

    public OrderInfo getOrderInfoById(int orderInfoId) {
        return orderInfoDAO.getOrderInfoById(orderInfoId);
    }

    public void createOrderByAdmin() {

    }

    public Order getOrderById(int orderId) {
        Order o = orderDAO.getOrderById(orderId);

        if (o != null) {
            Shipping s = shippingService.getShippingById(o.getShippingId());
            o.setShipping(s);

            List<OrderItem> listItem = orderItemDAO.getOrderItemByOrderId(orderId);
            for (OrderItem item : listItem) {
                System.out.println("sdad" + item.getId());
                Product p = productDAO.getProductById(item.getProductId());
                Feedback feedback = feedbackService.getFeedbackByOrderItem(item.getId());
                item.setProduct(p);
//                System.out.println("sdad" + feedback);
                item.setFeedback(feedback);
            }
            o.setItems((ArrayList) listItem);
        }

        return o;
    }

    public List<OrderInfo> getOrderInfo(int accountId) {
        return orderInfoDAO.getOrderInfoByAccountId(accountId);
    }

    public void acceptOrder(int orderId, double price) {
        orderDAO.editStatusOrder(orderId, Order.STATUS_ACCEPT);
        int shippingId = shippingService.createShipping(price);

        if (shippingId > 0) {
            orderDAO.addShippingOrder(orderId, shippingId);
        }
    }

    public void denyOrder(int orderId) {
        Order order = this.getOrderById(orderId);
//        System.out.println("Order sadd + " + order.getStatus());
        if (order!=null &&  (order.getStatus()==null || !order.getStatus().equalsIgnoreCase(Order.STATUS_DENY))) {
            orderDAO.editStatusOrder(orderId, Order.STATUS_DENY);
            // update Product after deny Order
            for (OrderItem item : order.getItems()) {
                productDAO.updateProductQuantity(
                        item.getProductId(),
                        item.getProduct().getQuantity() + item.getQuantity()
                );
            }
        }

    }

    public void createOrder(Account account, String customerName, String customerPhone, String customerAddress) {
        // get Cart
        Cart c = cartService.getCart(account.getId());

        double totalPrice = 0;
        // create order Item
        List<OrderItem> items = new ArrayList<>();
        for (CartItem cartItem : c.getItems()) {
            OrderItem item = new OrderItem();
            item.setProductId(cartItem.getProductId());
            item.setProductName(cartItem.getProduct().getName());
            item.setProductImage(cartItem.getProduct().getImageProduct().get(0).getImg());
            item.setQuantity(cartItem.getQuantity());
            item.setPrice(cartItem.getProduct().getPrice());
            item.setProduct(cartItem.getProduct());
            items.add(item);
            totalPrice = totalPrice + (item.getPrice() * item.getQuantity());
        }

        // Update Order Attribute
        Order order = new Order();
        order.setCustomerName(customerName);
        order.setCustomerPhone(customerPhone);
        order.setCustomerAddress(customerAddress);
        order.setAccountId(account.getId());
        order.setTotalPrice(totalPrice);
        order.setItems((ArrayList<OrderItem>) items);

        if (totalPrice <= 0) {
            return;
        }

        orderDAO.createOrder(order);

        // update Product quantity after Order
        for (OrderItem item : order.getItems()) {
            productDAO.updateProductQuantity(
                    item.getProductId(),
                    item.getProduct().getQuantity() - item.getQuantity()
            );
        }

        cartService.clearCart(account.getId());
    }

    public Paging<Order> getOrderHistory(int accountId, String productName, String orderStatus, String shippingStatus, boolean sortByCreated, int limit, int pageIndex) {
        Paging<Order> customerOrderHistory = orderDAO.getAccountOrdersWithConditions(
                accountId,
                productName,
                orderStatus,
                shippingStatus,
                sortByCreated,
                limit,
                pageIndex
        );
        List<Integer> shippingIds = new ArrayList<>();
        List<Integer> orderIds = new ArrayList<>();
        for (Order item : customerOrderHistory.getItems()) {
            shippingIds.add(item.getShippingId());
            orderIds.add(item.getId());
        }

        List<Shipping> shippings = shippingService.getShippingsById(shippingIds);
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderIds(orderIds);
        for (Order item : customerOrderHistory.getItems()) {
            for (Shipping p : shippings) {
                if (p.getId() == item.getShippingId()) {
                    item.setShipping(p);
                }
            }

            for (OrderItem oi : orderItems) {
                if (oi.getOrderId() == item.getId()) {
                    System.out.println("order + " + item.getId() + "orderItem + " + oi.getOrderId());
                    item.getItems().add(oi);
                }
            }

        }
        return customerOrderHistory;
    }

    public Paging<Order> getAllOrder(String customerName, String customerPhone, String customerAddress, String orderStatus, String shippingStatus, String dateFrom, String dateTo, int limit, int pageIndex) {
        Paging<Order> customerOrderHistory = orderDAO.getOrdersWithConditions(
                customerName,
                customerPhone,
                customerAddress,
                orderStatus,
                shippingStatus,
                dateFrom,
                dateTo,
                limit,
                pageIndex
        );
        List<Integer> shippingIds = new ArrayList<>();
        List<Integer> orderIds = new ArrayList<>();
        for (Order item : customerOrderHistory.getItems()) {
            shippingIds.add(item.getShippingId());
            orderIds.add(item.getId());
        }

        List<Shipping> shippings = shippingService.getShippingsById(shippingIds);
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderIds(orderIds);
        for (Order item : customerOrderHistory.getItems()) {
            for (Shipping p : shippings) {
                if (p.getId() == item.getShippingId()) {
                    item.setShipping(p);
                }
            }

            for (OrderItem oi : orderItems) {
                if (oi.getOrderId() == item.getId()) {
                    System.out.println("order + " + item.getId() + "orderItem + " + oi.getOrderId());
                    item.getItems().add(oi);
                }
            }

        }
        return customerOrderHistory;
    }

    public Order getOrderByShippingId(int shippingId) {
        Order o = orderDAO.getOrderByShippingId(shippingId);
        List<OrderItem> listItems = orderItemDAO.getOrderItemByOrderId(o.getId());
        for (OrderItem item : listItems) {
            Product p = productDAO.getProductById(item.getProductId());
            item.setProduct(p);
        }
        return o;
    }
}
