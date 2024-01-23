/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.NoSuchAlgorithmException;
import Model.BusinessRule;
import Model.MailConfig;
import Model.User;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * servlet to operate register feature
 * @author toanl
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        String success = request.getParameter("success");
        if(success != null && success.equalsIgnoreCase("true")){
            request.setAttribute("notice", "An email has been sent to your email address to verify your account, please check!");
            request.getRequestDispatcher("notice.jsp").forward(request, response);
            return;
        }
        
        request.getRequestDispatcher("./views/auth/register.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        //check if the email are existed or not
        UserDAO udb = new UserDAO();
        User user = udb.getUserByEmail(email);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (user == null) {
            String password = null;
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            boolean sex = false;
            //password must be encoded
            try {
                password = BusinessRule.encodePassword(request.getParameter("password"));
                sex = Boolean.parseBoolean(request.getParameter("sex"));
            } catch (NoSuchAlgorithmException | NumberFormatException e) {
                System.out.println(e);
            }
            //get verification code and store in db
            String verificationCode = sendActivateMail(email);

            udb.insertUser(email, password, name, phone, address, sex, verificationCode);

            response.getWriter().write("true");
        } else {
            response.getWriter().write("false");
        }

    }
    /**
     * method to send an email to user to activate their account
     * @param recipiant email address of user
     * @return the verificationCode
     */
    public String sendActivateMail(String recipiant) {
        // Get properties object
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", MailConfig.HOST_NAME);
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.port", MailConfig.TSL_PORT);

        // get Session
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailConfig.APP_EMAIL, MailConfig.APP_PASSWORD);
            }
        });
        //generate an unique code
        String verificationCode = UUID.randomUUID().toString();

        String activateLink = "http://localhost:9999/SWP/activate?email=" + recipiant + "&code=" + verificationCode;

        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipiant));
            message.setSubject("Activate Your Account");

            String htmlContent = "<center>\n"
                    + "		<h1>Welcome to Nowhere</h1>\n"
                    + "		<div>\n"
                    + "			<img src=\"https://bizweb.dktcdn.net/100/438/408/files/anh-cho-meme-yody-vn53.jpg?v=1687918736357\" alt=\"\"\n"
                    + "				width=\"30%\">\n"
                    + "		</div>\n"
                    + "		<h3>Click <a href='"+activateLink+"'>Here</a> to verify your account</h3>\n"
                    + "	</center>";
            message.setContent(htmlContent, "text/HTML");

            // send message
            Transport.send(message);

            System.out.println("Message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return verificationCode;
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
