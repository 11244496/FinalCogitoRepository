/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ContractorDAO;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Contractor_User;
import Entity.Employee;
import Entity.Project;
import Entity.Timeline_Update;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "GS_TimelineUpdate", urlPatterns = {"/GS_TimelineUpdate"})
public class GS_TimelineUpdate extends HttpServlet {

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
            GSDAO gsDAO = new GSDAO();
            OCPDDAO oc = new OCPDDAO();
            //ContractorDAO contDAO = new ContractorDAO();
            String projectID = request.getParameter("projectID");
            Project project = oc.getBasicProjectDetails(projectID);
            String message = request.getParameter("contractormessage");
            //Contractor_User conuser = (Contractor_User) session.getAttribute("user");
            Employee emp = (Employee) session.getAttribute("user");
            User user = gsDAO.getUser(emp);
            
            
            
            Timeline_Update tUpdate = new Timeline_Update(0, message, project, user);
            
            //Add the entry
            gsDAO.submitTimelineUpdate(tUpdate);
            
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_Home");
            dispatch.forward(request, response);
            
            
        }finally{
        
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
