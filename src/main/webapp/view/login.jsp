<%-- 
    Document   : login
    Created on : 14/04/2019, 18:29:51
    Author     : thiag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>Login</title>
        
    </head>
    
    <body>
        <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white">
            <div class="container">
                <a class="navbar-brand text-warning" href="../view/home.jsp">LOGO</a>
                <form>
                    <div class="row text-left">
                            <label for="email" class="text-warning">E-mail</label>
                            <div class="col-sm input-group small mb-2">
                                <input type="text" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1">
                            </div>

                            <label for="senha" class="text-warning">Senha</label>
                            <div class="col-sm input-group small mb-2">    
                                <input type="password" class="form-control" id="senha"  aria-label="Username" aria-describedby="basic-addon1">
                            </div>
                            <button type="button" class="col-sm btn btn-sm btn-outline-warning ">Entrar</button
                    </div>
                </form>
            </div>
</nav><!--header-->
         
        
        <nav class="navbar navbar-default">
            <div class="container">
                <!--navbar-->
                <div class="row" >
                    <img class="img-responsive col-sm-6 pull-right " src="https://pngimage.net/wp-content/uploads/2018/05/cachorros-em-png-3.png">
                    <div class="col-sm-6 ">
                        <span class=" h3 text-warning text-center">Cadastre-se !</span>
                        <form>
                            <div class="form-group-sm mb-3">
                                <label for="emailCadastro" class="text-warning">E-mail</label>
                                <input type="text" class="form-control" id="emailCadastro" placeholder="Ex:Fulano@gmail.com" />
                                
                                <label for="senhacadastro" class=" text-warning">Senha</label>
                                <input type="password" class="form-control"  id="senhaCadastro">  
                                
                                <label for="confirmacadastro" class="text-warning">Confirme</label>
                                <input type="text" class="form-control"  id="confirmaCadastro"/>
                            </div>
                        </form>
                    </div>
                    
            
        
                </div> 
            </div><!-- /container -->
        </nav><!-- /nav -->
        
        
       
        <%@include file="../WEB-INF/jspf/bootstrapBody.jspf"%>
    </body>
</html>
