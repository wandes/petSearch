<%-- 
    Document   : home
    Created on : 06/04/2019, 22:49:14
    Author     : Leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        
        <main class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container border"><!-- Sidebar -->
                            
                        </div>
                    </div>
                    
                    <div class="col-sm-8">
                        <div class="container border p-2"><!-- Principal -->
                            <div class="row">
                                <div class="col-sm-2">
                                    <img src="../img/testePerfil.jpg" class="rounded-circle img-fluid img-thumbnail">
                                </div>
                                <div class="col-sm-2 p-0">
                                    <p class="float-xl-right pt-xl-3">Nome Sobrenome</p>
                                </div>
                                <div class="col-sm-3">
                                    
                                </div>
                                <div class="col-sm-2">
                                    
                                </div>
                                <div class="col-sm-3">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <%@include file="../WEB-INF/jspf/bootstrapBody.jspf"%>
    </body>
</html>
