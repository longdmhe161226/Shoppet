/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.OrderMapping;
import models.Order;
import models.OrderItem;
import models.Paging;
import models.Shipping;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

//    public static void main(String[] args) {
//        String string = "select o.*\n"
//                + "from shop_pet.`order` o \n"
//                + "left join shop_pet.orderitem oi on  o.id = oi.order_id \n"
//                + "left join shop_pet.product p on oi.product_id = p.id\n"
//                + "left join shop_pet.shipping s on s.id = o.shipping_id\n"
//                + "where  o.account_id = ? \n"
//                + "and o.address_id = ?\n"
//                + "and  oi.product_name like '%?%'\n"
//                + "and o.`status` is not null\n"
//                + "and s.done_at is not null\n"
//                + "and cancel_at is not null\n"
//                + "order by null\n"
//                + ", o.created_at\n"
//                + ";";
//        System.out.println("" + string.replaceAll("\n", ""));
//    }

    public Paging<Order> getAccountOrdersWithConditions(int accountId, String productName, String orderStatus, String shippingStatus, boolean sortByCreated, int limit, int pageIndex) {
        List<Order> orders = new ArrayList<>();
        int itemCount = 0;
        try {
            connection = db.getConnection();
            String sql = "select distinct o.*\n"
                    + "from shop_pet.`order` o \n"
                    + "left join shop_pet.orderitem oi on  o.id = oi.order_id \n"
                    + "left join shop_pet.product p on oi.product_id = p.id\n"
                    + "left join shop_pet.shipping s on s.id = o.shipping_id\n"
                    + "where  o.account_id = ? ";
            // where conditsion
            sql = sql + ((productName == null || productName.trim().equals("")) ? "" : "and oi.product_name like '%" + productName + "%' ");
//            sql = sql + ((orderStatus == null || orderStatus.trim().equals("")) ? ""
//                    : (orderStatus.equals(Order.STATUS_NULL.toUpperCase()) ? "and o.`status` is not null" : "and o.`status` = '%" + orderStatus+ "%'"));

            if (orderStatus != null) {
                sql = sql + (orderStatus.equals(Order.STATUS_NULL.toUpperCase()) ?  "and o.`status` is null " :""  );
                sql = sql + (orderStatus.equals(Order.STATUS_ACCEPT.toUpperCase()) ?   "and o.`status` = 'ACCEPT' " : "" );
                sql = sql + (orderStatus.equals(Order.STATUS_DENY.toUpperCase()) ?   "and o.`status` = '%" + orderStatus+ "%' " : "" );
            }
            
            if (shippingStatus != null ) {
                sql = sql + (shippingStatus.equals(Shipping.STATUS_SHIPPING.toUpperCase()) ?  "and (s.cancel_at is null and s.done_at is null) and o.`status` = 'ACCEPT' ":"");
                sql = sql + (shippingStatus.equals(Shipping.STATUS_SUCCESS.toUpperCase()) ? "and s.done_at is not null and o.`status` = 'ACCEPT' ": "" );
                sql = sql + (shippingStatus.equals(Shipping.STATUS_CANCEL.toUpperCase()) ? "and s.cancel_at is not null and o.`status` = 'ACCEPT' "  : "");
            }

            // get count
            String sql_itemCount = sql.replaceFirst("distinct o.*", " count( distinct o.id)") + ";";
            PreparedStatement stm_itemCount = connection.prepareStatement(sql_itemCount);
            stm_itemCount.setInt(1, accountId);
            ResultSet rs_count = stm_itemCount.executeQuery();
            while (rs_count.next()) {
                itemCount = rs_count.getInt(1);
            }

            sql = sql + "order by null ";
            // order by condition
            sql = sql + (sortByCreated ? ", created_at desc ":"");

            // pagging
            sql = sql + " limit ? offset ? ";

            sql = sql + ";";
            System.out.println("sql " + sql  );
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, limit);
            stm.setInt(3, (pageIndex - 1) * limit);

            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = OrderMapping.daoToObject(rs);
                orders.add(order);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }

        return (new Paging<Order>(itemCount,
                limit,
                pageIndex,  
                (itemCount%limit)==0? (itemCount/limit) :(itemCount/limit)+1 ,
                orders));
    }

    
    public Paging<Order> getOrdersWithConditions( String customerName, String customerPhone ,String customerAddress, String orderStatus, String shippingStatus, String dateFrom, String dateTo, int limit, int pageIndex) {
        List<Order> orders = new ArrayList<>();
        int itemCount = 0;
        try {
            connection = db.getConnection();
            String sql = "select distinct o.*\n"
                    + "from shop_pet.`order` o \n"
                    + "left join shop_pet.orderitem oi on  o.id = oi.order_id \n"
                    + "left join shop_pet.product p on oi.product_id = p.id\n"
                    + "left join shop_pet.shipping s on s.id = o.shipping_id\n"
                    + "where  1=1 ";
            // where conditsion
            sql = sql + ((customerName == null || customerName.trim().equals("")) ? "" : "and o.customer_name like " + "'%"+customerName+ "%' ");
            sql = sql + ((customerPhone == null || customerPhone.trim().equals("")) ? "" : "and o.customer_phone like " + "'%"+customerPhone+ "%' ");
            sql = sql + ((customerAddress == null || customerAddress.trim().equals("")) ? "" : "and o.customer_address like '%" + customerAddress + "%' ");
//            sql = sql + ((orderStatus == null || orderStatus.trim().equals("")) ? ""
//                    : (orderStatus.equals(Order.STATUS_NULL.toUpperCase()) ? "and o.`status` is not null" : "and o.`status` = '%" + orderStatus+ "%'"));

            if (orderStatus != null) {
                sql = sql + (orderStatus.equals(Order.STATUS_NULL.toUpperCase()) ?  "and o.`status` is null " :""  );
                sql = sql + (orderStatus.equals(Order.STATUS_ACCEPT.toUpperCase()) ?   "and o.`status` = 'ACCEPT' " : "" );
                sql = sql + (orderStatus.equals(Order.STATUS_DENY.toUpperCase()) ?   "and o.`status` = '%" + orderStatus+ "%' " : "" );
            }else {
                 sql = sql +"and o.`shipping_id` is not null ";
            }
            
            if (shippingStatus != null ) {
                sql = sql + (shippingStatus.equals(Shipping.STATUS_SHIPPING.toUpperCase()) ?  "and (s.cancel_at is null and s.done_at is null) and o.`status` = 'ACCEPT' ":"");
                sql = sql + (shippingStatus.equals(Shipping.STATUS_SUCCESS.toUpperCase()) ? "and s.done_at is not null and o.`status` = 'ACCEPT' ": "" );
                sql = sql + (shippingStatus.equals(Shipping.STATUS_CANCEL.toUpperCase()) ? "and s.cancel_at is not null and o.`status` = 'ACCEPT' "  : "");
            }
            
             sql = sql + ((dateFrom == null || dateFrom.trim().equals("")) ? "" : "and o.created_at >=" + "'"+dateFrom+ "' ");
             sql = sql + ((dateTo == null || dateTo.trim().equals("")) ? "" : "and o.created_at >=" + "'"+dateTo+ "' ");


            // get count
            String sql_itemCount = sql.replaceFirst("distinct o.*", " count( distinct o.id)") + ";";
            PreparedStatement stm_itemCount = connection.prepareStatement(sql_itemCount);
            ResultSet rs_count = stm_itemCount.executeQuery();
            while (rs_count.next()) {
                itemCount = rs_count.getInt(1);
            }

            sql = sql + "order by null ";
            // order by condition
            sql = sql + ", o.status asc ";
            sql = sql + ", o.created_at desc ";

            // pagging
            sql = sql + " limit ? offset ? ";

            sql = sql + ";";
            System.out.println("sql " + sql  );
            stm = connection.prepareStatement(sql);
            stm.setInt(1, limit);
            stm.setInt(2, (pageIndex - 1) * limit);

            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = OrderMapping.daoToObject(rs);
                orders.add(order);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }

        return (new Paging<Order>(itemCount, limit, pageIndex, (itemCount/limit)+1 ,orders));
    }
    
     public ArrayList<Order> getOrderNeedShip() {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            connection = db.getConnection();

            String sql = "select o.(*) from  shop_pet.`shipping` s left join shop_pet.`order` o  on s.id = o.shipping_id order by s.done_at asc, s.cancel_at asc, s.start_at asc, o.create_at asc Limit 20;";
            stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = OrderMapping.daoToObject(rs);
                orders.add(o);
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return orders;
    }
    
     public Order getOrderByShippingId(int shippingId) {
        Order o = null;

        try {
            connection = db.getConnection();

            String sql = "select * from shop_pet.`order` where shipping_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, shippingId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 o = OrderMapping.daoToObject(rs);
                
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return o;
    }
     
    public ArrayList<Order> getOrdersByAccountId(int accountId) {
        ArrayList<Order> orders = new ArrayList();

        try {
            connection = db.getConnection();

            String sql = "select * from shop_pet.`order` where account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = OrderMapping.daoToObject(rs);
                orders.add(o);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return orders;
    }

    public Order getOrderById(int orderId) {

        try {
            String sql = "select * from shop_pet.`order` where id = ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = OrderMapping.daoToObject(rs);
                return order;
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return null;
    }

    public void createOrder(Order order) {
        try {
            String sql_createOrder = "insert into shop_pet.`order` ( `customer_name`, `customer_phone`, `customer_address`, created_at,`status`,`total_price` , account_id) values (?,?,?,now(), null, ?, ?);";
//            String sql_getCreatedOrder = "select * from shop_pet.`order` where account_id = ? order by created_at desc limit 1;";
            String sql_createOrderItem = "insert into shop_pet.orderitem (order_id, product_id, product_name,product_image, price, quantity) values (?, ?, ?,?, ?, ?)";

            connection = db.getConnection();
            connection.setAutoCommit(false);

            // create Order
            stm = connection.prepareStatement(sql_createOrder, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, order.getCustomerName());
            stm.setString(2, order.getCustomerPhone());
            stm.setString(3, order.getCustomerAddress());
            stm.setDouble(4, order.getTotalPrice());
//            stm.setInt(5, order.getShippingId());
            stm.setInt(5, order.getAccountId());
            stm.executeUpdate();

            // get created
//            PreparedStatement stm_getCreatedOrder = connection.prepareStatement(sql_getCreatedOrder);
//            stm_getCreatedOrder.setInt(1, order.getAccountId());
//            rs = stm_getCreatedOrder.executeQuery();
//            if (rs.next()) {
//                order.setId(rs.getInt("id"));
//            }
            try ( ResultSet generatedKeys = stm.getGeneratedKeys()) {
                System.out.println("go key " + generatedKeys.toString());
                if (generatedKeys.next()) {
                    order.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating Order failed, no ID obtained.");
                }
            }

            // create Order Item
            for (OrderItem i : order.getItems()) {
//                         "insert into shop_pet.orderitem (order_id, product_id, produc_name, price, quantity) values (?, ?, ?, ?, ?)";

                PreparedStatement stm_createOrderItem = connection.prepareStatement(sql_createOrderItem);
                stm_createOrderItem.setInt(1, order.getId());
                stm_createOrderItem.setInt(2, i.getProductId());  // product_id
                stm_createOrderItem.setString(3, i.getProductName()); // produc_name
                stm_createOrderItem.setString(4, i.getProductImage()); // produc_image
                stm_createOrderItem.setDouble(5, i.getPrice()); // price
                stm_createOrderItem.setInt(6, i.getQuantity()); // quantity
                
                stm_createOrderItem.executeUpdate();
            }

            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            } catch (SQLException sqle) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, sqle);
            }

        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            db.closeConnection(rs, stm, connection);
        }
    }

    public int editStatusOrder(int orderId, String status) {
        int result = 0;
        try {
            String sql = "update shop_pet.`order`  set `status` = ? where id = ? ;";
            connection = db.getConnection();

            stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setInt(2, orderId);
            result = stm.executeUpdate();
        } catch (Exception e) {
            try {
                connection.rollback();
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            } catch (SQLException sqle) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, sqle);
            }

        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            db.closeConnection(rs, stm, connection);
        }

        // if success return id
        if (result > 0) {
            return orderId;
        } else {
            return -1;
        }
    }

    public int addShippingOrder(int orderId, int shippingId) {
        int result = 0;
        try {
            String sql = "update shop_pet.`order` set shipping_id = ?, total_price=total_price+(select shipping_price from shop_pet.shipping where id =?) where id = ? ;";
            connection = db.getConnection();

            stm = connection.prepareStatement(sql);
            stm.setInt(1, shippingId);
            stm.setInt(2, shippingId);
            
            stm.setInt(3, orderId);
            result = stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {

            db.closeConnection(rs, stm, connection);
        }

        // if success return id
        if (result > 0) {
            return orderId;
        } else {
            return -1;
        }
    }
   public int countOrder() {
        int count=0;
        try {
            connection = db.getConnection();
            String query = "select count(*) from shop_pet.order;";
            stm = connection.prepareStatement(query);
            rs=stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }
    public static void main(String[] args) {
        OrderDAO p = new OrderDAO();
        System.out.println(p.countOrder());
    }
}
