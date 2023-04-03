/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.AccountDAO;
import dal.CustomerDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.Customer;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class AccountService {

    private AccountDAO accountDAO;
    private CustomerDAO customerDAO;

    public AccountService() {
        customerDAO = new CustomerDAO();
        accountDAO = new AccountDAO();
    }

    public List<Account> getAll() throws SQLException {
        List<Account> list = new ArrayList<>();
        List<Account> la = accountDAO.getAllAccounts();
        List<Customer> lc = customerDAO.getAllCustomers();
        for (Customer customer : lc) {
            for (Account account : la) {
                if (account.getId() == customer.getAccount_id()) {
                    list.add(account);
                }
            }
        }
        return list;
    }

    public Account getById(int id) throws SQLException {
        List<Customer> lc = customerDAO.getAllCustomers();
        for (Customer customer : lc) {
            if (id == customer.getAccount_id()) {
                return accountDAO.getAccountById(id);
            }
        }
        return null;
    }

    public void create(Account account) throws SQLException {
//        if (!accountDAO.checkExistUsername(account.getUsername())) {
        accountDAO.insert(account);
//        }
    }

    public void update(Account account) throws SQLException {

        if (!accountDAO.checkExistUsername(account.getUsername())
                || account.getUsername().equals(accountDAO.getAccountById(account.getId()).getUsername())) {
            List<Customer> lc = customerDAO.getAllCustomers();
            for (Customer customer : lc) {
                if (account.getId() == customer.getAccount_id()) {
                    accountDAO.update(account);
                    return;
                }
            }
        }

    }

    public Account login(Account account) throws Exception {
        if (accountDAO.login(account.getUsername(), account.getPassword()) != null) {
            return accountDAO.login(account.getUsername(), account.getPassword());
        } else {
            throw new Exception("account null");
        }

    }

    public Account login(String username, String password) throws Exception {
        if (accountDAO.login(username, password )!= null)  {
            return accountDAO.login(username, password);
        } else {
            throw new Exception("account null");
        }
    }

    public boolean checkUserExist(String username) throws SQLException {
        return accountDAO.checkExistUsername(username);
    }

    public int getMaxId() throws SQLException {
        return accountDAO.getMaxID();
    }

    public static void main(String[] args) throws Exception {
        (new AccountService()).login("long", "123");
    }

}
