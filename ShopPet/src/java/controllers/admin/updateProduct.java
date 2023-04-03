/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.admin;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import services.ProductService;
import models.Product;
import models.SubCategory;

/**
 *
 * @author khuat
 */
public class updateProduct extends HttpServlet {

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
            out.println("<title>Servlet updateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProduct at " + request.getContextPath() + "</h1>");
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
        ProductService ps = new ProductService();
        ProductDAO d = new ProductDAO();

        String id_raw = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (Exception e) {
        }

        Product p = null;
        PrintWriter out = response.getWriter();
        boolean check = d.getPetIdFromProductId(id);
        request.setAttribute("check", check);
        if (check) {
            List<SubCategory> listSubCategoryDog = d.getNameSubCategoryByCategoryId(1);
            List<SubCategory> listSubCategoryCat = d.getNameSubCategoryByCategoryId(2);
            request.setAttribute("listSubCategoryDog", listSubCategoryDog);
            request.setAttribute("listSubCategoryCat", listSubCategoryCat);
        } else {
            List<SubCategory> listSubCategoryAccessory = d.getNameSubCategoryByCategoryId(3);
            List<SubCategory> listSubCategoryFood = d.getNameSubCategoryByCategoryId(4);
            request.setAttribute("listSubCategoryAccessory", listSubCategoryAccessory);
            request.setAttribute("listSubCategoryFood", listSubCategoryFood);
        }
        request.setAttribute("id",id);

//        out.println(p.getSubCategorys().get(0).getName());
//        out.println(p.getSubCategorys().get(0).getId());
//        out.println(p.getSubCategorys().get(0).getCategories().get(0).getId());
//        out.println(p.getSubCategorys().get(0).getCategories().get(0).getName());
        if (!check) {
            p = ps.getAllInforProductAccessory(id);
            request.setAttribute("p", p);
            request.getRequestDispatcher("/views/pages/edit_accessory.jsp").forward(request, response);
        } else {
            p = ps.getAllInforProductPet(id);
            request.setAttribute("p", p);
//            out.print(p.getPet().get(0).isVaccinated());
            request.getRequestDispatcher("/views/pages/edit_pet.jsp").forward(request, response);
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
