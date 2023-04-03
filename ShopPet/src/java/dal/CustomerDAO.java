/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.CustomerMapping;
import models.Customer;

public class CustomerDAO extends DBContext {

    private DBContext db = DBContext.getInstance();

    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM shop_pet.Customer");
            rs = stmt.executeQuery();
            while (rs.next()) {
                customers.add(CustomerMapping.daotoObject(rs));
            }
        } finally {
            close(conn, stmt, rs);
        }
        return customers;
    }

    public Customer getCustomerByAccId(int account_id) throws SQLException {
        Customer customer = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM shop_pet.Customer WHERE account_id = ?");
            stmt.setInt(1, account_id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("acc"+rs.getInt("account_id"));
                customer = CustomerMapping.daotoObject(rs);
            }
        } finally {
            close(conn, stmt, rs);
        }
        return customer;
    }
    public Customer getCustomerById(int id) throws SQLException {
        Customer customer = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM shop_pet.Customer WHERE id = ?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                customer = CustomerMapping.daotoObject(rs);
            }
        } finally {
            close(conn, stmt, rs);
        }
        return customer;
    }

    public void addCustomer(Customer customer) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("INSERT INTO shop_pet.Customer (firstName, lastName, gender, address,"
                    + "email, birth_of_date, phone,account_id) VALUES (?, ?, ?, ?, ?, ?, ?,?)");
            stmt = CustomerMapping.setFromObject(customer, stmt);
            stmt.executeUpdate();
        } finally {
            close(conn, stmt, null);
        }
    }

    public void updateCustomer(Customer customer) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("UPDATE shop_pet.Customer SET firstName = ?, lastName = ?, gender = ?,"
                    + " address = ?,email = ?, birth_of_date = ?, phone = ? WHERE account_id = ?");
            stmt = CustomerMapping.setFromObject(customer, stmt);
            stmt.executeUpdate();
        } finally {
            close(conn, stmt, null);
        }
    }


    public boolean checkExistEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean exists = false;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM shop_pet.Customer WHERE email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } finally {
            close(conn, stmt, rs);
        }
        return exists;
    }

    private static void close(Connection conn, PreparedStatement stmt, ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
     public Customer getByEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.prepareStatement("SELECT * FROM shop_pet.Customer WHERE email = ?");
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            if (rs.next()) {
                return CustomerMapping.daotoObject(rs);
            }
        } finally {
            close(conn, stmt, rs);
        }
        return null;
    }


    public static void main(String[] args) {
        try {
            CustomerDAO cd = new CustomerDAO();
            System.out.println(cd.getCustomerByAccId(2));
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

}
