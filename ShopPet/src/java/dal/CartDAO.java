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
import mapping.CartMapping;
import models.Cart;

/**
 *
 * @author ADMIN
 */
public class CartDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public static void main(String[] args) {
        System.out.println("cart: " + new CartDAO().getCartByAccountId(1).getPrice());
    }

    public ArrayList<Cart> getCarts(int accountId) {
        ArrayList<Cart> carts = new ArrayList();

        try {
            connection = db.getConnection();

            String sql = "SELECT * FROM shop_pet.cart";
            stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cart c = CartMapping.daoToObject(rs);
                carts.add(c);
            }

        } catch (Exception e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return carts;

    }

    public Cart getCartByAccountId(int accountId) {
        Cart cart = null;
        try {

            String sql_getCartByAccount = "SELECT * FROM shop_pet.cart where account_id = ?";
            connection = db.getConnection();
            stm = connection.prepareStatement(sql_getCartByAccount);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                cart = CartMapping.daoToObject(rs);
            }

        } catch (Exception e) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            db.closeConnection(rs, stm, connection);
        }
        return cart;
    }

    public Cart createCart(Cart c) {
        try {

            String sql_createCart = "insert into shop_pet.cart (price,account_id) values (0, ?);";
            connection = db.getConnection();
            connection.setAutoCommit(false);
            stm = connection.prepareStatement(sql_createCart, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, c.getAccountId());
            stm.executeUpdate();

           System.out.println("goin " + stm.getGeneratedKeys().toString());

           
            try ( ResultSet generatedKeys = stm.getGeneratedKeys()) {
                 System.out.println("go key " + generatedKeys.toString());
                if (generatedKeys.next()) {
                    c.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating Cart failed, no ID obtained.");
                }
            }
            connection.commit();
            System.out.println("go key commit");
            
            
        } catch (Exception e) {
            try {
                connection.rollback();
            } catch (SQLException sqle) {
                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, sqle);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            db.closeConnection(rs, stm, connection);
        }
        return c;
    }
}
