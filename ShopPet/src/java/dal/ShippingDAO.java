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
import mapping.ShippingMapping;
import models.Order;
import models.OrderItem;
import models.Shipping;

/**
 *
 * @author ADMIN
 */
public class ShippingDAO {

    DBContext db = DBContext.getInstance();

    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public ArrayList<Shipping> getShippingsAll() {
        ArrayList<Shipping> shippings = new ArrayList<>();
        try {
            connection = db.getConnection();

            String sql = "select * from shop_pet.shipping";
            stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shipping s = ShippingMapping.daoToObject(rs);
                shippings.add(s);
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return shippings;
    }
   

    public Shipping getShippingById(int id) {

        try {

            connection = db.getConnection();

            String sql = "select * from shop_pet.shipping where id = ? ";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shipping s = ShippingMapping.daoToObject(rs);
                return s;
            }

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return null;
    }

     public void updateShippingStatus(int shippingId ,String status) {

        try {
            connection = db.getConnection();

            String sql_shippingSuccess = "update shop_pet.Shipping set done_at = now() where  id = ? ;";
            String sql_shippingCancel = "update shop_pet.Shipping set cancel_at = now() where  id = ? ;";

            if (status.equals(Shipping.STATUS_SUCCESS)){
            stm = connection.prepareStatement(sql_shippingSuccess);
            }
            if (status.equals(Shipping.STATUS_CANCEL)){
            stm = connection.prepareStatement(sql_shippingCancel);
            }
            
            stm.setInt(1, shippingId);
            stm.executeUpdate();

        } catch (Exception e) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }
    
    public int createShipping(Shipping shipping) {
        int shippingId = -1;
        try {
            String sql_createShipping = "insert into shop_pet.Shipping  (phone,shipping_price ,start_at) values (?, ?, now());";

            connection = db.getConnection();

            // create Shipping
            stm = connection.prepareStatement(sql_createShipping, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, shipping.getPhone());
            stm.setDouble(2, shipping.getShippingPrice());
            stm.executeUpdate();

            
            try ( ResultSet generatedKeys = stm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    shippingId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating Shipping failed, no ID obtained.");
                }
            }

        } catch (Exception e) {
           
                Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, e);
          
        } finally {
       
            db.closeConnection(rs, stm, connection);
        }
        
        return shippingId;
    }
    
    public List<Shipping> getShippingsById(List<Integer> shippingIds) {
        List<Shipping> list = new ArrayList<>();

        try {
            connection = db.getConnection();
            String query = "select * from shop_pet.Shipping where id  in (0 ";
            String temp = "";
            for (int i = 0; i < shippingIds.size(); i++) {
                temp += ",?";
            }
//            temp = temp.replaceFirst(",", "");
            temp += ")";
            
            query = query + temp;
            stm = connection.prepareStatement(query);
            for (int i = 0; i < shippingIds.size(); i++) {
                stm.setInt(i+1, shippingIds.get(i));
            }

           ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shipping s = ShippingMapping.daoToObject(rs);
                list.add(s);
            }

        } catch (Exception e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
           finally {
            db.closeConnection(rs, stm, connection);
        }
        return list;
    }
    
    public static void main(String[] args) {
        ShippingDAO db = new ShippingDAO();
        System.out.println("shipping : " + db.getShippingById(1));
    }
}
