/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.OrderLineDAO;
import Dao.ProductsDAO;
import Dao.UserDAO;
import Model.OrderLine;
import Model.Products;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
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
        OrderLineDAO orderdao = new OrderLineDAO();
        ProductsDAO productsDAO = new ProductsDAO();
        ArrayList<Products> listproducts = productsDAO.getProducts();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        UserDAO users = new UserDAO();
        ArrayList<User> saleList = users.getUsersByRoleID(3);
        saleList.addAll(users.getUsersByRoleID(4));
        ArrayList<OrderLine> orderlines = new ArrayList<OrderLine>();
        orderlines = orderdao.getOrderLines();
        for(OrderLine orderLine : orderlines){
            orderLine.setProduct(productsDAO.getProductsbyID(orderLine.getProductID()));
            orderLine.setSaler(users.getUserByID(orderLine.getSaleID()));
        }
        request.setAttribute("listproducts", listproducts);
        request.setAttribute("orderlines", orderlines);
        request.setAttribute("user", user);
        request.setAttribute("saleList", saleList);
        //response.getWriter().print(saleName.get(0));
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
        String selectedStatus = request.getParameter("selectedStatus");
        String selectedProduct = request.getParameter("selectedProduct");
        String selectedStartDate = request.getParameter("startdate");
        String selectedEndDate = request.getParameter("enddate");
        OrderLineDAO orderdao = new OrderLineDAO();
        if(!selectedStartDate.isEmpty()&&selectedStartDate!=null){
            request.setAttribute("selectedStartDate1", selectedStartDate);
            selectedStartDate=" and orderdate >= '"+selectedStartDate+"' ";
        }
        if(!selectedEndDate.isEmpty()&&selectedEndDate!=null){
            request.setAttribute("selectedEndDate", selectedEndDate);
            selectedEndDate=" and enddate <= '"+ selectedEndDate+"' ";
        }
        if(!selectedSale.isEmpty()&&selectedSale!=null){
            request.setAttribute("selectedSale", selectedSale);
            selectedSale=" and saleid = "+selectedSale;
        }
        if(!selectedStatus.isEmpty()&&selectedStatus!=null){
            request.setAttribute("selectedStatus1", selectedStatus);
            selectedStatus=" and status = '" +selectedStatus+"' ";
        }
        if(!selectedProduct.isEmpty()&&selectedProduct!=null){
            request.setAttribute("selectedProduct1", selectedProduct);
            selectedProduct=" and productid = "+selectedProduct;
        }
        //response.getWriter().print(sql);
        ArrayList<OrderLine> orderlines = orderdao.getOrderLinesBySaleIdByStatusByProductid(selectedSale,selectedStatus,selectedProduct, selectedStartDate, selectedEndDate);
        for(OrderLine orderLine : orderlines){
            orderLine.setProduct(productsDAO.getProductsbyID(orderLine.getProductID()));
            orderLine.setSaler(users.getUserByID(orderLine.getSaleID()));
        }
        request.setAttribute("user", user);
        request.setAttribute("saleList", saleList);
        request.setAttribute("listproducts", listproducts);
        request.setAttribute("orderlines", orderlines);    
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
