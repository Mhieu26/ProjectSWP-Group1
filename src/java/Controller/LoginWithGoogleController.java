/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDAO;
import Model.GooglePojo;
import Model.GoogleUtils;
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
public class LoginWithGoogleController extends HttpServlet {

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
            out.println("<title>Servlet LoginWithGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginWithGoogle at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html; charset=UTF-8");request.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("home")
                    .forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            
            UserDAO udb = new UserDAO();
            User user = udb.getGoogleUser(googlePojo.getEmail());
            
            if(user == null){ // ìf this google user have never log in before
                udb.insertGoogleUser(googlePojo.getEmail(), googlePojo.getName(),
                        googlePojo.getPhoneNumber(), googlePojo.getGender());
            }
            if(user != null && !user.isIsGoogleUser()){//this google user is a customer already
                udb.setGoogleUser(googlePojo.getEmail());
            }
            
//            request.setAttribute("id", googlePojo.getId());
//            request.setAttribute("name", googlePojo.getName());
//            request.setAttribute("given_name", googlePojo.getGiven_name());
//            request.setAttribute("family_name", googlePojo.getFamily_name());
//            request.setAttribute("avt", googlePojo.getPicture());
//            request.setAttribute("email", googlePojo.getEmail());
//            request.setAttribute("phone_number", googlePojo.getPhoneNumber());
//            request.setAttribute("gender", googlePojo.getGender());
//            request.getRequestDispatcher("index.jsp").
//                    forward(request, response);
//            
//            
            HttpSession ss = request.getSession();
            ss.setAttribute("User", user);  //store user in a session
            ss.setAttribute("GoogleAvatar", googlePojo.getPicture()); // store user avatar as well
            request.getRequestDispatcher("./home").forward(request, response);
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
        doGet(request, response);
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
