/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import models.Account;
import models.Customer;
import services.AccountService;
import services.CustomerService;

/**
 *
 * @author FPT SHOP PCC Hai Hau
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        request.getRequestDispatcher("views/elements/register/register.jsp").forward(request, response);
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

            AccountService as = new AccountService();
            CustomerService cs = new CustomerService();

            String username = request.getParameter("username").trim();
            String firstName = request.getParameter("firstName").trim();
            String lastName = request.getParameter("lastName").trim();
            String gender = request.getParameter("gender").trim();
            String address = request.getParameter("address").trim();
            String email = request.getParameter("email").trim();
            String birthOfDate = request.getParameter("birth_of_date").trim();
            String phone = request.getParameter("phone").trim();
            String password = request.getParameter("password").trim();
            String passwordd = request.getParameter("cfpassword").trim();

            int id = as.getMaxId() + 1;

            int i = 0;
            if (!password.equals(passwordd)) {
                String msp = "Password does not match Confirm password";
                request.setAttribute("ms", msp);
                i++;
            }
            if (cs.checkEmailExist(email)) {
                String mse = "Email exist!!!";
                request.setAttribute("mse", mse);
                i++;
            }
            if (as.checkUserExist(username)) {
                String mu = "User exist!!!!";
                request.setAttribute("msu", mu);
                i++;
            }

            Account account = new Account(id, username, password, "CUSTOMER", null, null, null);
            Customer customer = new Customer(0, firstName, lastName,
                    gender.equalsIgnoreCase("MALE"), address, email, Date.valueOf(birthOfDate), phone, id);

            if (i == 0) {
                as.create(account);
                cs.create(customer);
            } else {
                request.getRequestDispatcher("views/elements/register/register.jsp").forward(request, response);

            }
            response.getWriter().println("done");
            request.setAttribute("registerMsg", "Your account created!! <br> Let's Login:");
            request.getRequestDispatcher("./views/pages/login.jsp").forward(request, response);
            // response.sendRedirect("./login");

        } catch (ServletException | IOException | SQLException | NullPointerException ex) {
            // response.sendRedirect("error");
            request.setAttribute("phonems", "Phone invalid");
            request.getRequestDispatcher("views/elements/register/register.jsp").forward(request, response);

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
