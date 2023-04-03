/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import dal.CustomerDAO;
import jakarta.validation.constraints.Pattern;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author win
 */
public class Account {

    private int id;
    private String username;
    private String password;
    @Pattern(regexp = "^" + RoleAdmin + "$"
            + "|^" + RoleCustomer + "$")  //^ADMIN$|^CUSTOMER$
    private String role;
    private Date created_at;
    private Date deactive_at;
    private String deactive_reason;
    private Customer customer;

    public static final String RoleAdmin = "ADMIN";
    public static final String RoleCustomer = "CUSTOMER";
    public static final String RoleShipper = "SHIPPER";

    CustomerDAO cd = new CustomerDAO();

    public Account(int id, String username, String password, String role, Date created_at, Date deactive_at, String deactive_reason) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.created_at = created_at;
        this.deactive_at = deactive_at;
        this.deactive_reason = deactive_reason;
//        this.customer = cd.getCustomerById(this.id);
    }

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getDeactive_at() {
        return deactive_at;
    }

    public void setDeactive_at(Date deactive_at) {
        this.deactive_at = deactive_at;
    }

    public String getDeactive_reason() {
        return deactive_reason;
    }

    public void setDeactive_reason(String deactive_reason) {
        this.deactive_reason = deactive_reason;
    }

    public Customer getCustomer() throws SQLException {
        this.customer = cd.getCustomerByAccId(this.id);
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public void setCustomer() throws SQLException {
        this.customer = cd.getCustomerByAccId(this.id);

    }

    @Override
    public String toString() {
        return "Account{"
                + "id=" + id
                + ", username='" + username + '\''
                + ", password='" + password + '\''
                + ", role=" + role
                + ", created_at='" + created_at + '\''
                + ", deactive_at='" + deactive_at + '\''
                + ", deactive_reason='" + deactive_reason + '\''
                + '}';
    }

    public static void main(String[] args)  {
        try {
            Account a = new Account(2, "", "", "", Date.valueOf("2222-2-22"), Date.valueOf("2222-2-22"), "");
            System.out.println(a.getCustomer());
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
