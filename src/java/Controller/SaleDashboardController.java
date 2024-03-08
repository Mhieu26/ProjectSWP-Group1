/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
     */
    package Controller;

    import Dao.OrderLineDAO;
    import Dao.UserDAO;
    import Model.OrderLine;
    import Model.User;
    import java.io.IOException;
    import java.io.PrintWriter;

    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;
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

            UserDAO users = new UserDAO();  
            ArrayList<User> saleList = users.getUsersByRoleID(3);
            ArrayList<String> saleName = new ArrayList<>();
            for (User u : saleList) {
                saleName.add(u.getName());
            }
            request.getSession().setAttribute("saleName", saleName);
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
//            String name = request.getParameter("selectedSale");
//            //response.getWriter().print(name);
//            OrderLineDAO orderdao = new OrderLineDAO();
//            UserDAO udao = new UserDAO();
//            ArrayList<OrderLine> orderlines = new ArrayList<OrderLine>();
//            if (name.equals("all")) {
//                orderlines = orderdao.getOrderLinesIn7Day();
//            } else {
//                User user = new User();
//                user = udao.getUserByName(name);
//                orderlines = orderdao.getOrderLinesBySaleIDIn7Day(user.getId());
//            }
//            request.setAttribute("select", name);
//            request.setAttribute("orderlines", orderlines);
//            //  response.getWriter().print(orderlines.get(0).getPrice());
//            request.getRequestDispatcher("saledashboard.jsp").forward(request, response);
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
