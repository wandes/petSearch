<%-- 
    Document   : index
    Created on : 11/03/2019, 22:56:11
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <title>Pet Search</title>
        
    </head>
    
    <body>
         
        <nav class="navbar navbar-default">
            <div class="container">
                <!--header-->
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">
                        LOGO
                    </a>
                </div>
                <!--navbar-->
                <div class="">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Notificações</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Minha Conta</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Perfil</a></li>
                                <li><a href="#">Sair</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                
            </div><!-- /container -->
        </nav><!-- /nav -->
        
        <div class="container">
            <img class="img-responsive" src="https://pngimage.net/wp-content/uploads/2018/05/cachorros-em-png-3.png">
        </div>
       
        <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
    </body>
</html>
