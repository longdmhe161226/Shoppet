/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.search;

import dal.ProductDAO;
import dal.SubCategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;
import models.SubCategory;
import services.CategoryService;
import services.ProductService;

/**
 *
 * @author 12050
 */
public class sortPrice extends HttpServlet {

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
            out.println("<title>Servlet sortPrice</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sortPrice at " + request.getContextPath() + "</h1>");
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
        ProductService ps = new ProductService();
        String cid_raw = request.getParameter("cid");
        int cid = Integer.parseInt(cid_raw);
        boolean check = d.getPetIdFromCategoryId(cid);
        ProductService a = new ProductService();
        CategoryService c = new CategoryService();
        SubCategoryDAO s = new SubCategoryDAO();
        String pageString = request.getParameter("page");
        int page = 1;
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
        if (pageString == null) {
            page = 0;
        } else {
            try {
                page = Integer.parseInt(pageString);
            } catch (Exception e) {
            }
        }
        List<SubCategory> listNameSub = s.getNameSubCategoryByCategoryId(cid);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberpage);
        request.setAttribute("num", number);
        request.setAttribute("numCate", numberCate);
        request.setAttribute("cid", cid);
        request.setAttribute("size", size);
        request.setAttribute("sizeCate", sizeCate);
        request.setAttribute("listNameSub", listNameSub);
        List<Category> listCategory = c.getAllCategory();
        List<Product> listSort = new ArrayList<>();
        String sort_price = request.getParameter("sort_price");
        if (sort_price.equals("1")) {
            listSort = ps.sortPriceAce(6, page * numberpage, cid, check);
        } else if (sort_price.equals("-1")) {
            listSort = ps.sortPriceDesc(6, page * numberpage, cid, check);
        } else{
           listSort = a.getSearchAllProductbyCategoryID(6, page * numberpage,cid,check);
        }
        PrintWriter out= response.getWriter();
        request.setAttribute("listSort", listSort);
        request.setAttribute("sortPrice", sort_price);
        request.setAttribute("cid", cid);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("checkFilterColor", check);
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
