/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.*;
import Dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class FeedBackDetailsController extends HttpServlet {

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
            out.println("<title>Servlet FeedBackDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedBackDetailsController at " + request.getContextPath() + "</h1>");
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
        String feedbackID = request.getParameter("feedbackID");
        String status = request.getParameter("status");
        FeedbackDAO dao = new FeedbackDAO();

        if (status != null) {
            int feedbackid = Integer.parseInt(feedbackID);
            boolean stat = Boolean.parseBoolean(status);
            if (!stat) {
                dao.updateFeedbackStatus(feedbackid,"true");
            } else {
                dao.updateFeedbackStatus(feedbackid,"false");
            }

            
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            Feedback feedback = new Feedback();
            feedback = feedbackDAO.getFeedbackByID(feedbackid);
            request.setAttribute("feedback", feedback);
            ProductsDAO proDAO = new ProductsDAO();
            Products product = proDAO.getProductsbyID(feedback.getProductid());
            request.setAttribute("product", product);
            
            ArrayList<Feedback> feedbackslist = feedbackDAO.getAllFeedbackByProducgtID(feedback.getProductid());
            request.setAttribute("feedbackslist", feedbackslist);
            request.getRequestDispatcher("feedbackdetails.jsp").forward(request, response);
            

        }
        
        if (status == null) {
            int id = Integer.parseInt(feedbackID);
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            Feedback feedback = new Feedback();
            feedback = feedbackDAO.getFeedbackByID(id);
            request.setAttribute("feedback", feedback);
            ProductsDAO proDAO = new ProductsDAO();
            Products product = proDAO.getProductsbyID(feedback.getProductid());
            request.setAttribute("product", product);
            ArrayList<Feedback> feedbackslist = feedbackDAO.getFeedbackByProducgtID(feedback.getProductid());
            request.setAttribute("feedbackslist", feedbackslist);
            request.getRequestDispatcher("feedbackdetails.jsp").forward(request, response);
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
