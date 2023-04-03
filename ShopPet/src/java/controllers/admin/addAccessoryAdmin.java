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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import models.ImageProduct;
import models.Product;
import models.SubCategory;
import services.ProductService;

/**
 *
 * @author khuat
 */
public class addAccessoryAdmin extends HttpServlet {

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
            out.println("<title>Servlet addAccessoryAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addAccessoryAdmin at " + request.getContextPath() + "</h1>");
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
        List<SubCategory> listSubCategoryAccessory = d.getNameSubCategoryByCategoryId(3);
        List<SubCategory> listSubCategoryFood = d.getNameSubCategoryByCategoryId(4);
        request.setAttribute("listSubCategoryAccessory", listSubCategoryAccessory);
        request.setAttribute("listSubCategoryFood", listSubCategoryFood);
        request.getRequestDispatcher("/views/pages/admin_createaccessory.jsp").forward(request, response);
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
        String subId_raw = request.getParameter("subId");
        String description = request.getParameter("description");
        String imgUrl = request.getParameter("imgUrl");
        int quantity = 0, subId = 0;
        int originId = o.getIdOriginByName(origin);
        double price = 0;
        ImageProductDAO im = new ImageProductDAO();
        int countImg = im.getTotalImg() + 1;
        ArrayList<ImageProduct> listImgUrl = new ArrayList<>();
        ImageProduct img = new ImageProduct();
        img.setId(countImg);
        img.setImg(imgUrl);
        img.setProductId(d.getTotalProducts() + 1);
        listImgUrl.add(img);
        try {
            price = Double.parseDouble(price_raw);
            quantity = Integer.parseInt(quantity_raw);
            subId = Integer.parseInt(subId_raw);
        } catch (Exception e) {
        }
        PrintWriter out= response.getWriter();
        out.print("subId"+subId);

        ps.InsertProduct(name, code, price, quantity, description, subId, originId, listImgUrl);
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
