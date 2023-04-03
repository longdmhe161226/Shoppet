/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.feedback;

import cof.Appl;
import dal.DBContext;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Feedback;
import models.Order;
import models.OrderItem;
import services.FeedbackService;
import services.OrderService;

/**
 *
 * @author ADMIN
 */
public class EditController extends HttpServlet {
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
            out.println("<title>Servlet EditController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditController at " + request.getContextPath() + "</h1>");
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
        FeedbackService feedbackService = new FeedbackService();

        OrderService orderService = new OrderService();
        Account a = (Account) request.getSession().getAttribute(customerSession);

        try {
            // get Pram
            int feedbackId = Integer.parseInt(request.getParameter("id"));
            String content = request.getParameter("content");
            int star = Integer.parseInt(request.getParameter("star"));

            // check Owner
            int accountId = a.getId();
            OrderItem oi = feedbackService.getOrderItemByFeedbackId(feedbackId);
            Order o = orderService.getOrderByOrderItemId(oi.getId());
            if (o != null && o.getAccountId() == accountId) {
                // edit if owner true
                Feedback feedback = new Feedback();
                feedback.setId(feedbackId);
                feedback.setContent(content);
                feedback.setStar(star);
                feedbackService.editItemFeedback(feedback);
            }

        } catch (Exception e) {
            response.getWriter().print(e.getMessage() + "\n\n\n" + e.getLocalizedMessage());
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
