/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDAO;
import Model.BusinessRule;
import Model.User;
//import com.sun.xml.internal.bind.v2.runtime.output.Encoded;
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
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        User x = (User) session.getAttribute("User");
        String oldPassword = request.getParameter("oldPass");
        
        String password1 = request.getParameter("pass1");
        String password2 = request.getParameter("pass2");
        String errorMessage = "";
        BusinessRule bs = new BusinessRule();
        UserDAO u = new UserDAO();
        out.println(oldPassword);
        out.println(password2);

        try {
            out.println(BusinessRule.encodePassword(oldPassword));
            out.println(x.getPassword());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        out.println(password1);
        out.println(password2);

        try {
            //              User x = u.getUserByEmail("hieunmhe171624@fpt.edu.vn");
//           String oldPassword2 ;
//        try {
//            oldPassword2 = BusinessRule.encodePassword(oldPassword);
//        } catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
//        }
            if (!BusinessRule.encodePassword(oldPassword).equals(x.getPassword())) {
                errorMessage = "Old Password is incorrect. Please re-enter your old password.";
            
                


            }else if (oldPassword.equals(password1)){
                errorMessage = "The old password and the new password must not be the same";
            
            
                
            }
            else if (!isPasswordValid(password1)) {
                errorMessage = "New password must have at least 8 characters, start with an uppercase letter, and contain at least one special character";
                  }
            else if (!password1.equals(password2)) {
                errorMessage = "New password and repeat new password again does not match";
//

            } else {
                
                try {
                    u.updatePassword(password2, x.getEmail());
                           

                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
                }
                errorMessage = "Password change successfully";
                
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("changepassword.jsp").forward(request, response);

//        
    }

    /**
     *
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    private boolean isPasswordValid(String password) {
    // Kiểm tra có ít nhất 8 kí tự, chữ cái đầu tiên viết hoa, và ít nhất một ký tự đặc biệt
    return password.length() >= 8 &&
           Character.isUpperCase(password.charAt(0)) &&
           containsSpecialCharacter(password);
}

// Hàm kiểm tra xem có ít nhất một ký tự đặc biệt trong mật khẩu
private boolean containsSpecialCharacter(String password) {
    // Thay thế bảng mã này bằng bảng mã thực tế của các ký tự đặc biệt mà bạn muốn kiểm tra
    String specialCharacters = "!@#$%^&*()-_=+[]{}|;:'\",.<>?/";
    
    for (char c : specialCharacters.toCharArray()) {
        if (password.contains(String.valueOf(c))) {
            return true;
        }
    }
    
    return false;
}

}
