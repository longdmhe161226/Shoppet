/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.search;

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
 * @author 12050
 */
public class filterCategory extends HttpServlet {

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
            out.println("<title>Servlet filterCategory</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet filterCategory at " + request.getContextPath() + "</h1>");
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
        ProductDAO d = new ProductDAO();
        ProductService a = new ProductService();
        CategoryService c = new CategoryService();
        SubCategoryDAO s = new SubCategoryDAO();
        List<Category> listCategory = c.getAllCategory();
        String sid_raw = request.getParameter("subCategory");
//        String categoryId = request.getParameter("category");
        String cid_raw=request.getParameter("cid");
        
        int cid=0;
        int sid = 0;
        try {
             cid=Integer.parseInt(cid_raw);
        } catch (Exception e) {
        }
        try {
            sid = Integer.parseInt(sid_raw);
        } catch (Exception e) {
        }

        int page = 0;
        int numberpage = 6;
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
        boolean check = d.getPetIdFromCategoryId(cid);
        boolean check1 = d.getPetIdFromSubCategoryId(sid);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberpage);
        request.setAttribute("num", number);
        request.setAttribute("numCate", numberCate);
        request.setAttribute("size", size);
        request.setAttribute("sizeCate", sizeCate);
        
        List<SubCategory> listNameSub = s.getNameSubCategoryByCategoryId(cid);
        PrintWriter out= response.getWriter();
//        out.println("cid"+cid);
        out.println("subidfilter"+sid);
        request.setAttribute("listNameSub", listNameSub);
        List<Product> listFilterCategory = null;
        if (cid != 0 && sid==0) {
            listFilterCategory = a.getSearchAllProductbyCategoryID(6, page * numberpage, cid, check);
        } else if ( sid != 0) {
            listFilterCategory = a.filterSubCategory(sid, check1);
        }
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("cid", cid);
        request.setAttribute("checkFilterColor", check);
        request.setAttribute("sid", sid);
        request.setAttribute("cid", cid);
        request.setAttribute("check", check);
        request.setAttribute("listFilterCategory", listFilterCategory);
        request.getRequestDispatcher("/views/pages/store.jsp").forward(request, response);
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
