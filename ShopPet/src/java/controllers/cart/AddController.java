/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import cof.Appl;
import dal.DBContext;
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
public class AddController extends HttpServlet {

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
            out.println("<title>Servlet AddController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddController at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);

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

        Account a = (Account) request.getSession().getAttribute(customerSession);
        int productId = 0;
        int quantity = 0;
        try {
            productId = Integer.parseInt(request.getParameter("product_id"));
            // check parameter is int and check product exist
            quantity = Integer.parseInt(request.getParameter("quantity"));
            // check parameter is int
        } catch (Exception e) {
            response.sendError(403, e.getMessage());
        }
        // waitting login  
        if(a==null){
            addCartNotLogin(request, response, productId, quantity);
        }else{
            addCartInLogin(a.getId(), productId, quantity);
        }
        request.getSession().removeAttribute("shop_pet_cart");
        request.getSession().removeAttribute("shop_pet_cart_totalPrice");
    }

    private void addCartNotLogin(HttpServletRequest request, HttpServletResponse response, int productId, int quantity) {
        Cookie productCooky = null;
        Cookie[] cookies = request.getCookies();

        for (Cookie cooky : cookies) {
            String cookyName = cooky.getName();
            if (cookyName.contains(productCartCooky)) {
                int oldid = Integer.parseInt(cookyName.substring(productCartCooky.length() + 1));
                int oldQuantity = Integer.parseInt(cooky.getValue());
                if (oldid == productId) {
                    productCooky = cooky;
                    productCooky.setValue((oldQuantity + quantity) + "");
                    if (Integer.parseInt(productCooky.getValue()) <= 0) {
                        productCooky.setMaxAge(0);
                    } else {
                        productCooky.setMaxAge(3600 * 24 * 7 * 365);
                    }
                }
            }

        }

        if (productCooky == null) {

            if (quantity > 0) {
                productCooky = new Cookie(productCartCooky + "-" + productId, quantity + "");
                productCooky.setMaxAge(3600 * 24 * 7 * 365);
            }

        }

        response.addCookie(productCooky);

    }

    private void addCartInLogin(int accountId, int productId, int quantity) {
        CartService cartService = new CartService();
        cartService.addCart(accountId, productId, quantity);
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
