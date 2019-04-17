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
        <title>Login</title>
    </head>
    <body>

        <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white">
            <div class="container">
                <a class="navbar-brand text-warning" href="../view/home.jsp">LOGO</a>

                <form method="post" action="index.jsp">
                    <div class="row text-left">
                        <label for="email" class="text-warning">E-mail</label>
                        <div class="col-sm input-group small mb-2">
                            <input type="email" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1" name="email">
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
       <%if (request.getParameter("register") != null) {
           
                    try { User.insertUser(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
                                Integer.parseInt(request.getParameter("telephone")), request.getParameter("gender"));  
               response.sendRedirect("home.jsp");
                User user = User.getUser(request.getParameter("email"), request.getParameter("password"));
               session.setAttribute("session_user", user);
                response.sendRedirect("home.jsp");
            } catch (Exception ex) {
             System.out.println(ex.getMessage());
          } } %>
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
                    <img class="img-responsive col-sm-6 pull-right " src="img/cachorros-em-png-3.png">
                    <div class="col-sm-6 ">
                        <div class="row ">
                            <h3 class=" text-warning ">Cadastre-se !</h3>
                        </div>
                        
                        <form method="post" action="index.jsp">
                            <div class="row text-left">
                                <div class="row">
                                    <label for="email" class="text-warning">E-mail</label>
                                    <div class="col-sm input-group small mb-2">
                                        <input type="email" class="form-control"  id="email" name="email">
                                    </div>
                                    <label for="nome" class="text-warning">Nome</label>
                                    <div class="col-sm input-group small mb-2">
                                        <input type="text" class="form-control"  id="nome" name="name">
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="senha" class="text-warning">Senha</label>
                                    <div class="col-sm input-group small mb-2">    
                                        <input type="password" class="form-control" id="senha" name="password">
                                    </div>

                                    <label for="confirmaSenha" class="text-warning">Confirme</label>
                                    <div class="col-sm input-group small mb-2">    
                                        <input type="password" class="form-control" id="confirmaSenha" disabled="">
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="celular" class="text-warning">Celular</label>
                                    <div class="col-sm input-group small mb-2">
                                        <input type="text" class="form-control phone-ddd-mask" id="telefone" name="telephone" placeholder="Ex.: (00) 0000-0000">
                                    </div>
                                </div>
                            </div>
                            <div class="form-check">
                                <div class="row">
                                    <div class="col-sm input-group  mb-2">
                                        <input class="form-check-input " type="radio" name="gender"  id="masculino" value="M">
                                        <label class="form-check-label text-warning" for="masculino">Masculino</label>
                                    </div>
                                    <div class="col-sm input-group  mb-2">
                                        <input class="form-check-input" type="radio" name="gender"  id="feminino" value="F">
                                        <label class="form-check-label text-warning" for="feminino">Feminino</label>
                                    </div>
                                    <div class="col-sm input-group  mb-2">
                                        <input class="form-check-input" type="radio" name="gender"  id="outros" value="O">
                                        <label class="form-check-label text-warning" for="outros">Outros</label>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="row text-left">
                                <button type="submit" class="col-sm btn btn-sm btn-outline-warning " name="register">Cadastrar</button>
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
