/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import dal.AccountDAO;
import dal.CustomerDAO;
import java.sql.SQLException;
import java.util.List;
import models.Customer;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class CustomerService {

   
    private AccountDAO accountDAO;
    private CustomerDAO customerDAO;

    public CustomerService() {
        customerDAO = new CustomerDAO();
        accountDAO = new AccountDAO();
    }

    public void create(Customer cus) throws SQLException {
        customerDAO.addCustomer(cus);
    }

    public Customer getById(int id) throws SQLException {
        return customerDAO.getCustomerById(id);
    }

    public Customer getByAccId(int account_id) throws SQLException {
        return customerDAO.getCustomerByAccId(account_id);
    }

    public List<Customer> getAll() throws SQLException {
        return customerDAO.getAllCustomers();
    }

    public void update(Customer cus) throws SQLException {
        if (!customerDAO.checkExistEmail(cus.getEmail())
                || customerDAO.getCustomerById(cus.getId()).getEmail().equals(cus.getEmail())) {
            customerDAO.updateCustomer(cus);
        } else {
            throw new SQLException();
        }

    }

    public boolean checkEmailExist(String email) throws SQLException {
        return customerDAO.checkExistEmail(email);
    }
    
     public Customer getByEmail(String email) throws SQLException {
        return customerDAO.getByEmail(email);
    }

    public static void main(String[] args) throws SQLException {
//        List<Account> la = (new AccountDAO()).getAllAccounts();
//        System.out.println(la);
        System.out.println((new CustomerService()).getAll());
    }

}
