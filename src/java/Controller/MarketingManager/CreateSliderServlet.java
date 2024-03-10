/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.MarketingManager;

import Dao.SliderDAO;
import Model.Slider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CreateSliderServlet", urlPatterns = {"/createSlider"})
public class CreateSliderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("createSlider.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            String title = request.getParameter("title");
            String backlink = request.getParameter("backlink");
            String img = request.getParameter("img");
            Slider slider = new Slider(1L, title, backlink, img);
            SliderDAO sliderDAO = new SliderDAO();
            sliderDAO.createSlider(slider);
            response.sendRedirect("slidersList");
        }
    }

}
