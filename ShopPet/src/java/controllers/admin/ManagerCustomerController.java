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
import services.AccountService;
import services.CustomerService;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class ManagerCustomerController extends HttpServlet {

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
            out.println("<title>Servlet ManagerCustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerCustomerController at " + request.getContextPath() + "</h1>");
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
            CustomerService cs = new CustomerService();
            request.setAttribute("customers", cs.getAll());
            request.getRequestDispatcher("/views/pages/admin_manager_customer.jsp").forward(request, response);
        } catch (SQLException ex) {
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
        String[] liston = request.getParameterValues("active");
        String[] listreason = request.getParameterValues("reason");
        AccountService as = new AccountService();

        for (int i = 0; i < listreason.length; i++) {
            String id = listreason[i];
            if (id.matches("\\d+")) {
                try {
                    Account acc = as.getById(Integer.parseInt(id));
                    if ((i + 1) < listreason.length) {
                        if (!listreason[i + 1].equals(acc.getDeactive_reason())) {
                            try {
                                acc.setDeactive_reason(listreason[i + 1]);
                                as.update(acc);
                                response.getWriter().println(id);
                            } catch (Exception ex) {
                                response.getWriter().print(ex);
                            }
                        }
                    }
                } catch (Exception ex) {
                    response.getWriter().print(ex);

                }

            }
        }
        for (int i = 0; i < liston.length; i++) {
            String id = liston[i];
            if (id.matches("\\d+")) {
                if (i == liston.length - 1) {
                    try {
                        Account acc = as.getById(Integer.parseInt(id));
                        acc.setDeactive_at(Date.valueOf(LocalDate.now()));
                        as.update(acc);
//                            response.getWriter().println(id);
                    } catch (SQLException ex) {
                        Logger.getLogger(ManagerCustomerController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                } else {

                    if (!liston[i + 1].equals("on")) {
                        try {
                            Account acc = as.getById(Integer.parseInt(id));
                            acc.setDeactive_at(Date.valueOf(LocalDate.now()));
                            as.update(acc);
//                            response.getWriter().println(id);
                        } catch (SQLException ex) {
                            Logger.getLogger(ManagerCustomerController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        try {
                            Account acc = as.getById(Integer.parseInt(id));
                            acc.setDeactive_at(null);
                            acc.setDeactive_reason(null);
                            as.update(acc);
                        } catch (SQLException ex) {
                            response.getWriter().print(ex);
                        }
                    }

                }

            }
        }

        response.sendRedirect("manager-customer");

//        for (int i = 0; i < liston.length; i++) {
//            String id = liston[i];
//            if (id.equals("on")) {
//                response.getWriter().println(id);
//            }
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
