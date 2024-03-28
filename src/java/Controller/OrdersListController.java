/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.*;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrdersListController extends HttpServlet {

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
            out.println("<title>Servlet OrdersListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrdersListController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        UserDAO userDAO = new UserDAO();
        ArrayList<User> customerlist = userDAO.getUsersByRoleID(1);
        OrdersDAO orderdao = new OrdersDAO();
        ArrayList<Orders> orderlist = orderdao.getOrders();
        request.setAttribute("user", user);
        request.setAttribute("orderlist", orderlist);
        request.setAttribute("customerlist", customerlist);
        //response.getWriter().print(saleName.get(0));
        userDAO.closeConnection();
        orderdao.closeConnection();
        request.getRequestDispatcher("orderslist.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        OrdersDAO orderdao = new OrdersDAO();
        User user = (User) session.getAttribute("User");
        UserDAO userDAO = new UserDAO();
        ArrayList<User> customerlist = userDAO.getUsersByRoleID(1);
        String selectedCustomer = request.getParameter("selectedCustomer");
        String selectedStatus = request.getParameter("selectedStatus");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        if (!selectedCustomer.isEmpty() && selectedCustomer != null) {
            request.setAttribute("selectedCustomer", selectedCustomer);
            selectedCustomer = " and orders.userid = " + selectedCustomer;
        }
        if (!selectedStatus.isEmpty() && selectedStatus != null) {
            request.setAttribute("selectedStatus", selectedStatus);
            selectedStatus = " and orders.status = '" + selectedStatus +"' ";
        }
        if (!fromdate.isEmpty() && fromdate != null) {
            request.setAttribute("fromdate", fromdate);
            fromdate = " and orders.orderdate >= '" + fromdate + "' ";
        }
        if (!todate.isEmpty() && todate != null) {
            request.setAttribute("todate", todate);
            todate = " and orders.orderdate <= '" + todate+"' ";
        }
        ArrayList<Orders> orderlist = orderdao.getOrdersByCustomerByStatusByOrderDate(selectedCustomer, selectedStatus, fromdate, todate);
        request.setAttribute("user", user);
        request.setAttribute("orderlist", orderlist);
        request.setAttribute("customerlist", customerlist);
        orderdao.closeConnection();
        userDAO.closeConnection();
        request.getRequestDispatcher("orderslist.jsp").forward(request, response);
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
