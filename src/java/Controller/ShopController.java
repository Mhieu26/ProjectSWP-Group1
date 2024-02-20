/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.ImageDAO;
import Dao.ProductsDAO;
import Model.Category;
import Model.Image;
import Model.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author toanl
 */
public class ShopController extends HttpServlet {
   
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
            out.println("<title>Servlet ShopController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopController at " + request.getContextPath () + "</h1>");
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
           ProductsDAO pd=new ProductsDAO();
          ImageDAO id=new ImageDAO();
           ArrayList<Image> thumbnails=id.getThumbmails();
          ArrayList<Category> listc=pd.getCategory();
          ArrayList<Products> featured=pd.getFeaturedProducts();
          ArrayList<Products> get3newest=pd.get3Newest();
        ArrayList<Products> products=pd.getProducts();
      
        String productid=request.getParameter("id");
          String action = request.getParameter("action");
        String cate = request.getParameter("cate");
        String sort=request.getParameter("sort");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        String search = request.getParameter("search");
          ArrayList<Products> listp=pd.getAllProduct(null, null, null, null,sort);
          if (action == null || action.equals("")) {
            listp = (ArrayList<Products>) pd.getAllProduct(null, null, null, null,sort);
       
        } else if (action.equals("cate")) {
            listp = (ArrayList<Products>) pd.getAllProduct(null, cate, null, null,sort);
   
        } else if (action.equals("search")) {
            listp = (ArrayList<Products>) pd.getAllProduct(search, null, null, null,sort);
            
        } else if (action.equals("price")) {
            if (minPrice.equals("")) {
                listp = (ArrayList<Products>) pd.getAllProduct(null, null, null, maxPrice,sort);
             
            } else if (maxPrice.equals("")) {
                listp = (ArrayList<Products>) pd.getAllProduct(null, null, minPrice, null,sort);
            }else if (maxPrice.equals("") && minPrice.equals("")){
                 listp = (ArrayList<Products>) pd.getAllProduct(null, null, null, null,sort);
            } else{
                  listp = (ArrayList<Products>) pd.getAllProduct(null, null, minPrice, maxPrice,sort);
            }
        }
//          if(Integer.parseInt(productid)!=0){
//               request.getRequestDispatcher("shop.jsp").forward(request, response);
//              }else{
//               request.getRequestDispatcher("shopdetail.jsp").forward(request, response);
//          }
          
          request.setAttribute("listp", listp);
           request.setAttribute("action", action);
        request.setAttribute("cate", cate);
        request.setAttribute("sort", sort);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);
        request.setAttribute("search", search);
        request.setAttribute("listc", listc);
         request.setAttribute("featured", featured);
         request.setAttribute("thumbnails", thumbnails);
         request.setAttribute("get3newest", get3newest);
        request.setAttribute("products", products);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
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
        
//
//    Connection cnn; // ket noi db
//    Statement stm; // thuc thi cac cau lenh sql
//    ResultSet rs; // luu tru va xu ly du lieu
           String productid = request.getParameter("id");

        HttpSession session = request.getSession();
        java.util.Enumeration em = session.getAttributeNames();
//
        Products product = (Products) session.getAttribute(productid);
//        try {
//            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
//            String sql = "select * from product where id = " +productid;
//            rs = stm.executeQuery(sql);
//            while (rs.next()) {
//                Long id=rs.getLong(1);
//                String name=rs.getString(2);
//                double price=rs.getDouble(3);
//                String description=rs.getString(4);
//                String maker=rs.getString(5);
//                int status=rs.getInt(6);
//                int inventory=rs.getInt(7);
//                int categoryid=rs.getInt(8);
//             product=new Products(Long.parseLong(productid), name, 0, description, maker, status, inventory, categoryid);
//            }
//        } catch (Exception e) {
//            System.out.println("getlist Error:" + e.getMessage());
//        }
//        
        session.setAttribute(productid, product);
        response.sendRedirect("shop?id=" + productid);
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
