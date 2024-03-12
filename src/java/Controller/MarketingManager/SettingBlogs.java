/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.MarketingManager;

import Dao.BlogCategoryDAO;
import Dao.BlogDAO;
import Model.Blog;
import Model.BlogCategory;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import util.Pagination;

/**
 *
 * @author Admin
 */
//@WebServlet(name="SettingBlogs", urlPatterns={"/settingblogs"})
public class SettingBlogs extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SettingBlogs</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingBlogs at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        List<BlogCategory> blogCategories = blogCategoryDAO.getBlogCategorys();
        String search = request.getParameter("search");
        String blogcategoryID = request.getParameter("blogcategoryID");
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> settingblogs = blogDAO.getBlogs(search, blogcategoryID);
        request.setAttribute("settingblogs", settingblogs);

        HttpSession session = request.getSession();
        //pagging
        // pagging
        int litmitPage = 2;
        if (request.getParameter("cp") == null) {
            Pagination Page = new Pagination(settingblogs, litmitPage, 1);
            Pagination<Blog> pagination = new Pagination<>(settingblogs, litmitPage, 1);
            settingblogs = pagination.getItemsOnPage();
            session.setAttribute("page", Page);
            request.setAttribute("settingblogs", pagination.getItemsOnPage());
        } else if (request.getParameter("cp") != null) {
            int cp = Integer.parseInt(request.getParameter("cp"));
            Pagination Page = new Pagination(settingblogs, litmitPage, cp);
            Pagination<Blog> pagination = new Pagination<>(settingblogs, litmitPage, cp);
            settingblogs = pagination.getItemsOnPage();
            session.setAttribute("page", Page);
            request.setAttribute("settingblogs", settingblogs);
        }
        // set URL
        User user = (User) session.getAttribute("User");
        
         request.setAttribute("user", user);
        request.setAttribute("pagging", "settingblogs");

        request.setAttribute("blogcategories", blogCategories);
        request.setAttribute("blogcategoryID", blogcategoryID);
        request.getRequestDispatcher("settingblogs.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
