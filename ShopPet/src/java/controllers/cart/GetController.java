/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.cart;

import cof.Appl;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Cart;
import models.CartItem;
import models.Product;
import services.CartService;
import services.ProductService;

/**
 *
 * @author ADMIN
 */
public class GetController extends HttpServlet {
    
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
            out.println("<title>Servlet GetController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetController at " + request.getContextPath() + "</h1>");
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
        if (a != null) {
            getCartInlogin(request, response, a.getId());
        } else {
            getCartNotlogin(request, response);
        }

//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().print(gson.toJson(c));
//        response.getWriter().flush();
//        request.setAttribute("cart", c);
//        request.getRequestDispatcher("/views/pages/view-cart.jsp").forward(request, response);
        request.getRequestDispatcher("/views/pages/cart.jsp").forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void getCartNotlogin(HttpServletRequest request, HttpServletResponse response) {
        ProductService productService = new ProductService();
        Cart cart = new Cart();
        Cookie[] cookies = request.getCookies();
        for (Cookie cooky : cookies) {
            String cookyName = cooky.getName();
            if (cookyName.contains(productCartCooky)) {
                int id = Integer.parseInt(cookyName.substring(productCartCooky.length() + 1));
                int quantity = Integer.parseInt(cooky.getValue());
                Product p = productService.getProductById(id);
                CartItem ci = new CartItem();
                ci.setProductId(p.getId());
                ci.setProduct(p);
                ci.setQuantity(Integer.parseInt(cooky.getValue()));
                
                cart.getItems().add(ci);
                cart.setPrice(cart.getPrice() + (ci.getProduct().getPrice() * quantity));
            }
        }
        
        request.getSession().setAttribute("shop_pet_cart", cart);
        
        double totalPrice = 0;
        
        for (CartItem item : cart.getItems()) {
            
            totalPrice = totalPrice + (item.getQuantity() * item.getProduct().getPrice());
        }
        request.getSession().setAttribute("shop_pet_cart_totalPrice", totalPrice);
    }
    
    private void getCartInlogin(HttpServletRequest request, HttpServletResponse response, int accountId) {
        CartService cartService = new CartService();
        Gson gson = new Gson();
        Cart c = cartService.getCart(accountId);
        request.getSession().setAttribute("shop_pet_cart", c);
        
        double totalPrice = 0;
        
        for (CartItem item : c.getItems()) {
            
            totalPrice = totalPrice + (item.getQuantity() * item.getProduct().getPrice());
        }
        request.getSession().setAttribute("shop_pet_cart_totalPrice", totalPrice);
    }
    
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
