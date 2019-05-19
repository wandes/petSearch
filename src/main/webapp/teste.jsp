<%-- 
    Document   : teste
    Created on : 18/05/2019, 22:14:44
    Author     : Wandes
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
           <% String msg = "";
                   try {
                       
                   for(Animal a : Animal.getAnimais(1)){;
               %>
                    <p>Nome: <%=a.getNameAnimal()%></p>
                       
              <%}%>
             <%
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
       %>  
       <p><%=msg%></p>
          

    
                   
                    
     
             
                
    </body>
</html>
