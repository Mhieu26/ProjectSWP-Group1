/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.MarketingManager;

import Dao.BlogCategoryDAO;
import Dao.BlogDAO;
import Model.Blog;
import Model.BlogCategory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author tungl
 */
@MultipartConfig
@WebServlet(name = "UpdateBlogServlet", urlPatterns = {"/UpdateBlog"})
public class UpdateBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        List<BlogCategory> blogCategories = blogCategoryDAO.getBlogCategorys();
        BlogDAO blogDAO = new BlogDAO();
        request.setAttribute("blog", blogDAO.getBlogByID(Integer.parseInt(request.getParameter("id"))));
        request.setAttribute("blogcategories", blogCategories);
        request.getRequestDispatcher("./views/blog/UpdateBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = 0;
        String blogId = request.getParameter("blogId");
        try {
            id = Integer.parseInt(blogId);
        } catch (Exception e) {
            response.sendRedirect("settingblogs");
            return;
        }

        BlogDAO bDAO = new BlogDAO();
        Blog blogUpdate = bDAO.getBlogByID(id);
        if (blogUpdate == null) {
            response.sendRedirect("settingblogs");
            return;
        }

        String title = request.getParameter("title");
        String briefinfo = request.getParameter("briefinfo");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String imagePath = null;
        // Handle file upload
        Part filePart = request.getPart("file");
        if (filePart != null && filePart.getSize() > 1) {
            String fileName = getSubmittedFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            imagePath = uploadFile(filePart, fileName, uploadPath);
        }

        int blogcategoryId = Integer.parseInt(request.getParameter("blogcategory"));
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        BlogCategory blogCategory = blogCategoryDAO.getBlogCategoryByID(blogcategoryId);

        // Update a  Blog object
        blogUpdate.setTitle(title);
        blogUpdate.setBriefinfo(briefinfo);
        blogUpdate.setContent(content);
        blogUpdate.setAuthor(author);
        if (imagePath != null) {
            blogUpdate.setImage(imagePath);
        }
        blogUpdate.setPostedDate(LocalDateTime.now());
        blogUpdate.setStatus(Boolean.TRUE);
        blogUpdate.setBlogCategory(blogCategory);

        // Add the new blog to the database
        try {
            bDAO.updateBlog(blogUpdate);
        } catch (Exception e) {
            request.setAttribute("messErrror", e.getMessage());
        }
        // Redirect to the main page or a confirmation page
        request.setAttribute("messSuccess", "Update Successfuly!");
        response.sendRedirect("settingblogs");
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }

    private String uploadFile(Part filePart, String fileName, String uploadPath) {
        try ( InputStream input = filePart.getInputStream()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Extracting file extension
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));

            // Constructing the new filename
            String newFileName = "blog" + fileExtension; // Assuming blogId is available

            // Constructing the new relative filePath
            String relativeFilePath = "images" + File.separator + newFileName;

            // Constructing the full filePath
            String filePath = uploadPath + File.separator + newFileName;

            Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
            return relativeFilePath;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
