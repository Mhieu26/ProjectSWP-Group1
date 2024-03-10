/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dao.*;
import Model.*;
import java.util.ArrayList;

/**
 *
 * @author ducng
 */
public class OrderDetailsController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailsController at " + request.getContextPath() + "</h1>");
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
        User user = (User) request.getSession().getAttribute("User");
        String orderID = request.getParameter("orderID");
        String orderLineID = request.getParameter("orderLineID");
        String stringSalerID = request.getParameter("salerID");
        String status = request.getParameter("status");
        String salenote = request.getParameter("salenote");
        UserDAO users = new UserDAO();
        OrderLineDAO orderLineDAO = new OrderLineDAO();
        OrderDAO orderDAO = new OrderDAO();
        if (orderLineID != null) {
            int oID = Integer.parseInt(orderLineID);
            if (stringSalerID != null) {
                int saleID = Integer.parseInt(stringSalerID);
                orderLineDAO.updateSalerForOrderLine(oID, saleID);
            }
            if (salenote != null) {
                orderLineDAO.updateSaleNoteForOrderLine(oID, salenote);
            }
        }
        if (orderID != null) {
            long id = Long.parseLong(orderID);
            if (status != null) {
                orderDAO.updateOrderStatus(id, status);
            }
            ArrayList<User> saleList = users.getUsersByRoleID(3);
            request.setAttribute("saleList", saleList);
            ArrayList<OrderLine> orderLines = orderLineDAO.getOrderLinesByOrderID(id);
            request.setAttribute("orderLines", orderLines);
            Order order = orderDAO.getOrderByID(id);
            request.setAttribute("order", order);
            User userOrder = order.getUser();
            request.setAttribute("userOrder", userOrder);

            request.getRequestDispatcher("orderdetails.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("orderslist").forward(request, response);
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
