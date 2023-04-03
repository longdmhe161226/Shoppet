/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.CartItemMapping;
import models.CartItem;

/**
 *
 * @author ADMIN
 */
public class CartItemDAO {
    
    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    
    public ArrayList<CartItem> getCartItemByCartId(int cartId) {
        ArrayList<CartItem> items = new ArrayList<>();
        try {
            
            String sql_getItemByCart = "SELECT * FROM shop_pet.cartitem where cart_id = ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql_getItemByCart);
            stm.setInt(1, cartId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CartItem i = CartItemMapping.daoToObject(rs);
                
                items.add(i);
            }
            
        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            
            db.closeConnection(rs, stm, connection);
        }
        return items;
    }
    
    public CartItem getCartItem(int cartId, int productId) {
        
        try {
            
            String sql_getCartItem = "SELECT * FROM shop_pet.cartitem where cart_id = ? and product_id = ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql_getCartItem);
            stm.setInt(1, cartId);
            stm.setInt(2, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                 CartItem i = CartItemMapping.daoToObject(rs);
                 return i;
            }
            
        } catch (Exception e) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return null;
    }
    
    public void createCartItem(int cartId, int productId, int quantity) {
        try {
            
            String sql_createCartItem = "insert into shop_pet.cartitem (quantity,cart_id,product_id) values (?, ?, ?);";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_createCartItem);
            stm.setInt(1, quantity);
            stm.setInt(2, cartId);
            stm.setInt(3, productId);
            stm.executeUpdate();
            
            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, sqle);
            }
        } finally {
            db.closeConnection(rs, stm, connection);
        }
    }
    
    public void updateCartItem(int cartItemId, int quantity) {
        try {
            
            String sql_updateCartItem = "update shop_pet.cartitem set quantity = ? where id = ?;";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_updateCartItem);
            stm.setInt(1, quantity);
            stm.setInt(2, cartItemId);
            stm.executeUpdate();
            
            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, sqle);
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
    
    public void deleteCartItem(int cartItemId) {
        try {
            
            String sql_deleteCartItem = "delete from shop_pet.cartitem where id = ?;";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_deleteCartItem);
            stm.setInt(1, cartItemId);
            stm.executeUpdate();
            
            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, sqle);
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
    
    public void clearCartItem(int cartId) {
        try {
            
            String sql_clearCartItem = "delete from shop_pet.cartitem where cart_id = ?;";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_clearCartItem);
            stm.setInt(1, cartId);
            stm.executeUpdate();
            
            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, sqle);
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
    
    
    public void clearCartItemByProduct(int cartId, int productId) {
        try {
            
            String sql_clearCartItem = "delete from shop_pet.cartitem where cart_id = ? and product_id = ?;";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_clearCartItem);
            stm.setInt(1, cartId);
            stm.setInt(2, productId);
            stm.executeUpdate();
            
            connection.commit();
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, sqle);
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
