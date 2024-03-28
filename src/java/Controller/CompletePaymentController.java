/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CartDAO;
import Dao.ProductsDAO;
import Model.Cart;
import Model.CartItem;
import Model.MailConfig;
import Model.Products;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
 *
 * @author Admin
 */
public class CompletePaymentController extends HttpServlet {

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
            out.println("<title>Servlet CompletePaymentController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompletePaymentController at " + request.getContextPath() + "</h1>");
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

        String resultCode = request.getParameter("resultCode");
        //neu thanh toan thanh cong
        if (resultCode.equals("0")) {
            String partnerCode = request.getParameter("partnerCode");
            String requestId = request.getParameter("requestId");
            long amount = Long.parseLong(request.getParameter("amount"));
            String signature = request.getParameter("signature");
            Long orderId = Long.parseLong(request.getParameter("orderId"));

            HttpSession session = request.getSession();

            String name = (String) session.getAttribute("recipientName");
            String address = (String) session.getAttribute("recipientAddr");
            String phone = (String) session.getAttribute("recipientPhone");

            CartDAO cartDao = new CartDAO();

            //them thong tin thanh toan va thay doi trang thai don hang
            cartDao.updateStatusOrder(orderId);
            cartDao.updateStatusOrderLine(orderId);

            cartDao.insertMomo(partnerCode, requestId, amount, signature, name, address, phone, orderId);

            //cap nhat so luong san pham trong kho
            Cart cart = cartDao.getCartByUserID(((User) session.getAttribute("User")).getId());
            ProductsDAO productDao = new ProductsDAO();

            for (CartItem item : cart.getItems()) {
                Products product = productDao.getProductsbyID(item.getProductid().intValue());
                int newInventory = product.getInventory() - item.getQuantity();
                cartDao.updateInventory(item.getProductid(), newInventory);
            }

            //Gui mail xac nhan va feedback
            sendOrderInforEmail(((User) session.getAttribute("User")).getEmail(), cart, name, address, phone);
            
            //Clear gio hang hien tai cua customer
            cartDao.clearCartItems(cart.getId());
            cartDao.clearCart(cart.getId());

            
            //chuyen huong ve trang cam on
            response.sendRedirect("thanks.jsp");
        }
    }

    public void sendOrderInforEmail(String recipiant, Cart cart, String name, String address, String phone) {
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

        //get cart detail
        String cartDetail = "<head>\n"
                + "    <style>\n"
                + "        .styled-table {\n"
                + "            border-collapse: collapse;\n"
                + "            margin: 25px 0;\n"
                + "            font-size: 0.9em;\n"
                + "            font-family: sans-serif;\n"
                + "            min-width: 400px;\n"
                + "            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);\n"
                + "        }\n"
                + "\n"
                + "        .styled-table thead tr {\n"
                + "            background-color: #009879;\n"
                + "            color: #ffffff;\n"
                + "            text-align: left;\n"
                + "        }\n"
                + "\n"
                + "        .styled-table th,\n"
                + "        .styled-table td {\n"
                + "            padding: 12px 15px;\n"
                + "        }\n"
                + "\n"
                + "        .styled-table tbody tr {\n"
                + "            border-bottom: 1px solid #dddddd;\n"
                + "        }\n"
                + "\n"
                + "        .styled-table tbody tr:nth-of-type(even) {\n"
                + "            background-color: #f3f3f3;\n"
                + "        }\n"
                + "\n"
                + "        .styled-table tbody tr:last-of-type {\n"
                + "            border-bottom: 2px solid #009879;\n"
                + "        }\n"
                + "\n"
                + "        img {\n"
                + "            width: 8%;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <center>\n"
                + "        <h1>Your Order</h1>\n"
                + "        <table class=\"styled-table\">\n"
                + "            <thead>\n"
                + "                <th>Name</th>\n"
                + "                <th>Quantity</th>\n"
                + "                <th>Price</th>\n"
                + "                <th></th>\n"
                + "            </thead>\n"
                + "            <tbody>\n";
        ProductsDAO productDao = new ProductsDAO();
        for (CartItem item : cart.getItems()) {
            cartDetail += "                <tr>\n"
                    + "                    <td><img src=\"" + item.getSource() + "\"\n"
                    + "                            alt=\"\">\n"
                    + "                        " + item.getName() + "</td>\n"
                    + "                    <td>" + item.getQuantity() + "</td>\n"
                    + "                    <td>" + item.getPrice() + "</td>\n"
                    + "                    <td><a href=\"http://localhost:9999/SWP/shopdetail?id=" + item.getProductid() + "&cateid=" + productDao.getProductsbyID(item.getProductid().intValue()).getCategoryid() + "&canFeedback=true\">Feedback</a></td>\n"
                    + "                </tr>\n ";
        }

        cartDetail += "<tr>\n"
                + "                    <td></td>\n"
                + "                    <td>Discount: </td>\n"
                + "                    <td>0</td>\n"
                + "                    <td></td>\n"
                + "                </tr>  \n"
                + "                <tr>\n"
                + "                    <td></td>\n"
                + "                    <td>Shipping charge: </td>\n"
                + "                    <td>0</td>\n"
                + "                    <td></td>\n"
                + "                </tr>  \n"
                + "                <tr>\n"
                + "                    <td></td>\n"
                + "                    <th>Total: </th>\n"
                + "                    <td>"+cart.getTotal()+"</td>\n"
                + "                    <td></td>\n"
                + "                </tr>                \n"
                + "            </tbody>\n"
                + "        </table>\n"
                + "        \n"
                + "    </center>\n"
                + "    <div style=\"margin-left:20%;\">\n"
                + "        <h4>Contact information:</h4>\n"
                + "        <div>Recipiant: "+name+"</div>        \n"
                + "        <div>Phone number: "+phone+"</div>\n"
                + "        <div><Address>Address: "+address+"</Address></div>\n"
                + "    </div>\n"
                + "\n"
                + "\n"
                + "\n"
                + "</body>";
        // compose message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipiant));
            message.setSubject("Your Order");

            String htmlContent = cartDetail;

            message.setContent(htmlContent, "text/HTML");

            // send message
            Transport.send(message);

            System.out.println("Message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
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
