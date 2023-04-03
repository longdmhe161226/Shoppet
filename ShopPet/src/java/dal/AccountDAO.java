/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import models.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mapping.AccountMapping;

public class AccountDAO {

    DBContext db = DBContext.getInstance();
    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public Account getAccountById(int accId) throws SQLException {
        String query = "SELECT * FROM Account WHERE id = ?";
        connection = db.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, accId);
        ResultSet rs = statement.executeQuery();

        if (rs.next()) {

            Account account = AccountMapping.daoToObject(rs);
            close(connection, statement, rs);

            return account;
        } else {
            close(connection, statement, rs);
            return null;
        }
    }

    public void insert(Account user) throws SQLException {
        String sql = "INSERT INTO Account (username, password, role, created_at, deactive_at, deactive_reason) VALUES (?,?,?,NOW(),?,?)";
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = db.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt = AccountMapping.setFromObject(user, stmt);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, stmt, rs);
        }
    }

    public void update(Account user) throws SQLException {
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement("UPDATE Account SET username=?, password=?, role=?, deactive_at=?, deactive_reason=? WHERE id=?");
            stm = AccountMapping.setFromObject(user, stm);
            stm.setInt(6, user.getId());
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(connection, stm, null);
        }
    }

    public Account login(String username, String password) {
        String query = "select * from  Account where username = ? and password = ? and deactive_at is null";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(query);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account acc = AccountMapping.daoToObject(rs);
                return acc;
            }

        } catch (Exception e) {
        }
        return null;

    }

    public int getMaxID() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int maxID = 0;
        try {
            conn = db.getConnection();
            stmt = conn.prepareStatement("SELECT max(id) as id FROM Account");
            rs = stmt.executeQuery();
            if (rs.next()) {
                maxID = rs.getInt("id");
            }
        } finally {
            close(conn, stmt, rs);
        }
        return maxID;
    }
    public int countAccount() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = db.getConnection();
            stmt = conn.prepareStatement("select count(*) as count from account");
            rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } finally {
            close(conn, stmt, rs);
        }
        return count;
    }

    public boolean checkExistUsername(String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean exists = false;
        try {
            conn = db.getConnection();
            stmt = conn.prepareStatement("SELECT COUNT(*) FROM Account WHERE username = ? and deactive_at is null");
            stmt.setString(1, username);
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

    public List<Account> getAllAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rss = null;
        try {
            conn = db.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM shop_pet.`Account`;");
            rss = stmt.executeQuery();
            while (rss.next()) {
                System.out.println(rss);
                accounts.add(AccountMapping.daoToObject(rss));
            }
        } finally {
//            close(conn, stmt, rs);
        }
        return accounts;
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

    public static void main(String[] args) throws SQLException {
        AccountDAO ad = new AccountDAO();
        System.out.println(ad.getAllAccounts());
    }

//    public static void main(String[] args) throws SQLException {
//        AccountDAO ad = new AccountDAO();
//        ad.getAllAccounts();
//        System.out.println(ad.getAccountById(2));
////        String username = "Admin";
////        String password = "12";
////        System.out.println(ad.checkLogin(username, password));
////        ad.insert(new Account(0, "123", "123", "1", null, null, null));
//    }
    //    public void changePass(int id, String newPassword) throws SQLException {
//
//        try {
//            connection = db.getConnection();
//            stm = connection.prepareStatement("UPDATE Account SET password=? WHERE id=?");
//            stm.setString(1, newPassword);
//            stm.setInt(2, id);
//            stm.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close(connection, stm, null);
//        }
//    }
}
