/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import cof.Appl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import models.Account;
import models.CartItem;
import services.AccountService;

/**
 *
 * @author win
 */
public class Login extends HttpServlet {

    private String productCartCooky = Appl.Cooky.CartCookies.getValue();

//    public static void main(String[] args) {
//        System.out.println("lofin " + AppConfig.Session.CUSTOMER_LOGIN.getValue());
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String customerSession = Appl.Session.CUSTOMER_LOGIN.getValue();
        String shipperSession = Appl.Session.SHIPPER_LOGIN.getValue();
        String adminSession = Appl.Session.ADMIN_LOGIN.getValue();
        if (session.getAttribute(customerSession) != null
                || session.getAttribute(shipperSession) != null
                || session.getAttribute(adminSession) != null) {
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {
            HttpSession session = request.getSession();
            //lay du lieu tu rq
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            //create cookie
            Cookie cu = new Cookie("cusername", username);
            Cookie cp = new Cookie("cpassword", password);
            Cookie cr = new Cookie("cremember", remember);
            if (remember != null) {
                cu.setMaxAge(60 * 60 * 24 * 7);
                cp.setMaxAge(60 * 60 * 24 * 7);
                cr.setMaxAge(60 * 60 * 24 * 7);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cr);
            response.addCookie(cp);
            response.addCookie(cu);

            AccountService a = new AccountService();
            String customerSession = Appl.Session.CUSTOMER_LOGIN.getValue();//"acc";// AppConfig.Session.CUSTOMER_LOGIN.getValue();
            Account logged = a.login(username, password);

            if (logged.getRole().equalsIgnoreCase(Account.RoleShipper)) {
                String shipperSession = Appl.Session.SHIPPER_LOGIN.getValue();
                session.setAttribute(shipperSession, logged);
                response.sendRedirect(request.getContextPath() + "/Shipper");

            } else if (logged.getRole().equalsIgnoreCase(Account.RoleAdmin)) {
                String adminSession = Appl.Session.ADMIN_LOGIN.getValue();
                session.setAttribute(adminSession, logged);
                response.sendRedirect(request.getContextPath() + "/dashboardAdmin");
            } else {
                session.setAttribute(customerSession, logged);
                if (logged != null) {
                    checkCartGuest(request, response);
                }
                response.sendRedirect(request.getContextPath() + "/home");
            }

        } catch (Exception e) {
            response.getWriter().println(e);
            request.setAttribute("loginMsg", "Login Failed");
            request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
        }

    }

    private void checkCartGuest(HttpServletRequest request, HttpServletResponse response) {
        List<CartItem> cartItems = new ArrayList();
        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            String cookyName = cooky.getName();
            if (cookyName.contains(productCartCooky)) {
                int id = Integer.parseInt(cookyName.substring(productCartCooky.length() + 1));
                int quantity = Integer.parseInt(cooky.getValue());
                CartItem ci = new CartItem();
                ci.setId(id);
                ci.setQuantity(quantity);
                cartItems.add(ci);

                cooky.setMaxAge(0);
                response.addCookie(cooky);
            }
        }
        request.setAttribute("oldCart", cartItems);
    }
}
