<%-- 
    Document   : test-crud
    Created on : 06/04/2019, 20:54:43
    Author     : Wandes
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TESTE</title>
       <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Hello World!</h1>

        <h2>TESTER CRUD</h2>

        <div>
            <form method="post" action="Servletcontroller">
                <fieldset name="Cadastrando usuário">
                    Nome : <input type="text" name="name" required placeholder="Nome"><br><br>
                    Email : <input type="email" name="email" required placeholder="email" maxlength="40"><br><br>
                    Senha : <input type="password" name="password" required placeholder="password" maxlength="40"><br><br>
                    Celular : <input type="number" name="telephone" required placeholder="celular"><br><br>

                    <input type="radio" name="gender" value="M"> Masculino<br>
                    <input type="radio" name="gender" value="F"> Feminino<br>
                    <input type="radio" name="gender" value="O"> Outros
                </fieldset>
                <br>
                <button type="submit" name="add-user">Cadastrar </button>
            </form>
           <table >
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>Genero</th>
                    </tr>
            <c:forEach var="user" items="${User.getUsers()}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.telephone}</td>
                        <td>${user.sex}</td>
                    </tr>                             
            </c:forEach>
          </table>  
        </div>  


    </body>
</html>
