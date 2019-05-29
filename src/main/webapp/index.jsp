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
                msg = "" + ex.getMessage();
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


    <body>
        <div id="conteudo">
            <div id="principal">
                <nav class="navbar sticky-top navbar-expand-sm border-bottom bg-white ">
                    <div class="container">
                        <span>
                            <img class="logosize" src="img/logopetsearch2.png">
                        </span>

                        <form method="post" action="index.jsp">
                            <div class="row">
                                <label for="email" class="text-white">E-mail</label>
                                <div class="col-md-3 input-group-md ">
                                    <input type="email" class="form-control campoNomeEmail"    aria-label="Username" aria-describedby="basic-addon1" name="email" placeholder="nome@email.com"  required="">

                                </div>

                                <label for="senha" class="text-white">Senha</label>
                                <div class="col-md-3 input-group-md ">    
                                    <input type="password" class="form-control campoSenha"  aria-label="Username" aria-describedby="basic-addon1"  placeholder="senha"  name="password" required="">
                                </div>

                                <div class="col-md-3 input-group-md " >
                                    <button type="submit" name="login" class="col-sm btn btn-primary btn-md" >Entrar</button>
                                </div>

                            </div>
                            <span class="text-danger" ><%=msg%></span>  
                        </form>

                    </div>

                </nav><!--header-->



                <div class="container" >   

                    <!--navbar-->
                    <div class="row" >
                        <div class="col-md-6 ">
                            <br>
                            <!-- carousel--> 
                            <div class="row ">
                                <div class="col-md-12 dark link">
                                    <h3 class=" dark link " style="text-align: center">Como funciona o Pet Search?</h3><br>
                                    <p style="text-align: justify">
                                        Pet Search é um site que tem o intuito de facilitar o encontro de animais 
                                        desaparecidos, aproximando através de comparações de caracteristicas
                                        os animais desaparecidos com os encontrados.
                                    </p>
                                </div>
                            </div> 

                            <div  id="carouselExampleIndicators" class="carousel slide rounded"  data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100 rounded" src="img/carouse2.jpg" alt="First slide"   >
                                    </div>
                                    <div class="carousel-item">
                                        <img  class="d-block w-100 rounded" src="img/carouse1.jpg" alt="Second slide">
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100 rounded" src="img/carouse3.jpg" alt="Third slide">
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

                        <div class="col-sm-1 "></div>
                        <div class="col-md-5 ">
                            <br>
                            <div class="row ">
                                <div class="col-md-12 text-center">
                                    <h3 class=" text-secondary ">CADASTRE-SE !</h3><br>
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
                                            <label for="nome" class="dark link">Nome</label>
                                            <div class="col-sm input-group small mb-2">
                                                <input type="text" class="form-control campoNome"    name="name" required placeholder="Nome"  required >
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="celular" class="dark link">Celular</label>
                                            <div class="col-sm input-group small mb-2">
                                                <input type="text" class=" form-control campoTelefone"   name="telephone"  required placeholder="(99)99999-9999">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="email" class="dark link">E-mail</label>
                                            <div class="col-sm input-group small mb-2">
                                                <input type="email" class="form-control "   name="email" required placeholder="nome@email.com" required>
                                            </div>
                                        </div>


                                        <div class="form-group col-md-6">
                                            <label for="senha" class="dark link">Senha</label>
                                            <div class="col-sm input-group small mb-2">    
                                                <input type="password" class="form-control campoSenha" id="cadastroSenha" name="password"   required placeholder="Senha" required>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="confirmaSenha" class="dark link">Confirme</label>
                                            <div class="col-sm input-group small mb-2">    
                                                <input type="password" class="form-control campoSenha" id="confirmaSenha"  name="ConfirmPass"   placeholder="Confirme a senha"  required>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12"> 
                                            <p class="text-danger " id="msgRegister"></p>
                                        </div>


                                        <div class="form-group col-md-6">
                                            <div class="col-sm input-group  mb-6">

                                                <input class="form-check-input " type="radio" name="gender"  id="masculino" value="Masculino" required >
                                                <label class="form-check-label dark link" for="masculino" >Masculino</label>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <div class="col-sm input-group  mb-6">
                                                <input class="form-check-input" type="radio" name="gender"  id="feminino" value="Feminino" >
                                                <label class="form-check-label dark link" for="feminino">Feminino</label>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                                <div class="row text-left">
                                    <button type="submit" class="col-sm  btn btn-lg btn-primary" name="register" onclick="validatePassword()" >Cadastrar</button>
                                </div>
                            </form>

                        </div>
                    </div>

                </div> 
            </div>
        </div>

        <footer >          
            <hr>
            <span class=" dark link">Disponível em : <a target="_blank" href="https://github.com/wandes/petSearch">https://github.com/wandes/petSearch</a></span>
        </footer>
        <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/jquery.mask.min.js"></script>       
        <script src="js/script_jquery.js"></script>  
        <script type="text/javascript" src="js/Funcoes.js"></script>

        <!--    
     <div class="row ">
         <div class="col-md-12 dark link">
             <footer>
                
            </footer>
             </div>
         </div>   
        -->



    </body>


</html>
