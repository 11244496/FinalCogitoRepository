/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CitizenDAO;
import DAO.GSDAO;
import DAO.OCPDDAO;
import Entity.Citizen;
import Entity.Files;
import Entity.Location;
import Entity.Project;
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
@WebServlet(name = "Citizen_ViewProjectDetails", urlPatterns = {"/Citizen_ViewProjectDetails"})
public class Citizen_ViewProjectDetails extends HttpServlet {

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
            OCPDDAO dao = new OCPDDAO();
            GSDAO gsdao = new GSDAO();
            CitizenDAO ct = new CitizenDAO();
            String id = request.getParameter("projid");

            Project p = dao.getAllProjectDetails(id);
            ArrayList<Location> projectLocation = p.getLocation();
            String location = new Gson().toJson(projectLocation);
            session.setAttribute("location", location);

            ArrayList<Testimonial> tList = new ArrayList<>();
            ArrayList<Files> fList;
            ArrayList<Integer> idList = new ArrayList<>();
            Testimonial t;

            for (Files f : p.getFiles()) {
                if (f.getTestimonial().getId() != 0) {
                    if (!idList.contains(f.getTestimonial().getId())) {
                        idList.add(f.getTestimonial().getId());
                    }
                }
            }
            for (int x : idList) {
                t = dao.getTestimonial(x);
                tList.add(t);
            }
            for (Testimonial tm : tList) {
                fList = new ArrayList<>();
                for (Files f : p.getFiles()) {
                    if (tm.getId() == f.getTestimonial().getId()) {
                        fList.add(f);
                    }
                }
                tm.setFiles(fList);
            }

            Citizen c = (Citizen) session.getAttribute("user");
            session.setAttribute("project", p);
            double percent = dao.getPercentage(p);
            
            //Set new arraylist of proposal files
            //ArrayList<Files> projectFiles = gsdao.getprojectfiles(p);
            //session.setAttribute("pFiles", projectFiles);
            session.setAttribute("feedback", ct.getAverage(p));
           
            session.setAttribute("percentage", percent);
            session.setAttribute("testimonials", tList);
            //session.setAttribute("isFollowing", ct.isFollowing(p, c));
            ServletContext context = getServletContext();
            RequestDispatcher dispatch = null;
            if (p.getStatus().equalsIgnoreCase("Finished")) {
                dispatch = context.getRequestDispatcher("/Citizen_ViewProjectDetails.jsp");
            } else {
               dispatch = context.getRequestDispatcher("/Citizen_ViewProjectDetailsN.jsp");
            }
            
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
