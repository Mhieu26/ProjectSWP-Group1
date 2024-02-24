/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.FeedbackDAO;
import Dao.ImageDAO;
import Dao.ProductsDAO;
import Dao.SpecificationDAO;
import Dao.UserDAO;
import Model.Category;
import Model.Feedback;
import Model.Image;
import Model.Products;
import Model.Specification;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author toanl
 */
public class ShopDetailController extends HttpServlet {

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
            out.println("<title>Servlet ShopDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopDetailController at " + request.getContextPath() + "</h1>");
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
        String productid = request.getParameter("id");
        String cateid = request.getParameter("cateid");

        ProductsDAO pd = new ProductsDAO();
        ArrayList<Products> get3newest = pd.get3Newest();
        SpecificationDAO sd = new SpecificationDAO();
        ImageDAO id = new ImageDAO();
        FeedbackDAO fd = new FeedbackDAO();
        UserDAO ud = new UserDAO();
        ArrayList<User> user = ud.getUsers();
        ArrayList<Feedback> feedback = fd.getFeedbackByProducgtID(Integer.parseInt(productid));
        ArrayList<Image> thumbnails = id.getThumbmails();
        ArrayList<Category> listc = pd.getCategory();

        ArrayList<Products> categories = pd.getProductsbyCateID(Integer.parseInt(cateid));
        ArrayList<Image> detail = id.getDetails();
        ArrayList<Specification> spec = sd.getSpecByPId(Integer.parseInt(productid));
        Products product = pd.getProductsbyID(Integer.parseInt(productid));
        request.setAttribute("listc", listc);
        request.setAttribute("get3newest", get3newest);
        request.setAttribute("user", user);
        request.setAttribute("feedback", feedback);
        request.setAttribute("categories", categories);
        request.setAttribute("thumbnails", thumbnails);
        request.setAttribute("detail", detail);
        request.setAttribute("product", product);
        request.setAttribute("spec", spec);
        request.getRequestDispatcher("shopdetail.jsp").forward(request, response);
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
