<%-- 
    Document   : user
    Created on : 02/04/2019, 22:05:12
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.petwebapp.DatabaseConector"%>
<%@page import="com.mycompany.petwebapp.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link rel='stylesheet' type='text/css' href='css\style.css'>
    </head>
   <body style="text-align:center;">
             
       <h1 style="background-color:  #e1e1ea;">Usuarios</h1>
            <h2>"Em desenvolvimento " Cadastrados: </h2> 
            
            <table>                     
                <thead>                         
                    <tr> 
                        <th>Id</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Celular</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr> 
                </thead>
                <tbody>
                    <tr>
                        <% try{   
                         for(User i : User.getUser()){%>
                        <td> <%=i.getId()%></td> 
                        <td> <%=i.getNome()%></td> 
                        <td> <%=i.getEmail()%></td> 
                        <td> <%=i.getCelular()%> </td> 
                        <td><button disabled>Alterar</button></td>  
                        <td><button disabled>Remover</button> </td>  
                        <%}
                        } catch (Exception e) {                   
                        %><h2> ERROR: <%=e%></h2><% } %>
                </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
