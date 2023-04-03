/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import dal.AccountDAO;
import java.sql.Date;
import java.sql.SQLException;

public class Customer {

    private int id;
    private String firstName;
    private String lastName;
    private boolean gender;
    private String address;
    private String email;
    private Date birthOfDate;
    private String phone;
    private int account_id;
    private Account account;

    AccountDAO ad = new AccountDAO();

    public Customer(int id, String firstName, String lastName, boolean gender, String address, String email, Date birthOfDate, String phone, int account_id) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.birthOfDate = birthOfDate;
        this.phone = phone;
        this.account_id = account_id;
    }

    public Customer() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthOfDate() {
        return birthOfDate;
    }

    public void setBirthOfDate(Date birthOfDate) {
        this.birthOfDate = birthOfDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getAccount_id() {
        return account_id;
    }

    public Account getAccount() throws SQLException {
        this.account = ad.getAccountById(this.account_id);
        return account;
    }

    public void setAccount(Account account) {
        this.account_id = account.getId();
        this.account = account;
    }

    public void setAccount() throws SQLException {
        this.account = ad.getAccountById(this.account_id);
    }

    @Override
    public String toString() {
        return "Customer{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", address=" + address + ", email=" + email + ", birthOfDate=" + birthOfDate + ", phone=" + phone + ", account_id=" + account_id + ", account=" + account + '}';
    }

    public static String validationEmail(String email) throws Exception {

        if (email.matches("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")) {
            return email;
        } else {
            throw new Exception("Your email wrong format");
        }

    }

    public static void main(String[] args) throws Exception {

//        System.out.println(Customer.validationEmail("foobar@gmail.com"));
        Customer cus = new Customer(1, "", "", true, "", "", Date.valueOf("2022-2-22"), "", 1);
        System.out.println(cus);
    }

}
