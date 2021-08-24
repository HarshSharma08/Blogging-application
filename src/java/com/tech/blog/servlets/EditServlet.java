/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author harsh
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //fetch all data
            String userEmail=request.getParameter("user_email");
            String userName=request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            //add user deatils in session
            
            HttpSession u=request.getSession(true);
            user User=(user)u.getAttribute("currentuser");
            User.setName(userName);
            User.setEmail(userEmail);
            User.setPassword(userPassword);
            String oldFile=User.getProfile();
            User.setProfile(imageName);
            System.out.println("User Email "+User.getEmail());
            System.out.println("User Name "+User.getEmail());
         
            // now adding into database using user object            
            userDao dao=new userDao(ConnectionProvider.getConnection());
            boolean a=dao.updateUser(User);
            if(a==true)
            {
                out.println(User.getName());
                out.println("Profile updated successfully");
                String path=request.getRealPath("/")+"pic"+File.separator+User.getProfile();
                String pathOldFile=request.getRealPath("/")+"pic"+File.separator+oldFile;                
                
                    if(!oldFile.equals("default.png"))
                    {
                    Helper.deleteFile(pathOldFile);
                    }
                    if(Helper.saveFile(part.getInputStream(), path))
                    {
                         Message msg=new Message("Profile is updated sucessfully","success","alert-success");
                         u.setAttribute("message",msg);
                    }
                   else
                    {
                       out.println("not updated");
                       Message msg=new Message("Profile is not updated ","error","alert-danger");
                       u.setAttribute("message",msg);
                    }
            }
            else
            {
                out.println("Update failure");
                Message msg=new Message("Profile is not updated ","error","alert-danger");
                u.setAttribute("message",msg);
            }
            response.sendRedirect("profile.jsp");
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
        processRequest(request, response);
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
