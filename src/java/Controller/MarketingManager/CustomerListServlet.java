/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.MarketingManager;

import Dao.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CustomerListServlet", urlPatterns = {"/customersList"})
public class CustomerListServlet extends HttpServlet {

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
             HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        
            UserDAO userDAO = new UserDAO();
            // Số trang hiện tại
            int page = 1;
// Số lượng bản ghi trên mỗi trang
            int recordsPerPage = 5;
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

// Tính toán offset dựa trên số trang hiện tại và số lượng bản ghi trên mỗi trang
            int offset = (page - 1) * recordsPerPage;

// Lấy danh sách người dùng cho trang hiện tại
            List<User> customers = userDAO.getCustomers(offset, recordsPerPage);

// Lấy tổng số lượng bản ghi để tính số trang
            int numberOfRecords = userDAO.getNumberOfRecords();
            int numberOfPages = (int) Math.ceil(numberOfRecords * 1.0 / recordsPerPage);

// Đặt dữ liệu vào request attribute để chuyển đến JSP
            request.setAttribute("user", user);
            request.setAttribute("customers", customers);
            request.setAttribute("numberOfPages", numberOfPages);
            request.setAttribute("currentPage", page);

// Forward sang trang JSP
            request.getRequestDispatcher("customerslist.jsp").forward(request, response);
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
        processRequest(request, response);
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
