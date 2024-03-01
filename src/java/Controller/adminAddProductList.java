/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.CategoryDAO;
import Dao.ProductsDAO;
import Model.Category;
import Model.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author toanl
 */
public class adminAddProductList extends HttpServlet {
   
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
            out.println("<title>Servlet adminAddProductList</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminAddProductList at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("adminAddProductList.jsp").forward(request, response);
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
         String pid = request.getParameter("pid");
        String maker = request.getParameter("maker");
        String name = request.getParameter("name");
        int cid = Integer.parseInt(request.getParameter("cid"));   
        double price = Double.parseDouble(request.getParameter("price"));       
        String description = request.getParameter("description");
        int inventory=Integer.parseInt(request.getParameter("inventory"));
        CategoryDAO cd = new CategoryDAO();
        ArrayList<Category> cates = cd.getCategory();
        request.setAttribute("cates", cates);
        ProductsDAO pd = new ProductsDAO();
        switch (request.getParameter("in")) {
            case "Add":
                if (pd.addProduct(name, price, description, maker, true, inventory, cid) == 0) {
                    request.setAttribute("error", "Add Failed! Please try again!");
                    request.setAttribute("s", new Products(Long.parseLong("0"), name, price, description, maker, true, inventory, cid));
                    request.getRequestDispatcher("adminAddProductList.jsp").forward(request, response);
                } 
                 else {
                    request.setAttribute("error", "Add Successfully!");
                    request.setAttribute("service", "Add");
                    request.getRequestDispatcher("adminAddProductList.jsp").forward(request, response);
                }
                break;
              
            
        }

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
