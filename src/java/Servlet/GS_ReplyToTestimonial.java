/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.CitizenDAO;
import DAO.GSDAO;
import DAO.LoginDAO;
import DAO.NotifDAO;
import Entity.Activity;
import Entity.Citizen;
import Entity.Employee;
import Entity.Files;
import Entity.Notification;
import Entity.Reply;
import Entity.Testimonial;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RoAnn
 */
public class GS_ReplyToTestimonial extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {

            int id = Integer.parseInt(request.getParameter("testIdR"));
            Employee e = (Employee) session.getAttribute("user");
            ActivityDAO actdao = new ActivityDAO();
            GSDAO gs = new GSDAO();
            Reply r = new Reply();
            r.setMessage(request.getParameter("messageR"));
            r.setSender(e.getUser());
            r.setTestimonial(gs.getTestimonial(id));
            gs.replyToTestimonial(r);

            CitizenDAO ctdao = new CitizenDAO();

            Testimonial t = gs.getTestimonial(id);

            ArrayList<Files> i = ctdao.getFiles(id, t, "Image");
            ArrayList<Files> v = ctdao.getFiles(id, t, "Video");
            ArrayList<Files> d = ctdao.getFiles(id, t, "Document");

            int supporter = ctdao.getnumberofsubscribers(t);

            String location = new Gson().toJson(t.getTlocation());
            session.setAttribute("location", location);

            session.setAttribute("openTestimonial", t);
            session.setAttribute("openImage", i);
            session.setAttribute("openVideo", v);
            session.setAttribute("openDocument", d);
            request.setAttribute("supporters", Integer.toString(supporter));
            t.setStatus("Read");
            gs.changeTestiStatus(t);
            actdao.addActivity(new Activity(0, "Replied to " + t.getTitle(), null, e.getUser()));

            ServletContext context = getServletContext();
            RequestDispatcher dispatch;
            dispatch = context.getRequestDispatcher("/GS_ViewCitizenTestimonialDetails.jsp");
            dispatch.forward(request, response);

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
