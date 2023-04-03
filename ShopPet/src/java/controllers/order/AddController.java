/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.order;

import cof.Appl;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Account;
import models.OrderInfo;
import services.OrderService;

/**
 *
 * @author ADMIN
 */
public class AddController extends HttpServlet {
 private String customerSession = Appl.Session.CUSTOMER_LOGIN.getValue();
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
        Account a = (Account) request.getSession().getAttribute(customerSession);
        
        OrderService orderServices = new OrderService();
        int accountId = a.getId();
        String orderInfoParam = request.getParameter("orderInfo");
        int orderInfo = 0;

        try {
            orderInfo = Integer.parseInt(orderInfoParam.trim());
        } catch (Exception e) {
            orderInfo = 0;
        }

        List<OrderInfo> orderInfos = orderServices.getOrderInfo(accountId);

        for (OrderInfo oi : orderInfos) {
            if (oi.getId() == orderInfo) {
                request.setAttribute("orderInfo", oi);
            }
        }
        request.setAttribute("orderInfos", orderInfos);
        request.setAttribute("listCity", OrderInfo.listCity);
        request.setAttribute("listStreet", OrderInfo.listStreet);

        request.getRequestDispatcher("/views/pages/checkout.jsp").forward(request, response);
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

        Account accountSession = (Account) request.getSession().getAttribute(customerSession);

        String customerName = request.getParameter("name");
        String customerPhone = request.getParameter("phone");
        String customerAddress = request.getParameter("address");
//        response.getWriter().print("asd sda "+ customerName+customerPhone+customerAddress);
        if(customerName != null
                && customerPhone !=null
                && customerAddress != null
                ){
//        
//        int orderInfoId  = Integer.parseInt( request.getParameter("orderInfo"));
//        OrderInfo info = orderService.getOrderInfoById(orderInfoId);
//        if(accountSession.getId() == info.getAccountId()){

        orderService.createOrder(accountSession, customerName, customerPhone, customerAddress);
        request.getSession().removeAttribute("shop_pet_cart");
        request.getSession().setAttribute("shop_pet_cart_totalPrice", 0);
        response.sendRedirect(request.getContextPath()+"/order/history");
        }
//        }else {
//            System.out.println("Unauthored");
//        }

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
