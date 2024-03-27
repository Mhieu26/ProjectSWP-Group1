
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.CartDAO;
import Dao.ProductsDAO;
import Model.CartItem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AddToCartController extends HttpServlet {
   
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
            out.println("<title>Servlet AddToCartController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath () + "</h1>");
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
        Long productid = null;
        int quantity = 0;
        try {
            productid = Long.parseLong(request.getParameter("productid"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        
        HttpSession session = request.getSession();
        
        User user = (User)session.getAttribute("User");
        
        if(user == null){
            request.getRequestDispatcher("login").forward(request, response);
        }else{
            CartDAO cartDao = new CartDAO();
            List<CartItem> items = cartDao.getCartItemsByUserID(user.getId());
            boolean isExisted = false;
            
            //check if the product is existed in cart, if it is the quantity will increase, if not just add it into cart            
            for (CartItem item : items) {
                if(item.getProductid().toString().equals(productid.toString())){
                    isExisted = true;
                    //case 1: the product is existed in cart, so we will increase the quantity
                    double unitprice = item.getPrice()/item.getQuantity();
                    int newquantity = item.getQuantity()+quantity;
                    cartDao.updateCartItem(item.getId(), newquantity, unitprice*newquantity);
                    break;
                }
            }
            
            //case 2: the product is not existed in cart, so we will add it into cart
            ProductsDAO productDao = new ProductsDAO();
            if(!isExisted){
                cartDao.insertNewCartItem(quantity, productDao.getProductsbyID(productid.intValue()).getPrice()*quantity
                        , cartDao.getCartByUserID(user.getId()).getId(), productid);
            }
            
        }
        String previousPage = request.getHeader("Referer");
        System.out.println(previousPage);
        response.sendRedirect(previousPage);
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
