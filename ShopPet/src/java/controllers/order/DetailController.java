/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.order;

import cof.Appl;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Order;
import models.OrderItem;
import services.OrderService;

/**
 *
 * @author ADMIN
 */
public class DetailController extends HttpServlet {

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
            out.println("<title>Servlet DetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailController at " + request.getContextPath() + "</h1>");
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

        OrderService orderService = new OrderService();
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            Order o = orderService.getOrderById(orderId);
            if (o.getAccountId() == a.getId()) {

//            Gson gson = new Gson();
//            response.getWriter().print(gson.toJson(o));
                int totalItemsPrice = 0;
                for (OrderItem item : o.getItems()) {
                    totalItemsPrice += item.getPrice() * item.getQuantity();
                }
                request.setAttribute("order", o);
                request.setAttribute("totalItemsPrice", totalItemsPrice);
                request.getRequestDispatcher("/views/pages/order_detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/order/history");

            }

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/order/history");
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
