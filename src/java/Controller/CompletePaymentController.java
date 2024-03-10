/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CartDAO;
import Dao.ProductsDAO;
import Model.Cart;
import Model.CartItem;
import Model.Products;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CompletePaymentController extends HttpServlet {

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
            out.println("<title>Servlet CompletePaymentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompletePaymentController at " + request.getContextPath() + "</h1>");
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

        String resultCode = request.getParameter("resultCode");
        //neu thanh toan thanh cong
        if (resultCode.equals("0")) {
            String partnerCode = request.getParameter("partnerCode");
            String requestId = request.getParameter("requestId");
            long amount = Long.parseLong(request.getParameter("amount"));
            String signature = request.getParameter("signature");
            Long orderId = Long.parseLong(request.getParameter("orderId"));

            HttpSession session = request.getSession();

            String name = (String) session.getAttribute("recipientName");
            String address = (String) session.getAttribute("recipientAddr");
            String phone = (String) session.getAttribute("recipientPhone");

            CartDAO cartDao = new CartDAO();

            //them thong tin thanh toan va thay doi trang thai don hang
            cartDao.updateStatusOrder(orderId);
            cartDao.updateStatusOrderLine(orderId);
            
            cartDao.insertMomo(partnerCode, requestId, amount, signature, name, address, phone, orderId);

            //cap nhat so luong san pham trong kho
            Cart cart = cartDao.getCartByUserID(((User) session.getAttribute("User")).getId());
            ProductsDAO productDao = new ProductsDAO();

            for (CartItem item : cart.getItems()) {
                Products product = productDao.getProductsbyID(item.getProductid().intValue());               
                int newInventory = product.getInventory() - item.getQuantity();
                cartDao.updateInventory(item.getProductid(), newInventory);
            }
            
            //Clear gio hang hien tai cua customer
            cartDao.clearCartItems(cart.getId());
            cartDao.clearCart(cart.getId());
            
            
            //chuyen huong ve trang cam on
            response.sendRedirect("thanks.jsp");
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
