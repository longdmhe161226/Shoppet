/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Customer;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class CustomerMapping {

    public static Customer daotoObject(ResultSet rs) throws SQLException {

            Customer customer = new Customer(
                    rs.getInt("id"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getBoolean("gender"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getDate("birth_of_date"),
                    rs.getString("phone"),
                    rs.getInt("account_id")
            );
        return customer;

    }

    public static PreparedStatement setFromObject(Customer customer, PreparedStatement stmt) throws SQLException {
        stmt.setString(1, customer.getFirstName());
        stmt.setString(2, customer.getLastName());
        stmt.setBoolean(3, customer.isGender());
        stmt.setString(4, customer.getAddress());
        stmt.setString(5, customer.getEmail());
        stmt.setDate(6, customer.getBirthOfDate());
        stmt.setString(7, customer.getPhone());
        stmt.setInt(8, customer.getAccount_id());
        return stmt;
    }

    public static void main(String[] args) {
        Customer cus = 
                new Customer(1, "", "", true, "", "",
                null,
                "", 2);

//        Customer cus = new Customer();
    }

}
