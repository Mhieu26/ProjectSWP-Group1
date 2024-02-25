/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.BlogManager;

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
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.List;

@MultipartConfig
@WebServlet(name = "CreateBlogServlet", urlPatterns = {"/CreateBlog"})
public class CreateBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        List<BlogCategory> blogCategories = blogCategoryDAO.getBlogCategorys();
        String search = request.getParameter("search");
        String blogcategoryID = request.getParameter("blogcategoryID");
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> blogs = blogDAO.getBlogs(search, blogcategoryID);
        request.setAttribute("blogs", blogs);
        request.setAttribute("blogcategories", blogCategories);
        request.setAttribute("blogcategoryID", blogcategoryID);
        request.getRequestDispatcher("./views/blog/AddBlog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String briefinfo = request.getParameter("briefinfo");
        String content = request.getParameter("content");
        String author = request.getParameter("author");

        // Handle file upload
        Part filePart = request.getPart("file");
        String fileName = getSubmittedFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        String imagePath = uploadFile(filePart, fileName, uploadPath);

        int blogcategoryId = Integer.parseInt(request.getParameter("blogcategory"));
        BlogCategoryDAO blogCategoryDAO = new BlogCategoryDAO();
        BlogCategory blogCategory = blogCategoryDAO.getBlogCategoryByID(blogcategoryId);

        // Create a new Blog object
        Blog newBlog = new Blog();
        newBlog.setTitle(title);
        newBlog.setBriefinfo(briefinfo);
        newBlog.setContent(content);
        newBlog.setAuthor(author);
        newBlog.setImage(imagePath);
        newBlog.setPostedDate(LocalDateTime.now());
        newBlog.setStatus(Boolean.TRUE);
        newBlog.setBlogCategory(blogCategory);

        // Add the new blog to the database
        BlogDAO bDAO = new BlogDAO();
        try {
            bDAO.addBlog(newBlog);
            request.setAttribute("messSuccess", "Add Blog Successfuly!");
        } catch (Exception e) {
            request.setAttribute("messErrror", e.getMessage());
        }
        // Redirect to the main page or a confirmation page
        request.getRequestDispatcher("./views/blog/AddBlog.jsp").forward(request, response);
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
