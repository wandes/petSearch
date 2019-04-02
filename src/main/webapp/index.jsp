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
            <link rel="stylesheet" type="text/css" href="">
    <link rel="stylesheet" type="text/css" href="">
        <title>Pet Search</title>
    </head>
    <body>
	<div align="center">
                    <h1>Pet Search</h1>
                    <h2 style="color: red;" align="center">EM DESENVOLVIMENTO!!</h2>	
                    <h3><%= (DatabaseConector.conection())%></h3>
                    <img src="https://mercado.etc.br/wp-content/uploads/2018/04/sinais-que-nos-indicam-se-um-cachorro-e-feliz.jpg">
                    <%User user = new User();
                   
                    for (String i: user.getUsers) {%>
                    
                   <h4><%=i%></h4>
                   
                   <%}%>
                    
	</div>
    </body>
</html>
