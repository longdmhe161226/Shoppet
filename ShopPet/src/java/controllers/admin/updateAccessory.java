/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.ImageProductDAO;
import dal.OriginDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import models.ImageProduct;
import services.ProductService;

/**
 *
 * @author khuat
 */
public class updateAccessory extends HttpServlet {

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
            out.println("<title>Servlet updateAccessory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateAccessory at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        ProductDAO d = new ProductDAO();
        OriginDAO o= new OriginDAO();
        ProductService ps = new ProductService();
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String origin = request.getParameter("origin");
        String category_raw = request.getParameter("category");
        String subId_raw = request.getParameter("subId");
        String description = request.getParameter("description");
        String imgUrl = request.getParameter("imgUrl");
        String id_raw=request.getParameter("id");
        int id=Integer.parseInt(id_raw);
        int quantity = 0, subId = 0, category = 0;
        int originId = o.getIdOriginByName(origin);
        double price = 0;
          boolean check = d.getPetIdFromProductId(id);
        request.setAttribute("check", check);
        try {
            price = Double.parseDouble(price_raw);
            quantity = Integer.parseInt(quantity_raw);
            subId = Integer.parseInt(subId_raw);
        } catch (Exception e) {
        }
        ps.updateProductAccessory(id, name, code, price, quantity, description, subId, originId,imgUrl);
        response.sendRedirect("./showProductAdmin");
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
