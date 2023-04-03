/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;
import models.Customer;
import services.AccountService;
import services.CustomerService;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class AdminProfileController extends HttpServlet {

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
            out.println("<title>Servlet AdminProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProfileController at " + request.getContextPath() + "</h1>");
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

        try {
            String id = (String) request.getParameter("id");
            int id2 = Integer.parseInt(id);
            Customer c = (new CustomerService()).getById(id2);
            request.setAttribute("c", c);
            response.getWriter().print(c);
            request.getRequestDispatcher("/views/pages/admin_profile.jsp").forward(request, response);
        } catch (Exception ex) {
            response.getWriter().print(ex);
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
        String id = request.getParameter("id");
        String reason = request.getParameter("reason");
        String active = request.getParameter("active") ;

        try {

            AccountService as = new AccountService();
            response.getWriter().println("98");

            Account acc = as.getById(Integer.parseInt(id));
            response.getWriter().println(acc+"\n101");

//            Account acc = null;
            if (active.equals("on")) {
                response.getWriter().println("105");

                acc.setDeactive_at(null);
                acc.setDeactive_reason(null);
                response.getWriter().println("109");

                as.update(acc);
            } else {
                response.getWriter().println("113");

                acc.setDeactive_at(Date.valueOf(LocalDate.now()));
                response.getWriter().println("116");

                acc.setDeactive_reason(reason);
                response.getWriter().println("119");

                as.update(acc);
                response.getWriter().println("122");

            }
            response.getWriter().print(acc + "\n"+id);
            response.getWriter().print(reason);
            response.getWriter().print(active);

        } catch (Exception ex) {
            response.getWriter().print(ex.toString());
            response.getWriter().print(id);
            response.getWriter().print(reason);
            response.getWriter().print(active);
            Logger.getLogger(AdminProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
