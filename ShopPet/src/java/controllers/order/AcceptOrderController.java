/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.order;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Order;
import models.Paging;
import services.OrderService;

/**
 *
 * @author ADMIN
 */
public class AcceptOrderController extends HttpServlet {

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
            out.println("<title>Servlet AcceptOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptOrderController at " + request.getContextPath() + "</h1>");
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
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
        
        String orderStatus = null;
        String shippingStatus = request.getParameter("shippingStatus");
        
        if (status != null && status.toUpperCase().matches("(^NULL$)|(^DENY$)")) {
            orderStatus = status.toUpperCase();
        }
        
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
        Paging<Order> orders = orderService.getAllOrder(customerName, customerPhone, customerAddress, orderStatus, shippingStatus, dateFrom, dateTo, limit, pageIndex);
        
        request.setAttribute("orders", orders);
//        response.getWriter().print("dsads");
        request.getRequestDispatcher("/views/pages/admin_accept_order.jsp").forward(request, response);
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
        OrderService orderService = new OrderService();
        
        int orderId = 0;
        double shippingPrice = -1;
        String orderStatus = request.getParameter("update-status");
        
        try {
            orderId = Integer.parseInt(request.getParameter("id"));
            shippingPrice = Double.parseDouble(request.getParameter("price"));
        } catch (Exception e) {
        }
        
        if (orderStatus.equalsIgnoreCase("deny")) {
            orderService.denyOrder(orderId);
        }
        //Integer.parseInt(request.getParameter("order_id"));
        if (shippingPrice >= 0 && orderId > 0 && orderStatus.equalsIgnoreCase("accept")) {
            orderService.acceptOrder(orderId, shippingPrice);
        }
        
        response.sendRedirect(request.getContextPath() + "/admin/order/accept?status=NULL");
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
