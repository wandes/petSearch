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
    
    <% String msg = "";

            if (request.getParameter("register") != null && request.getParameter("password").equals(request.getParameter("ConfirmPass"))) {
             
             String n = request.getParameter("telephone");
             n = n.replaceAll("\\D", "");
        
                try {
                    User.insertUser(request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
                            n, request.getParameter("gender"));

                    User user = User.getUser(request.getParameter("email"), request.getParameter("password"));
                    session.setAttribute("session_user", user);
                    response.sendRedirect("home.jsp");
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ""+ex.getMessage();
                }
            } %>
           
        <%
          
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
    <body class="stdBG" >
        <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white ">
            <div class="container">
                <a class="navbar-brand text-warning" href="../view/home.jsp">LOGO</a>

                <form method="post" action="index.jsp">
                    <div class="row">
                        <label for="email" class="text-warning">E-mail</label>
                        <div class="col-sm-3 input-group-sm ">
                            <input type="email" class="form-control"  id="email"  aria-label="Username" aria-describedby="basic-addon1" name="email" placeholder="nome@email.com"  required="">
                             
                        </div>

                        <label for="senha" class="text-warning">Senha</label>
                        <div class="col-sm-3 input-group-sm ">    
                            <input type="password" class="form-control" id="senha"  aria-label="Username" aria-describedby="basic-addon1"  placeholder="senha"  name="password" required="">
                        </div>
                          
                        <div class="col-sm-3 input-group-sm " >
                            <button type="submit" name="login" class="col-sm btn btn-sm btn-outline-warning " >Entrar</button>
                        </div>
                        
                    </div>
                    <span style="color: black;"><%=msg%></span>  
                </form>
            
            </div>

        </nav><!--header-->
      
        <nav class="navbar navbar-default ">
            <div class="container  ">
                <!--navbar-->
                <div class="row" >
                    <div class="col-md-5 ">


                        <!-- carousel--> 

                        <div style="margin-top: 30%;" id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="img/carouse2.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img  class="d-block w-100" src="img/carouse1.jpg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="img/carouse3.jpg" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                    </div>
                    <div class="col-sm-2 "></div>
                    <div class="col-md-5 ">
                        <div class="row ">
                            <div class="col-md-12 text-center">
                                <h3 class=" text-warning ">CADASTRE-SE !</h3><br>
                            </div>
                        </div>  
                        <div class="form-group col-md-12"> 
                            <p style="color:black; text-align: justify;">
                           
                            </p>
                        </div>


                        <form method="post" action="#">
                            <div class="row ">
                                <div class="row">

                                    <div class="form-group col-md-6">
                                        <label for="nome" class="text-warning">Nome</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="text" class="form-control"  id="name" name="name" required placeholder="Nome"  required >
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="celular" class="text-warning">Celular</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="text" class="form-control " id="telefone" name="telephone"  required placeholder="(99)99999-9999">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="email" class="text-warning">E-mail</label>
                                        <div class="col-sm input-group small mb-2">
                                            <input type="email" class="form-control "  id="email" name="email" required placeholder="nome@email.com" required>
                                        </div>
                                    </div>


                                    <div class="form-group col-md-6">
                                        <label for="senha" class="text-warning">Senha</label>
                                        <div class="col-sm input-group small mb-2">    
                                            <input type="password" class="form-control" id="cadastroSenha" name="password"   required placeholder="Senha" required>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="confirmaSenha" class="text-warning">Confirme</label>
                                        <div class="col-sm input-group small mb-2">    
                                            <input type="password" class="form-control"  id="confirmaSenha" name="ConfirmPass"   placeholder="Confirme a senha"  required>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12"> 
                                        <p style="color:black; text-align: center;" id="msgRegister"></p>
                                    </div>


                                    <div class="form-group col-md-6">
                                        <div class="col-sm input-group  mb-6">
                                            
                                            <input class="form-check-input " type="radio" name="gender"  id="masculino" value="Masculino" required >
                                            <label class="form-check-label text-warning" for="masculino" >Masculino</label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="col-sm input-group  mb-6">
                                            <input class="form-check-input" type="radio" name="gender"  id="feminino" value="Feminino" >
                                            <label class="form-check-label text-warning" for="feminino">Feminino</label>
                                        </div>
                                    </div>


                                </div>

                            </div>
                            <div class="row text-left">
                                <button type="submit" class="col-sm btn btn-md btn-outline-warning " name="register" onclick="validatePassword()" >Cadastrar</button>
                            </div>
                    </div>
                    </form>
                </div>

            </div> 
        </div>
    </nav>

    <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/jquery.mask.min.js"></script>       
   <script src="js/script_jquery.js"></script>  
   <script type="text/javascript" src="js/Funcoes.js"></script>
    
</body>


</html>
