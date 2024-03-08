/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.OrderDAO;
import Dao.UserDAO;
import Model.Order;
import Model.Products;
import Model.User;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author DELL
 */
public class adminDashboardController extends HttpServlet {

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
            out.println("<title>Servlet adminDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminDashboardController at " + request.getContextPath() + "</h1>");
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
        
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Timestamp fromDate = convertTimestamp(startDate);
        Timestamp toDate = convertTimestamp(endDate);
        OrderDAO orderDAO = new OrderDAO();
        UserDAO udb = new UserDAO();
                List<User> top5Users = udb.get5LastestUsers();

        HashMap<String, Integer> orderByStatus = orderDAO.getOrderByStatus();
        List<Order> top5Orders = orderDAO.getTop5Orders();
        Long total = orderDAO.getTotal();
       
        HashMap<Products, Integer> top5Products = orderDAO.getTop5Products();
        List<Order> top7Orders = orderDAO.getTop7Orders(fromDate,toDate);
        request.setAttribute("users",top5Users);
        request.setAttribute("orders", orderByStatus);
        request.setAttribute("top5orders", top5Orders);
        request.setAttribute("top7Orders", top7Orders);
        request.setAttribute("products", top5Products);
        request.setAttribute("total", total);
        String formatFromDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(fromDate);
        String formatToDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(toDate);
        request.setAttribute("fromDate", formatFromDate);
        request.setAttribute("toDate", formatToDate);
        
        Gson gson = new Gson();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(gson.toJson(orderDAO.getAllOrders()));
        request.setAttribute("user", user);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
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

    private Timestamp convertTimestamp(String strDate) {
        try {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            // you can change format of date
            Date date = formatter.parse(strDate);
            Timestamp timeStampDate = new Timestamp(date.getTime());

            return timeStampDate;
        } catch (Exception e) {
            System.out.println("Exception :" + e);
            return new Timestamp(System.currentTimeMillis());
        }
    }
}
