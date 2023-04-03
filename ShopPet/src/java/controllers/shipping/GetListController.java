/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.shipping;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Order;
import models.Paging;
import models.Shipping;
import services.OrderService;
import services.ShippingService;

/**
 *
 * @author ADMIN
 */
public class GetListController extends HttpServlet {

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
            out.println("<title>Servlet GetListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetListController at " + request.getContextPath() + "</h1>");
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
        ShippingService shippingService = new ShippingService();
//        List<Order> orders = shippingService.getShippingNeedShip();
             String qs = request.getQueryString();
        if (qs != null) {
            qs = qs.replaceAll("page|page=|page=[0-9a-zA-Z\\W]+|&page=[0-9a-zA-Z\\W]+", "");
//                qs = qs.replaceAll("productName|productName=|productName=[0-9a-zA-Z\\W]+|&productName=[0-9a-zA-Z\\W]+", "");
//                qs = qs.replaceAll("sortedBy|sortedBy=|sortedBy=[0-9a-zA-Z\\W]+|&sortedBy=[0-9a-zA-Z\\W]+", "");
            qs = qs.replaceAll("limit|limit=|limit=[0-9a-zA-Z\\W]+|&limit=[0-9a-zA-Z\\W]+", "");
        }
        
        String foo = request.getRequestURL().toString();
        request.setAttribute("currentPage", foo);
        request.setAttribute("queryString", qs == null ? "" : qs);
        
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        String customerAddress = request.getParameter("customerAddress");
        String status = request.getParameter("status");

//        
        String shippingStatus = null;
        
        
        if (status != null && status.toUpperCase().matches("(^SHIPPING$)|(^SUCCESS$)|(^CANCEL$)")) {
            shippingStatus = status.toUpperCase();
        }
        
        int limit;
        String limitParam = request.getParameter("limit");
        try {
            limit = Integer.parseInt(limitParam);
        } catch (Exception e) {
            limit = 10;
        }
        
        String pageIndexParam = request.getParameter("page");
        int pageIndex = 1;
        try {
            pageIndex = Integer.parseInt(pageIndexParam);
            
            if (pageIndex < 1) {
                pageIndex = 1;
            }
            
        } catch (Exception e) {
            pageIndex = 1;
        }
        
        OrderService orderService = new OrderService();
        Paging<Order> orders = orderService.getAllOrder(customerName, customerPhone, customerAddress, null, shippingStatus, null, null, limit, pageIndex);
        
        request.setAttribute("orders", orders);
        
        request.getRequestDispatcher("/views/pages/shipping_accept_order.jsp").forward(request, response);
        
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
