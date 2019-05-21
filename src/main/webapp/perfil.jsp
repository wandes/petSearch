<%-- 
    Document   : perfil
    Created on : 02/04/2019, 22:05:12
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>Usuarios</title>
    </head>
    <body style="text-align:center;">
        <%@include file="../WEB-INF/jspf/header.jspf"%>
 <% if(session.getAttribute("session_user") != null){%>
        <%
          String msg = ""; 
          User user = (User)session.getAttribute("session_user");
        
         Animal animal = Animal.getAnimal(user.getId());
          
        %>



        <%if (request.getParameter("updateUser") != null) {
            
                     try { User.updateUser(request.getParameter("nameUp"), request.getParameter("emailUp"), request.getParameter("passwordUp"),
                              request.getParameter("telephoneUp"), user.getId());  
              
                     //criar método puxar por ID user
                     user = User.getUser(request.getParameter("emailUp"), request.getParameter("passwordUp"));
               
                     session.setAttribute("session_user", user);
                response.sendRedirect("perfil.jsp");
             } catch (Exception ex) {
              System.out.println(ex.getMessage()); } } %>

        

        <% 
                      
    if (request.getParameter("deleteUser") != null ) {
            
       try {                     
       User.deleteUser(user.getId());
         session.invalidate();
    response.sendRedirect("index.jsp");
       } catch (Exception ex) {
        System.out.println(ex.getMessage());
              
       } } %> 

        <main class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container"><!-- Sidebar -->
                            <div class="row">
                                <a class="btnMenu text-left pl-1 pt-3" href="perfil.jsp">
                                    Perfil
                                </a>
                                <a class="btnMenu text-left pl-1 pt-3" href="publicacoes.jsp">
                                    Publicações
                                </a>
                                <a class="btnMenu text-left pl-1 pt-3" href="conta.jsp">
                                    Conta
                                </a>
                                <a class="btnMenu text-left pl-1 pt-3" href="ajuda.jsp">
                                    Ajuda
                                </a>
                            </div>    
                        </div>
                    </div>
                    <div class="col-sm-8 ">
                        <div class="container border pb-3"><!-- Principal -->
                            <!-- ABA DO PERFIL ------------------------------------------------------------>
                            <div class="accordion" id="areaConteudo">
                                <div id="perfilConteudo" class="collapse show" aria-labelledby="headingOne" data-parent="#areaConteudo">
                                    <div class="row d-flex justify-content-end">
                                        <button type="button" class="btn btn-primary m-2" data-toggle="modal" data-target="#editarConteudoPerfil">Editar</button>

                                        <form method="post" action="perfil.jsp">
                                            <button type="submit" class="btn btn-danger m-2" data-toggle="modal" name="deleteUser" >Excluir Conta</button>
                                        </form>
                                        <!-- Modal -->
                                        <div class="modal fade" id="editarConteudoPerfil" tabindex="-1" role="dialog" aria-labelledby="TituloModalPerfil" aria-hidden="true">


                                            <div class="modal-dialog modal-dialog-centered" role="document">

                                                <form method="post" action="perfil.jsp">

                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="TituloModalPerfil">Edite suas informações!</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!---------------- FORMULÁRIO DE EDIÇÃO --------------------------------------->
                                                            <div class="form-group text-left">
                                                                <div class="border-bottom text-center font-weight-bold my-2">Sobre seu perfil</div>
                                                                <label for="editarFoto">Fonto de perfil</label>
                                                                <input type="file" class="form-control-file" id="editarFoto">
                                                                <label for="editarNome" >ID</label>
                                                                <input type="text" class="form-control" id="editarNome" value="<%=user.getId()%>" name="idUp" disabled="">
                                                                <label for="editarNome">Nome</label>
                                                                <input type="text" class="form-control" id="editarNome" value="<%=user.getName()%>" name="nameUp">
                                                                <label for="editarNome">E-mail</label>
                                                                <input type="email" class="form-control" id="editarEmail" value="<%=user.getEmail()%>" name="emailUp">
                                                                <label for="editarNome">Senha</label>
                                                                <input type="password" class="form-control" id="editarSenha" value="<%=user.getPassword()%>" name="passwordUp">
                                                                <label for="editarNome">Celular</label>
                                                                <input type="text" class="form-control" id="editarCelular" value="<%=user.getTelephone()%>" name="telephoneUp">
                                                                <!--<label class="d-block" for="editarSexo">Sexo</label>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="radioSexo" id="editarSexo" value="">
                                                                  <label class="form-check-label" for="editarSexo">Masculino</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                  <input class="form-check-input" type="radio" name="radioSexo" id="editarSexo" value="Feminino">
                                                                  <label class="form-check-label" for="editarSexo">Feminino</label>
                                                                </div>-->

                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                            <button type="submit" class="btn btn-primary" name="updateUser">Salvar mudanças</button>
                                                        </div>
                                                    </div>
                                                </form>

                                                <%@include file="../WEB-INF/jspf/conteudoPerfil.jspf"%>


                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="border-bottom text-left pl-3">
                                                Sobre seu perfil
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Foto de perfil:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left">
                                                        <img src="img/testePerfil.jpg" alt="avatar" class="md-avatar size-3 rounded-circle">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Nome:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=user.getName()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">E-mail:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=user.getEmail()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Celular:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=user.getTelephone()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Sexo:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=user.getGender()%></div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>

                                <div id="publicacoesConteudo" class="collapse" aria-labelledby="headingTwo" data-parent="#areaConteudo">
                                    <div class="row d-flex justify-content-end">
                                        <button type="button" class="btn btn-primary m-2" data-toggle="modal" data-target="#editarConteudoPublicacoes">Editar</button>

                                        <!-- Modal -->
                                        <div class="modal fade" id="editarConteudoPublicacoes" tabindex="-1" role="dialog" aria-labelledby="TituloModalPet" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="TituloModalPet">Edite suas informações!</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <!-- FORMULÁRIO DE EDIÇÃO --->
                                                        <form>
                                                            <%  msg = "";
                                                           
                                                            if(animal == null){
                                                            msg = Animal.getMsgConnection();
                                                            }else{%> 

                                                            <div class="form-group text-left">
                                                                <div class="border-bottom text-center font-weight-bold my-2">Sobre seu pet</div>
                                                                <label for="editarNomePet">Nome</label>
                                                                <input type="text" class="form-control" id="editarNomePet" value="<%=animal.getNameAnimal()%>" name="NameAnimal"  >
                                                                <label for="editarIdade">Idade</label>
                                                                <input type="text" class="form-control" id="editarIdade" value="<%=animal.getAgeAnimal()%>" name="AgeAnimal" >
                                                                <label for="editarEstado">Espécie</label>
                                                                <input type="text" class="form-control" id="editarEspecie" value="<%=animal.getNameSpeciesAnimal()%>" name="NameSpeciesAnimal" >
                                                                <label for="editarCidade">Raça</label>
                                                                <input type="text" class="form-control" id="editarRaca" value="<%=animal.getNameRace()%>" name="NameRace" >
                                                                <label for="editarRua">Sexo</label>
                                                                <input type="text" class="form-control" id="editarSexo" value="estruturar no banco" placeholder="Sexo do seu pet">
                                                                <label for="editarCor">Cor</label>
                                                                <input type="text" class="form-control" id="editarCor" value="<%=animal.getNameColor()%>" name="NameColor" >
                                                            </div>

                                                            <%}%>
                                                            <p><%=msg%></p>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                        <button type="button" class="btn btn-primary">Salvar mudanças</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="border-bottom text-left pl-3">
                                                Sobre seu pet

                                                <%   
                                                   if(animal == null){
                                                   msg = Animal.getMsgConnection();
                                                   }else{%>                                     
                                            </div>                                       
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Nome:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=animal.getNameAnimal()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Idade:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=animal.getAgeAnimal()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Espécie:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=animal.getNameSpeciesAnimal()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Raça:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=animal.getNameRace()%></div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Sexo:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left">estruturar banco, get e set</div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-4 ">
                                                    <div class="font-weight-bold text-right">Cor:</div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="text-left"><%=animal.getNameColor()%></div>
                                                </div>                                                                 
                                            </div>
                                            <%}%>
                                            <p><%=msg%></p>
                                        </div>

                                    </div>
                                </div>

                                <div id="contaConteudo" class="collapse" aria-labelledby="headingThree" data-parent="#areaConteudo">
                                    <div class="row">
                                        Em desenvolvimento
                                    </div>
                                </div>
                                <div id="ajudaConteudo" class="collapse" aria-labelledby="headingFour" data-parent="#areaConteudo">
                                    <div class="row">
                                        Em desenvolvimento
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--
        <h1 style="background-color:  #e1e1ea;">Usuarios</h1>
        <h2>"Em desenvolvimento " Cadastrados: </h2> 
        -->  

        <%@include file="../WEB-INF/jspf/bootstrapBody.jspf"%>
       <%}%>
       
       <footer >          
            <hr>
            <span class=" dark link">Disponível em : <a target="_blank" href="https://github.com/petSearch.git">https://github.com/petSearch.git</a></span>
        </footer>
    </body>
</html>
