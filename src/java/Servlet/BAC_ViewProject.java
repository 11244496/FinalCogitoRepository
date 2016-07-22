/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.BACDAO;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Files;
import Entity.Location;
import Entity.Project;
import Entity.Schedule;
import Entity.Task;
import Entity.Testimonial;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Krist
 */
@WebServlet(name = "BAC_ViewProject", urlPatterns = {"/BAC_ViewProject"})
public class BAC_ViewProject extends HttpServlet {

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
        try {
            GSDAO gdao = new GSDAO();
            OCPDDAO oc = new OCPDDAO();
            BACDAO bac = new BACDAO();
            
            
            String id = request.getParameter("projectID");

            Project project = oc.getAllProjectDetails(id);
            ArrayList<Location> projectLocation = project.getLocation();
            String location = new Gson().toJson(projectLocation);
            session.setAttribute("location", location);
            session.setAttribute("cost", oc.getCost(project));

            Testimonial mainTesti = gdao.getTestimonial(project.getMainTestimonial().getId());
            project.setMainTestimonial(mainTesti);
            
            //References
            ArrayList<Project> referencedPList = new ArrayList<Project>();
            for(int x = 0; x < project.getReferredProjects().size();x++){
                Project p = oc.getAllProjectDetails(project.getReferredProjects().get(x).getId());
                referencedPList.add(p);
            }
            project.setReferredProjects(referencedPList);
            
            //Set new arraylist of proposal files
            ArrayList<Files> projectFiles = project.getFiles();
            session.setAttribute("pFiles", projectFiles);
            request.setAttribute("hasItb", bac.hasITB(project));
            session.setAttribute("project", project);
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/BAC_ViewProject.jsp");
            dispatch.forward(request, response);

        } finally {
            out.close();
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
