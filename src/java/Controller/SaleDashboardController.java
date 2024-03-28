/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.OrderDAO;
import Dao.OrderLineDAO;
import Dao.OrdersDAO;
import Dao.ProductsDAO;
import Dao.UserDAO;
import Model.OrderLine;
import Model.Products;
import Model.User;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SaleDashboardController", urlPatterns = {"/saledashboard"})
public class SaleDashboardController extends HttpServlet {

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
            out.println("<title>Servlet SaleDashboardController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashboardController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            User user = new User();
            int role = (int) user.getRole().getId();
            if (role == 1 || role == 5 || role == 6) {
                System.out.println("hehe");
            }
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
        String salerID = request.getParameter("salerID");
        String orderDate = request.getParameter("orderDate");
        String endDate = request.getParameter("endDate");
        String status = request.getParameter("status");
        String orderLineID = request.getParameter("orderLineID");
        OrderDAO orders = new OrderDAO();
        OrderLineDAO orderdao = new OrderLineDAO();
        if (salerID != null) {
            int saleid = Integer.parseInt(salerID);
            long orderlineid = Long.parseLong(orderLineID);
            orderdao.updateSalerForOrderLine(orderlineid, saleid);
        }
        if (orderDate != null) {
            LocalDateTime orderdate = LocalDateTime.parse(orderDate);
            long orderlineid = Long.parseLong(orderLineID);
            orderdao.updateOrderDateForOrderLine(orderlineid, orderDate);
        }
        if (endDate != null) {
            LocalDateTime enddate = LocalDateTime.parse(endDate);
            long orderlineid = Long.parseLong(orderLineID);
            orderdao.updateEndDateForOrderLine(orderlineid, endDate);
        }
        if (status != null) {
            long orderlineid = Long.parseLong(orderLineID);
            orderdao.updateStatusForOrderLine(orderlineid, status);
            if (status.equals("complete")) {
                orderdao.updateEndDateForOrderLine(orderlineid, LocalDateTime.now().toString());
                long orderID = orderdao.getOrderLinesByID(orderlineid).getOrderID();
                boolean check = true;
                for (OrderLine orderline1 : orderdao.getOrderLinesByOrderID(orderID)) {
                    if(!orderline1.getStatus().equals("complete")){
                        check = false;
                    }
                }
                if(check){
                    orders.updateOrderStatus(orderID, status);
                }
            }
        }
        ProductsDAO productsDAO = new ProductsDAO();
        ArrayList<Products> listproducts = productsDAO.getProducts();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        UserDAO users = new UserDAO();
        ArrayList<User> saleList = users.getUsersByRoleID(3);
        saleList.addAll(users.getUsersByRoleID(4));
        ArrayList<OrderLine> orderlines = new ArrayList<OrderLine>();
        orderlines = orderdao.getOrderLinesIn7Day();
        for (OrderLine orderLine : orderlines) {
            orderLine.setProduct(productsDAO.getProductsbyID(orderLine.getProductID()));
            orderLine.setSaler(users.getUserByID(orderLine.getSaleID()));
        }
        request.setAttribute("listproducts", listproducts);
        request.setAttribute("orderlines", orderlines);
        request.setAttribute("user", user);
        request.setAttribute("saleList", saleList);
        OrderLineDAO orderlineDAO = new OrderLineDAO();
        String[][] dataCompleted = orderlineDAO.getCompletedOrderLineDataCharts("");
        String[][] dataAll = orderlineDAO.getAllOrderLineDataCharts("");
        Gson gson = new Gson();
        String dataJsonAll = gson.toJson(dataAll);
        String dataJsonCompleted = gson.toJson(dataCompleted);
        request.setAttribute("dataChart1", dataJsonCompleted);
        request.setAttribute("dataChart2", dataJsonAll);
        orderdao.closeConnection();
        productsDAO.closeConnection();
        users.closeConnection();
        orderlineDAO.closeConnection();
        request.getRequestDispatcher("saledashboard.jsp").forward(request, response);

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
        ProductsDAO productsDAO = new ProductsDAO();
        ArrayList<Products> listproducts = productsDAO.getProducts();
        UserDAO users = new UserDAO();
        ArrayList<User> saleList = users.getUsersByRoleID(3);
        saleList.addAll(users.getUsersByRoleID(4));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        String selectedSale = request.getParameter("selectedSale");
        OrderLineDAO orderdao = new OrderLineDAO();

        if (!selectedSale.isEmpty() && selectedSale != null) {
            request.setAttribute("selectedSale1", selectedSale);
            selectedSale = " and orderline.saleid = " + selectedSale;
        }

        //response.getWriter().print(sql);
        ArrayList<OrderLine> orderlines = orderdao.getOrderLinesByStringSaleId(selectedSale);
        for (OrderLine orderLine : orderlines) {
            orderLine.setProduct(productsDAO.getProductsbyID(orderLine.getProductID()));
            orderLine.setSaler(users.getUserByID(orderLine.getSaleID()));
        }
        String[][] dataCompleted = orderdao.getCompletedOrderLineDataCharts(selectedSale);
        String[][] dataAll = orderdao.getAllOrderLineDataCharts(selectedSale);
        Gson gson = new Gson();
        String dataJsonAll = gson.toJson(dataAll);
        String dataJsonCompleted = gson.toJson(dataCompleted);
        request.setAttribute("dataChart1", dataJsonCompleted);
        request.setAttribute("dataChart2", dataJsonAll);

        request.setAttribute("user", user);
        request.setAttribute("saleList", saleList);
        request.setAttribute("listproducts", listproducts);
        request.setAttribute("orderlines", orderlines);
        productsDAO.closeConnection();
        users.closeConnection();
        orderdao.closeConnection();

        request.getRequestDispatcher("saledashboard.jsp").forward(request, response);

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
