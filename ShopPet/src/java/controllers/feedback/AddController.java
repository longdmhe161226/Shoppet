/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.feedback;

import cof.Appl;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Feedback;
import models.Order;
import services.FeedbackService;
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
        //request.getRequestDispatcher("Add feedback page").forward(request, response);
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
//        processRequest(request, response);
        FeedbackService feedbackService = new FeedbackService();
        OrderService orderService = new OrderService();
        Account a = (Account) request.getSession().getAttribute(customerSession);

        try {
            // get param
            String content = request.getParameter("content");
            int star = Integer.parseInt(request.getParameter("star"));
            int orderItemId = Integer.parseInt(request.getParameter("order_item_id"));

            // check owner
            int accountId = a.getId();
            Order o = orderService.getOrderByOrderItemId(orderItemId);
            if (o != null && o.getAccountId() == accountId) {
                // if owner true
                if(o.getShipping().getDoneAt() != null){
                    // check bought
                Feedback feedback = new Feedback();
                feedback.setContent(content);
                feedback.setStar(star);
                feedback.setOrderItemId(orderItemId);

                feedbackService.addItemFeedback(feedback);
                }
                
            }
            response.sendRedirect(request.getContextPath()+"/order/detail?id="+ o.getId());

        } catch (Exception e) {
//            response.getWriter().print(e.getMessage() + "\n\n\n" + e.getLocalizedMessage());
            response.sendRedirect(request.getContextPath()+"/order/history");

        }

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
