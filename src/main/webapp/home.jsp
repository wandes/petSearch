<%-- 
    Document   : home
    Created on : 06/04/2019, 22:49:14
    Author     : Leona
--%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <title>Home</title>
    </head>
   
        <%@include file="WEB-INF/jspf/header.jspf"%>
        
        <%User user = (User)session.getAttribute("session_user");%>
        
        <%if(user == null) {
            response.sendRedirect("index.jsp");             
              }%> 
              
  <%if (request.getParameter("registerPet") != null) {
          String descricao = "";
                    try {Animal.insertAnimal(0, request.getParameter("namePet"), request.getParameter("speciesPet"), request.getParameter("racePet"), request.getParameter("colorPet"), Integer.parseInt(request.getParameter("agePet")),descricao,user.getId());
                response.sendRedirect("home.jsp");
            } catch (Exception ex) {
             System.out.println(ex.getMessage());
          } } %>

<main class="mt-3">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="container border"><!-- Sidebar -->
                    <div class="row">
                        <div class="col-12 py-3 ">
                            <img src="img/testePerfil.jpg" alt="avatar" class="md-avatar rounded-circle">
                            <span class="pl-2"><%=user.getName()%></span>
                        </div>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary m-2 w-100" data-toggle="modal" data-target="#criarPublicacao">Criar publicação</button>
                        <div class="modal fade" id="criarPublicacao" tabindex="-1" role="dialog" aria-labelledby="TituloModalCriarPublicacao" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="TituloModalCriarPublicacao">Crie sua publicação!</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    
                                     <form method="post" action="home.jsp">
                                    <div class="modal-body">
                                        <!-- FORMULÁRIO DE EDIÇÃO --->
                                       
                                        
                                    
                                            <div class="form-group text-left">
                                                <div class="border-bottom text-center font-weight-bold my-2">Sobre seu pet</div>
                                                <label for="editarNomePet">Nome</label>
                                                <input type="text" class="form-control" id="criarNomePet" name="namePet" placeholder="Nome do seu pet">
                                                <label for="editarIdade">Idade</label>
                                                <input type="text" class="form-control" id="criarIdade" name="agePet" placeholder="Idade do seu pet">
                                                <label for="editarEstado">Espécie</label>
                                                <input type="text" class="form-control" id="criarEspecie" name="speciesPet" placeholder="Espécie do seu pet">
                                                <label for="editarCidade">Raça</label>
                                                <input type="text" class="form-control" id="criarRaca" name="racePet" placeholder="Raça do seu pet">
                                                <label for="editarRua">Sexo</label>
                                                <input type="text" class="form-control" id="criarSexo" name="genderPet" placeholder="Sexo do seu pet">
                                                <label for="editarCor">Cor</label>
                                                <input type="text" class="form-control" id="criarCor" name="colorPet" placeholder="Cor do seu pet">
                                            </div>
                                        
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                        <button type="submit" class="btn btn-primary" name="registerPet">Salvar mudanças</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-8 mb-5">
                <div class="container border py-2"><!-- Principal -->
                    <div class="row"><!-- Header da postagem -->
                        <div class="col-lg-4 d-flex align-items-center">
                            <img src="img/testePerfil.jpg" alt="avatar" class="md-avatar size-2 rounded-circle">
                            <span class="pl-3">Nome Sobrenome</span>
                        </div>

                        <div class="col-lg-2 d-flex flex-column py-4">
                            <span class=" text-center">Nome</span>
                            <span class=" text-center">Espécie Raça</span>
                            <span class=" text-center">Sexo</span>
                        </div>
                        <div class="col-lg-2 d-flex flex-column py-4">
                            <span class=" text-center">Cor</span>
                            <span class=" text-center">Idade</span>
                        </div>
                        <div class="col-lg-4 d-flex flex-column py-4">
                            <span class=" text-center">ENCONTRADO EM:</span>
                            <span class=" text-center">Rua José Agapito Cardoso</span>
                        </div>
                    </div>
                    <div class="row"><!-- Obesrvações -->
                        <div class="container">
                            <p>
                                <strong>Observações:</strong>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                Duis ornare id dui sit amet consequat. Vivamus id elementum tortor. 
                                Suspendisse faucibus, libero at sagittis placerat, orci nisl vulputate mi, 
                                non sodales metus ligula vel ante. Vestibulum vitae efficitur orci.
                            </p>
                        </div>
                    </div>
                    <div class="row"><!-- Fotos -->
                        <div id="carouselExampleControls" class="carousel slide col-sm-12 px-0">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="img/testeCarrossel.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/testeCarrossel.jpg" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="img/testeCarrossel.jpg" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="row"><!-- Botões -->
                        <div class="container py-2 d-flex justify-content-between">
                            <div class="col-sm-3 px-0">
                                <button type="button" class="btn btn-success w-100">É ele</button>
                            </div>
                            <div class="col-sm-6">
                                <button data-target="#collapseComentario" type="button" data-toggle="collapse" class="btn btn-primary w-100 ">
                                    Comentar
                                </button>
                            </div>
                            <div class="col-sm-3 px-0">
                                <button type="button" class="btn btn-danger w-100">Não é ele</button>
                            </div>
                        </div>
                    </div>

                    <div class="row"><!-- Barra p/ Comentar -->
                        <div class="container">
                            <div class="collapse" id="collapseComentario">
                                <div class="input-group">
                                    <input type="text" class="form-control col-sm-8" placeholder="Comente aqui...">
                                    <div class="input-group-append  col-sm-4 px-0" id="enviarComentario">
                                        <button class="btn btn-outline-primary w-100" type="button">Enviar</button>
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
 
</html>
