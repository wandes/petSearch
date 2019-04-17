<%-- 
    Document   : index.jsp
    Created on : 16/04/2019, 22:43:34
    Author     : Wandes
--%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>

        <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white">
            <div class="container">
                <a class="navbar-brand text-warning" href="../view/home.jsp">LOGO</a>

                <form method="post" action="index.jsp">
                    <div class="row text-left">
                        <label for="email" class="text-warning">E-mail</label>
                        <div class="col-sm input-group small mb-2">
                            <input type="text" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1" name="email">
                        </div>

                        <label for="senha" class="text-warning">Senha</label>
                        <div class="col-sm input-group small mb-2">    
                            <input type="password" class="form-control" id="senha"  aria-label="Username" aria-describedby="basic-addon1" name="password">
                        </div>
                        <button type="submit" name="login" class="col-sm btn btn-sm btn-outline-warning " >Entrar</button>
                    </div>
                </form>
            </div>
        </nav><!--header-->

        <%
            String msg = "";
           
            if (request.getParameter("login") != null) {

                String email = request.getParameter("email");
                String pass = request.getParameter("password");

                User user = User.getUser(email, pass);

                if (user == null) {
                msg = "Usuário ou senha Inválido!";
                } else {
                    session.setAttribute("session_user", user);
                    response.sendRedirect("home.jsp");

                }
            }%>
            <p style="color:red; text-align: center;"><%=msg%></p>




        <nav class="navbar navbar-default">
            <div class="container">
                <!--navbar-->
                <div class="row" >
                    <img class="img-responsive col-sm-6 pull-right " src="https://pngimage.net/wp-content/uploads/2018/05/cachorros-em-png-3.png">
                    <div class="col-sm-6 ">
                        <div class="row text-right">
                            <span class=" h3 text-warning">Cadastre-se !</span>
                        </div>
                        <form>
                            <div class="row text-left">
                                <label for="email" class="text-warning">E-mail</label>
                                <div class=" input-group small mb-2">
                                    <input type="text" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1" >
                                </div>

                                <label for="senha" class="text-warning">Senha</label>
                                <div class="col-sm input-group small mb-2">    
                                    <input type="password" class="form-control" id="senha"  aria-label="Username" aria-describedby="basic-addon1">
                                </div>

                                <label for="confirmaSenha" class="text-warning">Confirme</label>
                                <div class="col-sm input-group small mb-2">    
                                    <input type="password" class="form-control" id="confirmaSenha"  aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <label for="confirmaSenha" class="text-warning">Endereço</label>
                            <div class="row text-left">
                                <div class="col-sm input-group small mb-2">    
                                    <input type="text" class="form-control" id="Pais"  aria-label="Username" placeholder="País" aria-describedby="basic-addon1">
                                </div>
                                <div class="col-sm input-group small mb-2">    
                                    <input type="text" class="form-control" id="Estado"  aria-label="Username" placeholder="Estado" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="row text-left">
                                <div class="col-sm input-group small mb-2">    
                                    <input type="text" class="form-control" id="Cidade"  aria-label="Username" placeholder="Cidade" aria-describedby="basic-addon1">
                                </div>
                                <div class="col-sm input-group small mb-2">
                                    <input type="text" class="form-control" id="Bairro"  aria-label="Username" placeholder="Bairro" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="row text-left">
                                <button type="button" class="col-sm btn btn-sm btn-outline-warning ">Cadastrar</button>
                            </div>
                    </div>
                    </form>
                </div>



            </div> 
        </div><!-- /container -->
    </nav><!-- /nav -->



    <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
</body>
</html>
