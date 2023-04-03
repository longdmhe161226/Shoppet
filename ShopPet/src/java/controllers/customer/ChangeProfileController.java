
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.customer;

import cof.Appl;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.SQLException;
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
public class ChangeProfileController extends HttpServlet {

    private String loginSession = Appl.Session.CUSTOMER_LOGIN.getValue();;//"acc";//AppConfig.Session.CUSTOMER_LOGIN.getValue();

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
            out.println("<title>Servlet ChangeProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeProfileController at " + request.getContextPath() + "</h1>");
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
            new DBContext();
            HttpSession session = request.getSession();
            Customer c = ((Account)session.getAttribute(loginSession)).getCustomer();
            request.setAttribute("customer", c);
            request.getRequestDispatcher("../views/elements/profile/editprofile.jsp").forward(request, response);
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
        new DBContext();
        try {
            HttpSession session = request.getSession();
            CustomerService cs = new CustomerService();
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String birthOfDate = request.getParameter("dob");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            Account account = ((Account) session.getAttribute(loginSession));

            Customer customer = new Customer();
            customer.setId(account.getCustomer().getId());
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setGender(gender.equals("1"));
            customer.setAddress(address);
            customer.setEmail(email);
            customer.setBirthOfDate(Date.valueOf(birthOfDate));
            customer.setPhone(phone);
            customer.setAccount(account);

            cs.update(customer);
            account.setCustomer();
            session.setAttribute(loginSession, account);
            response.sendRedirect("profile");
        } catch (SQLException ex) {
            response.getWriter().print(ex);
            request.setAttribute("mse", "Email Exist!!!!");
            try {
                request.setAttribute("customer", ((Account) request.getSession().getAttribute(loginSession)).getCustomer());
            } catch (SQLException ex1) {
                Logger.getLogger(ChangeProfileController.class.getName()).log(Level.SEVERE, null, ex1);
            }
            request.getRequestDispatcher("/views/elements/profile/editprofile.jsp").forward(request, response);
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
