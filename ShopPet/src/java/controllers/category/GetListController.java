/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.category;

import dal.CategoryDAO;
import dal.DBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Category;
import services.CategoryService;

/**
 *
 * @author win
 */
public class GetListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CategoryService c = new CategoryService();
        List<Category> categories = c.getAllCategory();
        request.getSession().setAttribute("categories", categories );
        response.getWriter().print(categories.get(1).getName());
//        request.getRequestDispatcher("views/pages/home.jsp").forward(request, response);
    } 
    public static void main(String[] args) {
        CategoryService c = new CategoryService();
        List<Category> categories = c.getAllCategory();
        for (Category q : categories) {
            System.out.println(q);
        }
    }

}
