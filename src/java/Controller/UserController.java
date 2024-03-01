/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.UserDAO;
import Model.Image;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class UserController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
         UserDAO dao = new UserDAO();
//         User user = dao.getUserByEmail("hieunmhe171624@fpt.edu.vn");
      
         Image img = dao.getImageByUserID((int) user.getId());
//         String sourceimg = img.getSource();
        request.setAttribute("img", img);
        request.setAttribute("user", user);
        request.getRequestDispatcher("userprofile.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        UserDAO dao = new UserDAO();
        Boolean gender;
        String msg = "";
String genderParam = request.getParameter("gender");

if ("1".equals(genderParam)) {
    gender = true;  // Male
} else if ("0".equals(genderParam)) {
    gender = false;  // Female
} else {
    // Handle invalid gender parameter here if needed
    gender = null;  // or set a default value, depending on your requirements
}

        if (name == null || name.trim().isEmpty()) {
             msg = "Name cannot be empty";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
            return; // Stop further processing
        }
        if (phone == null || phone.trim().isEmpty() || !phone.matches("\\d{10}")) {
             msg = "Invalid phone number. It must be 10 digits long and contain only numeric characters.";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
            return; // Stop further processing
        }
         if (address == null || address.trim().isEmpty()) {
             msg = "Address cannot be empty";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
            return; // Stop further processing
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        
        dao.updateUser(user, name, phone, gender, address);
        if(image.endsWith(".jpg")){
        Image img = dao.getImageByUserID((int) user.getId());      
        try {
            dao.updateImageByID(image, user.getId());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
                request.setAttribute("img", img);

        }
        String msg1="Change sucessfully";
        request.setAttribute("msg", msg);
                request.setAttribute("msg1", msg1);

    response.sendRedirect("userController");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
