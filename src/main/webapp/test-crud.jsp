<%-- 
    Document   : test-crud
    Created on : 06/04/2019, 20:54:43
    Author     : Wandes
--%>

<%@page import="java.util.List"%>
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

        <h2>TESTER CRUD</h2>



        <div>

             <form method="POST" action="/ControllerServlet">
                <fieldset name="Cadastrando usuário">
                    Nome : <input type="text" name="name" required placeholder="Nome"><br><br>
                    Email : <input type="email" name="email" required placeholder="email"><br><br>
                    Senha : <input type="text" name="password" required placeholder="password"><br><br>
                    Celular : <input type="number" name="telephone" required placeholder="celular"><br><br>
                     
                   <input type="radio" name="gender" value="male"> Masculino<br>
                  <input type="radio" name="gender" value="female"> Feminino<br>
                   <input type="radio" name="gender" value="other"> Outros
                </fieldset>
                <br>
                
              
                <button type="submit" value="add-user">Cadastrar </button>

            </form>

        </div>  


    </body>
</html>
