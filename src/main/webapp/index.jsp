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
    <body class="stdBG">

        <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white">
            <div class="container">
                <a class="navbar-brand text-warning" href="../view/home.jsp">LOGO</a>

                <form method="post" action="index.jsp">
                    <div class="row">
                        <label for="email" class="text-warning">E-mail</label>
                        <div class="col-sm-3 input-group-sm ">
                            <input type="email" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1" name="email" required="">
                        </div>

                        <label for="senha" class="text-warning">Senha</label>
                        <div class="col-sm-3 input-group-sm ">    
                            <input type="password" class="form-control" id="senha"  aria-label="Username" aria-describedby="basic-addon1" name="password" required="">
                        </div>
                        
                        <div class="col-sm-3 input-group-sm " >
                            <button type="submit" name="login" class="col-sm btn btn-sm btn-outline-warning " >Entrar</button>
                        </div>
                    </div>
                </form>
            </div>
        </nav><!--header-->
        <%if (request.getParameter("register") != null) {

                try {
                    User.insertUser(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
                            Integer.parseInt(request.getParameter("telephone")), request.getParameter("gender"));
                    response.sendRedirect("home.jsp");
                    User user = User.getUser(request.getParameter("email"), request.getParameter("password"));
                    session.setAttribute("session_user", user);
                    response.sendRedirect("home.jsp");
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
               }
           } %>
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




        <nav class="navbar navbar-default ">
            <div class="container  ">
                <!--navbar-->
                <div class="row" >
                    <div class="col-md-5 ">
                        <img class="img-responsive img-fluid " src="img/cachorros-em-png-3.png">
                        <img class="img-responsive img-fluid " src="img/cachorros-em-png-3.png">
                    </div>
                    <div class="col-sm-2 "></div>
                    <div class="col-md-5 ">
                        <div class="row ">
                            <div class="col-md-12 text-center">
                                <h3 class=" text-warning ">CADASTRE-SE !</h3><br>
                            </div>
                        </div>  
                        

                        <form method="post" action="index.jsp">
                            <div class="row ">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="email" class="text-warning">E-mail</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="email" class="form-control "  id="email" name="email" required="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="senha" class="text-warning">Senha</label>
                                        <div class="col-sm input-group small mb-2">    
                                            <input type="password" class="form-control" id="senha" name="password" required="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="confirmaSenha" class="text-warning">Confirme</label>
                                        <div class="col-sm input-group small mb-2">    
                                            <input type="password" class="form-control" id="confirmaSenha" disabled="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="nome" class="text-warning">Nome</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="text" class="form-control"  id="nome" name="name" required="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="celular" class="text-warning">Celular</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="text" class="form-control phone-ddd-mask" id="telefone" name="telephone" placeholder="Ex.: (00) 0000-0000" required="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="col-sm input-group  mb-2">
                                            <input class="form-check-input " type="radio" name="gender"  id="masculino" value="M" >
                                            <label class="form-check-label text-warning" for="masculino">Masculino</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="col-sm input-group  mb-2">
                                            <input class="form-check-input" type="radio" name="gender"  id="feminino" value="F" >
                                            <label class="form-check-label text-warning" for="feminino">Feminino</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="col-sm input-group  mb-2">
                                            <input class="form-check-input" type="radio" name="gender"  id="outros" value="O">
                                            <label class="form-check-label text-warning" for="outros">Outros</label>
                                        </div>
                                    </div>
                                </div>
                                
                                    
                                
                            </div>
                            
                            <div class="row text-left">
                                <button type="submit" class="col-sm btn btn-md btn-outline-warning " name="register">Cadastrar</button>
                            </div>
                    </div>
                    </form>
                </div>



            </div> 
        </div>
    </nav>



    <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
</body>
</html>
