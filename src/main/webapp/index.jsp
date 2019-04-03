<%-- 
    Document   : index
    Created on : 11/03/2019, 22:56:11
    Author     : Wandes
--%>
<%@page import="com.mycompany.petwebapp.DatabaseConector"%>
<%@page import="com.mycompany.petwebapp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel='stylesheet' type='text/css' href='css\style.css'>
        <title>Pet Search</title>
        
        <style>
            
            
        </style>
    </head>
    <body>
	<div align="center">
                    <h1>Pet Search</h1>
 	
                    <h2>USUÁRIO CADASTRADO NO SISTEMA: </h2> 
                    <br>
                    <table>                     
                        <thead>                         
                            <tr> 
                          <th>Id</th>
                         <th>Nome</th>
                          <th>Email</th>
                           <th>Celular</th>
                            </tr>                      
                        </thead>
                        
                        <tbody>
                            <tr>
                    <%
                     try{   
                     for(User i : User.getUser()){%>
                    <td> <%=i.getId()%></td> 
                    <td> <%=i.getNome()%></td> 
                    <td> <%=i.getEmail()%></td> 
                    <td> <%=i.getCelular()%> </td>               
                     <%}
                 } catch (Exception e) {  //Driver não encontrado
                    
                    %><h2> ERROR: <%=e%></h2><%
                      } 
    
                     %>
                      </tr>
                     </tbody>
                 </table>
	</div>
    </body>
</html>
