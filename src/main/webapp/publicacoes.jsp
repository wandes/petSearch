<%-- 
    Document   : perfil
    Created on : 02/04/2019, 22:05:12
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>Usuarios</title>
    </head>
   <body style="text-align:center;">
        <%@include file="../WEB-INF/jspf/header.jspf"%>
         <%User user = (User)session.getAttribute("session_user");%>
        
        <%if(user == null) {
            response.sendRedirect("login.jsp");             
              }%> 
                                  
       <%if (request.getParameter("updateUser") != null) {
            
                    try { User.updateUser(request.getParameter("nameUp"), request.getParameter("emailUp"), request.getParameter("passwordUp"),
                             Integer.parseInt(request.getParameter("telephoneUp")), Integer.parseInt(request.getParameter("idUp")));  
               user = User.getUser(request.getParameter("emailUp"), request.getParameter("passwordUp"));
               session.setAttribute("session_user", user);
               response.sendRedirect("home.jsp");
            } catch (Exception ex) {
             System.out.println(ex.getMessage()); } } %>
        
            
        
        <main class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container border"><!-- Sidebar -->
                            <div class="row">
                                <a class="btn btn-block btn-outline-warning text-left m-0" href="perfil.jsp">
                                  Perfil
                                </a>
                                <a class="btn btn-block btn-outline-warning text-left m-0" href="publicacoes.jsp">
                                  Publicações
                                </a>
                                <a class="btn btn-block btn-outline-warning text-left m-0" href="conta.jsp">
                                  Conta
                                </a>
                                <a class="btn btn-block btn-outline-warning text-left m-0" href="ajuda.jsp">
                                  Ajuda
                                </a>
                            </div>    
                        </div>
                    </div>
                    <div class="col-sm-8 ">
                        <div class="container border pb-3"><!-- Principal -->
<!-- ABA DO PERFIL ------------------------------------------------------------>
                            
                                
                            <%@include file="../WEB-INF/jspf/conteudoPublicacoes.jspf"%>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!--
        <h1 style="background-color:  #e1e1ea;">Usuarios</h1>
        <h2>"Em desenvolvimento " Cadastrados: </h2> 
        -->  
        
        <%@include file="../WEB-INF/jspf/bootstrapBody.jspf"%>
    </body>
</html>
