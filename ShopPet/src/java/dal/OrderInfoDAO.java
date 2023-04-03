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
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.OrderInfoMapping;
import models.OrderInfo;

/**
 *
 * @author ADMIN
 */
public class OrderInfoDAO {

    DBContext db = DBContext.getInstance();

    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public ArrayList<OrderInfo> getOrderInfoByAccountId(int accountId) {
        ArrayList<OrderInfo> orderInfos = new ArrayList<>();

        try {
            connection = db.getConnection();

            String sql = "select * from shop_pet.orderInfo where account_id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo orderInfo = OrderInfoMapping.daoToObject(rs);
                orderInfos.add(orderInfo);
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return orderInfos;
    }

    public OrderInfo getOrderInfoById(int orderInfoId) {

        try {
            connection = db.getConnection();

            String sql = "select * from shop_pet.orderInfo where id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderInfoId);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo orderInfo = OrderInfoMapping.daoToObject(rs);
                return orderInfo;
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return null;
    }

    public int createOrderInfo(OrderInfo orderInfo) {

        int result = 0;
        try {
            connection = db.getConnection();

            String sql = "insert into shop_pet.OrderInfo  (customer_name, phone, address_detail, street, city, account_id) values (?, ?, ?, ?, ?, ?);";

            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, orderInfo.getCustomerName());
            stm.setString(2, orderInfo.getPhone());
            stm.setString(3, orderInfo.getAddressDetail());
            stm.setString(4, orderInfo.getStreet());
            stm.setString(5, orderInfo.getCity());
            stm.setInt(6, orderInfo.getAccountId());
            stm.executeUpdate();

            try ( ResultSet generatedKeys = stm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    result = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating Order Info failed, no ID obtained.");
                }
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return result;
    }

    public void editOrderInfo(OrderInfo orderInfo) {

        try {
            connection = db.getConnection();

            String sql = "update shop_pet.OrderInfo set customer_name = ?, phone = ?, address_detail = ?, street = ?, city = ? where  id = ? ;";

            stm = connection.prepareStatement(sql);
            stm.setString(1, orderInfo.getCustomerName());
            stm.setString(2, orderInfo.getPhone());
            stm.setString(3, orderInfo.getAddressDetail());
            stm.setString(4, orderInfo.getStreet());
            stm.setString(5, orderInfo.getCity());
            stm.setInt(6, orderInfo.getId());
            stm.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }

    public void deleteOrderInfo(int orderInfoId) {
        try {

            String sql_deleteOrderInfo = "delete from shop_pet.OrderInfo where id = ? ;";
//            String sql_removeOrderForeginKey = "update shop_pet.`order` set address_id = null where address_id = ?";

            connection = db.getConnection();
            connection.setAutoCommit(false);

//            // remove foreginkey
//            PreparedStatement stm_removeOrderForeginKey = connection.prepareStatement(sql_removeOrderForeginKey);
//            stm_removeOrderForeginKey.setInt(1, orderInfoId);
//            stm_removeOrderForeginKey.executeUpdate();

            // delete OrderInfo
            stm = connection.prepareStatement(sql_deleteOrderInfo);
            stm.setInt(1, orderInfoId);
            stm.executeUpdate();

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
}
