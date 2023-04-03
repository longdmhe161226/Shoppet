/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.ProductDAO;
import dal.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Category;
import models.Product;
import models.SubCategory;
import services.CategoryService;
import services.ProductService;

/**
 *
 * @author khuat
 */
public class showProductAdmin extends HttpServlet {

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
            out.println("<title>Servlet showProductAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet showProductAdmin at " + request.getContextPath() + "</h1>");
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
        CategoryService c = new CategoryService();
        SubCategoryDAO s = new SubCategoryDAO();
        ProductDAO d = new ProductDAO();
        String pageString = request.getParameter("page");
        String catIdString = request.getParameter("cid");
        int cid = 0;
        try {
            cid = Integer.parseInt(catIdString);
        } catch (Exception e) {
        }
        int page = 1;
        int numberpage = 10;
        int size = d.getTotalProducts();
        int sizeCate = d.getNumberProductsByCategoryID(cid);
        int number = size / numberpage;
        int numberCate = sizeCate / numberpage;
        if (size % numberpage != 0) {
            number++;
        }
        if (sizeCate % numberpage != 0) {
            numberCate++;
        }
        if (pageString == null) {
            page = 0;
        } else {
            try {
                page = Integer.parseInt(pageString);
            } catch (Exception e) {
            }
        }
        boolean check = d.getPetIdFromCategoryId(cid);
        List<SubCategory> listNameSub = s.getNameSubCategoryByCategoryId(cid);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberpage);
        request.setAttribute("num", number);
        request.setAttribute("numCate", numberCate);
        request.setAttribute("cid", cid);
        request.setAttribute("size", size);
        request.setAttribute("sizeCate", sizeCate);
        request.setAttribute("listNameSub", listNameSub);
        request.setAttribute("check", check);
        List<Category> listCategory = c.getAllCategory();
        List<Product> listAllProduct = a.getPagingAllInfor(10,page * numberpage);
        List<Product> listAllProductByCategory = a.getSearchAllProductbyCategoryID(10, page * numberpage, cid, check);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listAllProduct", listAllProduct);
        request.setAttribute("listAllProductByCategory", listAllProductByCategory);
        request.getRequestDispatcher("/views/pages/admin_productList.jsp").forward(request, response);
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
