/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mapping;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Account;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class AccountMapping { 

    public static Account daoToObject( ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String username = rs.getString("username");
        String password = rs.getString("password");
        String role = rs.getString("role");
        Date created_at = rs.getDate("created_at");
        Date deactive_at = rs.getDate("deactive_at");
        String deactive_reason = rs.getString("deactive_reason");

        Account account = new Account(id, username, password, role, created_at, deactive_at, deactive_reason);
        return account;
    }

    public static PreparedStatement setFromObject(Account user, PreparedStatement stmt) throws SQLException {
        stmt.setString(1, user.getUsername());
        stmt.setString(2, user.getPassword());
        stmt.setString(3, user.getRole());
        stmt.setDate(4, (user.getDeactive_at()));
        stmt.setString(5, user.getDeactive_reason());

        return stmt;

    }

}
