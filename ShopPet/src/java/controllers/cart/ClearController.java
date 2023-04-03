/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import cof.Appl;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import services.CartService;

/**
 *
 * @author ADMIN
 */
public class ClearController extends HttpServlet {

    private String customerSession = Appl.Session.CUSTOMER_LOGIN.getValue();
    private String productCartCooky = Appl.Cooky.CartCookies.getValue();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClearController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClearController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account a = (Account) request.getSession().getAttribute(customerSession);

         // waitting login  
        CartService cartService = new CartService();
        String productParam = request.getParameter("product_id");
        int productId = 0;
        try {
            System.out.println(" productParam " + productParam);
            productId = Integer.parseInt(productParam);

        } catch (Exception e) {
            productId=0;
        }

        if (a == null) {

            if (productId == 0) {
                clearCartNotLogin(request, response);
            } else {
                clearProductCartNotLogin(request, response, productId);
            }

        } else {
            int accountId = a.getId();
            if (productId==0) {
                cartService.clearCart(accountId);
            } else {
                cartService.clearProductCart(accountId, productId);
            }
        }

        request.getSession().removeAttribute("shop_pet_cart");
        request.getSession().setAttribute("shop_pet_cart_totalPrice", 0);
    }

    private void clearCartNotLogin(HttpServletRequest request, HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();

        for (Cookie cooky : cookies) {
            String cookyName = cooky.getName();
            if (cookyName.contains(productCartCooky)) {
                cooky.setMaxAge(0);
                response.addCookie(cooky);
            }
        }
    }

    private void clearProductCartNotLogin(HttpServletRequest request, HttpServletResponse response, int productId) {

        Cookie[] cookies = request.getCookies();

        for (Cookie cooky : cookies) {
            String cookyName = cooky.getName();
            if (cookyName.contains(productCartCooky)) {
                int id = Integer.parseInt(cookyName.substring(productCartCooky.length() + 1));
                if (id == productId) {
                    cooky.setMaxAge(0);
                    response.addCookie(cooky);
                }

            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
