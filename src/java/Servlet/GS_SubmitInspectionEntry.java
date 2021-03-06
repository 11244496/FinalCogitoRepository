/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.ActivityDAO;
import DAO.GSDAO;
import Entity.Activity;
import Entity.Employee;
import Entity.Project_has_Pwork;
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
@WebServlet(name = "GS_SubmitInspectionEntry", urlPatterns = {"/GS_SubmitInspectionEntry"})
public class GS_SubmitInspectionEntry extends HttpServlet {

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
            ActivityDAO actdao = new ActivityDAO();
            String projectId = request.getParameter("projectID");
            Employee e = (Employee) session.getAttribute("user");
            String list = request.getParameter("listSize");
            String[] listSize = list.split(",");

            for (int x = 0; x < listSize.length; x++) {

                int taskID = Integer.parseInt(listSize[x]);
                String remark = request.getParameter("input-" + x);

                //insert method
                gsDAO.addInspection_Report(remark, taskID);

            }

            String[] taskIds = request.getParameterValues("checkboxinput");

            if (taskIds != null) {
                for (int i = 0; i < taskIds.length; i++) {

                    int idd = Integer.parseInt(taskIds[i]);

                    //Set the schedule table
                    gsDAO.finishTask(idd);

                }

            }

            //Refresh the projects
            gsDAO.finishProjects();
            actdao.addActivity(new Activity(0, "Submitted inspection", null, e.getUser()));
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = context.getRequestDispatcher("/GS_Home");
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
