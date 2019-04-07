/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.petsearch.mvc.controller;

import br.com.petsearch.mvc.dao.DatabaseConnector;
import br.com.petsearch.mvc.dao.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wandes
 */
public class ControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 

        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            
            String acao = request.getParameter("logica");
            DatabaseConnector  dao = new DatabaseConnector();

            if (acao.equals("AdicionaContato")) {
        
            
            User user = new User();  
            
            try {
                user.insertUser(request.getParameter("name"),request.getParameter("email"),request.getParameter("password"),
                        Integer.parseInt(request.getParameter("telephone")),request.getParameter("gender"));
               RequestDispatcher rd =
               request.getRequestDispatcher("/add-user.jsp");
               rd.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }             
        }
        }

}

