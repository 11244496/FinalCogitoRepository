/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.CitizenDAO;
import Entity.Activity;
import Entity.Citizen;
import Entity.Feedback;
import Entity.Project;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Citizen_SubmitFeedback extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            CitizenDAO ct = new CitizenDAO();
            Feedback f = null;
            int quality = Integer.parseInt(request.getParameter("quality"));
            int promptness = Integer.parseInt(request.getParameter("promptness"));
            int convenience = Integer.parseInt(request.getParameter("convenience"));
            int safety = Integer.parseInt(request.getParameter("safety"));
            int details = Integer.parseInt(request.getParameter("details"));
            int details2 = Integer.parseInt(request.getParameter("details2"));
            int satisfaction = Integer.parseInt(request.getParameter("satisfaction"));
            String comment = request.getParameter("comments");
            Project p = new Project();
            p.setId(request.getParameter("projId"));
            Citizen c = (Citizen) session.getAttribute("user");
            f = new Feedback(quality, promptness, convenience, safety, details, details2, satisfaction, comment, p, c, null);
            ct.sendFeedback(f);

            ActivityDAO actdao = new ActivityDAO();
            actdao.addActivity(new Activity(0, "you submitted a feedback form on project: " + p.getName(), null, c.getUser()));

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Citizen_ViewProjectDetails?projid=" + p.getId());
            rd.forward(request, response);

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
