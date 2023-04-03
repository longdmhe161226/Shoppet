/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Category;
import models.Product;
import services.CategoryService;
import services.ProductService;

/**
 *
 * @author khuat
 */
public class searchProductAdmin extends HttpServlet {

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
            out.println("<title>Servlet searchProductAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchProductAdmin at " + request.getContextPath() + "</h1>");
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
        ProductService a = new ProductService();
         ProductDAO d = new ProductDAO();
        CategoryService c = new CategoryService();
        String catIdString = request.getParameter("cid");
        int cid = 0;
        try {
            cid = Integer.parseInt(catIdString);
        } catch (Exception e) {
        }
        String search = request.getParameter("search");;
        boolean check=d.getPetIdFromCategoryId(cid);
        List<Product> listSearchAdmin = a.searchProduct(cid,search,check);
        PrintWriter out = response.getWriter();
        request.setAttribute("listSearchAdmin", listSearchAdmin);
        request.setAttribute("search", search);
        List<Category> listCategory = c.getAllCategory();
        request.setAttribute("listCategory", listCategory);
//        request.setAttribute("cid", cid);
//        out.print(listSearchAdmin +"\n");
//        out.print(search +"\n");
//        out.print(listCategory +"\n");
//        out.print(cid +"\n");
        request.getRequestDispatcher("views/pages/showSearchAdmin.jsp").forward(request, response);
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
