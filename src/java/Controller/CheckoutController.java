/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CartDAO;
import Model.Cart;
import Model.CartItem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;

/**
 *
 * @author Admin
 */
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        Long userid = null;

        try {
            userid = Long.parseLong(request.getParameter("userid"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        CartDAO cartDao = new CartDAO();
        Cart cart = cartDao.getCartByUserID(userid);
        request.setAttribute("Cart", cart);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        Long userid = null;

        try {
            userid = Long.parseLong(request.getParameter("userid"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        CartDAO cartDao = new CartDAO();
        Cart cart = cartDao.getCartByUserID(userid);

        DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");

        String responseText = "";
        for (CartItem item : cart.getItems()) {
            responseText += "<div class=\"media\">\n"
                    + "                                        <a class=\"pull-left\" href=\"#!\">\n"
                    + "                                            <img class=\"media-object\" style=\"width:5000px;\" src=\"" + item.getSource() + "\" alt=\"image\" />\n"
                    + "                                        </a>\n"
                    + "                                        <div class=\"media-body\">\n"
                    + "                                            <h4 class=\"media-heading\"><a href=\"#!\"" + ">" + item.getName() + "</a></h4>\n"
                    + "                                            <div class=\"cart-price\">\n"
                    + "                                                <span>" + item.getQuantity() + " x</span>\n"
                    + "                                                <span>" + decimalFormat.format(item.getPrice() / item.getQuantity()).replaceAll("\\.00$", "") + "</span>\n"
                    + "                                            </div>\n"
                    + "                                            <h5><strong>" + decimalFormat.format(item.getPrice()).replaceAll("\\.00$", "") + "</strong></h5>\n"
                    + "                                        </div>\n"
                    + "                                    </div> \n";
        }

        responseText += "<div class=\"cart-summary\">\n"
                + "                                        <span>Total</span>\n"
                + "                                        <span class=\"total-price\"" + ">" + decimalFormat.format(cart.getTotal()).replaceAll("\\.00$", "") + "</span>\n"
                + "                                    </div>\n"
                + "                                    <ul class=\"text-center cart-buttons\">\n"
                + "                                        <li><a href=\"" + "cart?userid=" + user.getId() + "\" class=\"btn btn-small\">View Cart</a></li>\n";
        if (!cart.getItems().isEmpty()) {
            responseText += "                                        <li><a href=\"" + "checkout?userid=" + user.getId() + "\" class=\"btn btn-small btn-solid-border\">Checkout</a></li>\n";
        }else{
            responseText += "                                        <li><a href=\"\" class=\"btn btn-small btn-solid-border\">Checkout</a></li>\n";
        }
        responseText += "                                    </ul>";

        response.getWriter().write(responseText);
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
