/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.CartDAO;
import Model.Cart;
import Model.CartItem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.lang.reflect.Type;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.HmacAlgorithms;
import org.apache.commons.codec.digest.HmacUtils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ConfirmCheckoutController", urlPatterns = {"/confirmcheckout"})
public class ConfirmCheckoutController extends HttpServlet {

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
            out.println("<title>Servlet ConfirmCheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmCheckoutController at " + request.getContextPath() + "</h1>");
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

        // URL của API mà bạn muốn gửi POST request đến
        String endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";

        // Thông tin cần thiết
        String partnerCode = "MOMOBKUN20180529";
        String accessKey = "klm05TvNBzhg7h7j";
        String secretKey = "at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa";
        String orderInfo = "ThanhtoánquaMoMo";
        long amount = 1000000;
        String orderId = String.valueOf(System.currentTimeMillis()) + ":0123456778";
        String redirectUrl = "http://localhost:9999/SWP/thanks";
        String ipnUrl = "http://localhost:9999/SWP/thanks";
        String extraData = "";

        // Tạo requestId và requestType
        String requestId = String.valueOf(System.currentTimeMillis()) + "id";
        String requestType = "payWithATM";

        // Tạo chuỗi rawHash
        String rawHash = "accessKey=" + accessKey + "&amount=" + amount + "&extraData=" + extraData + "&ipnUrl="
                + ipnUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&partnerCode=" + partnerCode
                + "&redirectUrl=" + redirectUrl + "&requestId=" + requestId + "&requestType=" + requestType;
        System.out.println(rawHash);
        // Tạo chữ ký signature
        String signature = null;
        try {
            signature = generateHMAC(rawHash, secretKey);
        } catch (Exception ex) {
            Logger.getLogger(ConfirmCheckoutController.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Tạo map chứa dữ liệu cần gửi đi
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("partnerCode", partnerCode);
        dataMap.put("partnerName", "Test");
        dataMap.put("storeId", "MomoTestStore");
        dataMap.put("requestId", requestId);
        dataMap.put("amount", amount);
        dataMap.put("orderId", orderId);
        dataMap.put("orderInfo", orderInfo);
        dataMap.put("redirectUrl", redirectUrl);
        dataMap.put("ipnUrl", ipnUrl);
        dataMap.put("lang", "vi");
        dataMap.put("extraData", extraData);
        dataMap.put("requestType", requestType);
        dataMap.put("signature", signature);

        // Gửi POST request
        Gson gson = new Gson();
        Type mapType = new TypeToken<Map<String, Object>>() {
        }.getType();

        System.out.println("dataMap: " + gson.toJson(dataMap));
        String result = "";
        try {
            result = execPostRequest(endpoint, gson.toJson(dataMap));
        } catch (IOException e) {
            System.out.println(e);
        }
        Map<String, Object> jsonResult = gson.fromJson(result, mapType);
        System.out.println(jsonResult.toString());
        System.out.println((String) jsonResult.get("payUrl"));

        // Xử lý kết quả theo nhu cầu của bạn
        response.sendRedirect((String) jsonResult.get("payUrl"));
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
        //Kiem tra xem co du hang trong kho khong
        //param cartid
        //lay cartid query items list cua khach hang sau do query lay so inventory roi so sanh va tra ve ket qua
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        Long cartid = Long.parseLong(request.getParameter("cartid"));

        String notification = "";//notice user to change cart

        HttpSession session = request.getSession();
        session.setAttribute("recipientName", name);
        session.setAttribute("recipientAddr", address);
        session.setAttribute("recipientPhone", phone);
        
        CartDAO cartDao = new CartDAO();
        Cart cart = cartDao.getCartByUserID(((User) session.getAttribute("User")).getId());
        boolean isValidOrder = true;
        for (CartItem item : cart.getItems()) {
            int storage = cartDao.getInventoryById(item.getProductid());
            System.out.println("storage: " + storage);
            System.out.println("quantity: " + item.getQuantity());
            if (item.getQuantity() > storage) {
                notification += "Our store has only " + storage + " " + item.getName() + " left!\n";
                isValidOrder = false;
            }
        }

        //xu li don hang hop le
        if (isValidOrder) {

            // URL của API mà bạn muốn gửi POST request đến
            String endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";

            // Thông tin cần thiết
            String partnerCode = "MOMOBKUN20180529";
            String accessKey = "klm05TvNBzhg7h7j";
            String secretKey = "at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa";
            String orderInfo = "ThanhtoánquaMoMo";
            long amount = (long)Double.parseDouble(request.getParameter("amount"));
            System.out.println("amount = "+amount);
            String orderId = String.valueOf(System.currentTimeMillis());
            String redirectUrl = "http://localhost:9999/SWP/thanks";
            String ipnUrl = "http://localhost:9999/SWP/thanks";
            String extraData = "";

            // Tạo requestId và requestType
            String requestId = String.valueOf(System.currentTimeMillis());
            String requestType = "captureWallet";

            // Tạo chuỗi rawHash
            String rawHash = "accessKey=" + accessKey + "&amount=" + amount + "&extraData=" + extraData + "&ipnUrl="
                    + ipnUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&partnerCode=" + partnerCode
                    + "&redirectUrl=" + redirectUrl + "&requestId=" + requestId + "&requestType=" + requestType;
            System.out.println("rawhash= "+rawHash);
            // Tạo chữ ký signature
            String signature = null;
            try {
                signature = generateHMAC(rawHash, secretKey);
            } catch (Exception ex) {
                Logger.getLogger(ConfirmCheckoutController.class.getName()).log(Level.SEVERE, null, ex);
            }

            // Tạo map chứa dữ liệu cần gửi đi
            Map<String, Object> dataMap = new HashMap<>();
            dataMap.put("partnerCode", partnerCode);
            dataMap.put("partnerName", "Test");
            dataMap.put("storeId", "MomoTestStore");
            dataMap.put("requestId", requestId);
            dataMap.put("amount", amount);
            dataMap.put("orderId", orderId);
            dataMap.put("orderInfo", orderInfo);
            dataMap.put("redirectUrl", redirectUrl);
            dataMap.put("ipnUrl", ipnUrl);
            dataMap.put("lang", "vi");
            dataMap.put("extraData", extraData);
            dataMap.put("requestType", requestType);
            dataMap.put("signature", signature);

            // Gửi POST request
            Gson gson = new Gson();
            Type mapType = new TypeToken<Map<String, Object>>() {
            }.getType();

            System.out.println("dataMap: " + gson.toJson(dataMap));
            String result = "";
            try {
                result = execPostRequest(endpoint, gson.toJson(dataMap));
            } catch (IOException e) {
                System.out.println(e);
            }
            Map<String, Object> jsonResult = gson.fromJson(result, mapType);
            System.out.println(jsonResult.toString());
            System.out.println((String) jsonResult.get("payUrl"));

            //co the thanh toan 
            if ((double)jsonResult.get("resultCode") == 0) {
                java.util.Date utilDate = new java.util.Date();
                cartDao.insertOrder(Long.parseLong(orderId),new java.sql.Date(utilDate.getTime()), cart.getTotal(), "unpaid", ((User) session.getAttribute("User")).getId());

                for (CartItem item : cart.getItems()) {                    
                    cartDao.insertOrderLine(item.getQuantity(), item.getPrice(), Long.parseLong(orderId), cartDao.getSaleId(), item.getProductid(), new java.sql.Date(utilDate.getTime()), "unpaid");
                    System.out.println("Item productid: "+item.getProductid());
                }


                // Xử lý kết quả theo nhu cầu của bạn
                response.getWriter().write((String) jsonResult.get("payUrl"));
            }

        //xu li don hang ko hop le (vuot qua so luong trong kho)
        }else{
            response.getWriter().write(notification);
        }

    }

    private String execPostRequest(String url, String data) throws IOException {
        System.out.println("Du lieu dau vao cua method execPostRequest: ");
        System.out.println(url);
        System.out.println(data);
        data = data.trim();
        String responseJson;

        try {
            // Địa chỉ URL của endpoint bạn muốn gửi yêu cầu đến
            URL urlMomo = new URL("https://test-payment.momo.vn/v2/gateway/api/create");

            // Mở kết nối HTTP
            HttpURLConnection connection = (HttpURLConnection) urlMomo.openConnection();

            // Thiết lập phương thức yêu cầu là POST
            connection.setRequestMethod("POST");

            // Cho phép gửi dữ liệu đến server
            connection.setDoOutput(true);

            // Thiết lập header
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Host", "test-payment.momo.vn");

            // Dữ liệu bạn muốn gửi (ví dụ: JSON)
            String jsonData = data;

            // Chuyển đổi dữ liệu thành byte và gửi đến server
            try ( OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonData.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // Đọc phản hồi từ server (nếu cần)
            int responseCode = connection.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try ( BufferedReader br = new BufferedReader(
                        new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                    String line;
                    StringBuilder response = new StringBuilder();
                    while ((line = br.readLine()) != null) {
                        response.append(line);
                    }
                    System.out.println("Response Content: " + response.toString());
                    return response.toString();
                }
            } else {
                System.out.println("Failed to get the response. Response Code: " + responseCode);
            }

            // Đóng kết nối
            connection.disconnect();
        } catch (IOException e) {
            System.out.println(e);
        }
        return null;
    }

    public static String generateHMAC(String data, String secret) {
        byte[] key = secret.getBytes();

        HmacUtils hm256 = new HmacUtils(HmacAlgorithms.HMAC_SHA_256, key);
        //hm256 object can be used again and again
        String hmac = hm256.hmacHex(data);

        return hmac;
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
