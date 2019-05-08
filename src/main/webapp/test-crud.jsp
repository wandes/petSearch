<%-- 
    Document   : test-crud
    Created on : 06/04/2019, 20:54:43
    Author     : Wandes
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TESTE</title>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body> 
   
        <%if (request.getParameter("register") != null) {
                    try { User.insertUser(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
                                Integer.parseInt(request.getParameter("telephone")), request.getParameter("gender"));  
            response.sendRedirect("test-crud.jsp");
            } catch (Exception ex) {
             System.out.println(ex.getMessage());
          } } %>
          
        <%if (request.getParameter("update") != null) {
       
                    try { User.updateUser(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
                                Integer.parseInt(request.getParameter("telephone")), Integer.parseInt(request.getParameter("id")));    
               response.sendRedirect("test-crud.jsp");
            } catch (Exception ex) {
             System.out.println(ex.getMessage()); } } %> 
             
             
        <h1>TESTE DE CRUD</h1>
        <div>
            
            <h1>CADASTRO</h1>
            <form method="post" action="test-crud.jsp">
                <fieldset name="Cadastrando usuário">
                    Nome : <input type="text" name="name" required placeholder="Nome"><br><br>
                    Email : <input type="email" name="email" required placeholder="email" maxlength="30"><br><br>
                    Senha : <input type="password" name="password" required placeholder="password" maxlength="30"><br><br>
                    Celular : <input type="number" name="telephone" required placeholder="celular" maxlength="12"><br><br>

                    <input type="radio" name="gender" value="M"> Masculino<br>
                    <input type="radio" name="gender" value="F"> Feminino<br>
                    <input type="radio" name="gender" value="O"> Outros
                </fieldset>
                <br>
                <button type="submit" name="register">Cadastrar </button>
            </form>                             
       
            
            <%
            String msg = "";
            Animal animal = Animal.getAnimal(1);    
            if(animal == null){
            msg = Animal.getMsgConnection();
            }else{%>
            <p><%=animal.getNameAnimal()%></p>
            <%}%>
            
            <p><%=msg%></p>
           
            
        </div>  
    </body>
</html>
