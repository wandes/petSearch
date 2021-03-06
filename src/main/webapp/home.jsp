<%-- 
    Document   : home
    Created on : 06/04/2019, 22:49:14
    Author     : Leona
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page import="br.com.petsearch.mvc.dao.Address"%>
<%@page import="br.com.petsearch.mvc.dao.Publication"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/head.jspf"%>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <title>Home</title>
    </head>

    <body>
        <% if (session.getAttribute("session_user") != null) {%>
        <%User user = (User) session.getAttribute("session_user");
            String msg = "";
        %>


        <%
            if (request.getParameter("registerPublication") != null) {

                //cadastrando animal e associando ao usuário      
                try {
                    Animal.insertAnimal(Integer.parseInt(request.getParameter("statusAnimal")), request.getParameter("namePet"), request.getParameter("speciesPet"), request.getParameter("racePet"), request.getParameter("genderPet"), request.getParameter("colorPet"), Integer.parseInt(request.getParameter("agePet")), request.getParameter("comentarios"));
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            }
        %>

        <%if (request.getParameter("registerPublication") != null) {

                try {

                    User.insertUserAnimal(user.getId());

                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            }
        %>


        <%if (request.getParameter("registerPublication") != null) {

                Animal animal = Animal.getAnimal(user.getId());
                try {
                    Address.insertAddress(request.getParameter("street"), Integer.parseInt(request.getParameter("postalCode").replaceAll("\\D", "")), request.getParameter("district"), request.getParameter("city"), request.getParameter("state"), request.getParameter("country"));
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            }
        %>



        <%
            if (request.getParameter("registerPublication") != null) {

                try {
                    Publication.insertPublication(Integer.parseInt(request.getParameter("statusAnimal")), user.getId());

                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            }%>

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
                                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="navbar modal-header ">
                                                <div class="modal-title h5 text-white w-100 text-center " >Crie sua publicação!</div>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <form method="post" action="home.jsp">
                                                <div class="modal-body stdBG">
                                                    <!-- FORMULÁRIO DE EDIÇÃO --->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="border-bottom text-center font-weight-bold my-2">Sobre sua publicação</div>

                                                            <div class="form-group col-md-3 ">
                                                                <div class="form-check w-100 text-center">
                                                                    <input class="form-check-input" type="radio" name="statusAnimal" id="perdidoRadio" value="0" required >
                                                                    <label class="form-check-label" for="perdidoRadio">
                                                                        Perdido
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-3 ">
                                                                <div class="form-check w-100 text-center">
                                                                    <input class="form-check-input" type="radio" name="statusAnimal" id="encontradoRadio" value="1">
                                                                    <label class="form-check-label" for="encontradoRadio">
                                                                        Encontrado
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group text-left col-md-5">
                                                            <div class="border-bottom text-center font-weight-bold my-2">Cadastrar Pet</div>
                                                            <label for="editarNomePet">Nome</label>
                                                            <input type="text" class="form-control campoNome"  name="namePet" placeholder="Nome do seu pet" required="">
                                                            <label for="editarIdade">Idade</label>
                                                            <input type="text" class="form-control campoIdade"  name="agePet" placeholder="Idade do seu pet" required>
                                                            <label for="editarEstado">Espécie</label>
                                                            <input type="text" class="form-control campoNome"  name="speciesPet" placeholder="Espécie do seu pet" required>
                                                            <label for="editarCidade">Raça</label>
                                                            <input type="text" class="form-control campoNome"  name="racePet" placeholder="Raça do seu pet" required>
                                                            <label for="editarRua">Sexo</label>
                                                            <input type="text" class="form-control campoNome"  name="genderPet" placeholder="Sexo do seu pet" required>
                                                            <label for="editarCor">Cor</label>
                                                            <input type="text" class="form-control campoNome"  name="colorPet" placeholder="Cor do seu pet" required>
                                                            <div class="form-group" name="comments" >
                                                                <label>Observações: </label>
                                                                <textarea type="text" class="form-control "  rows="3" name="comentarios"></textarea>
                                                                <label style="color: red;"> 'estudando para mostrar acentuação de caráter vindos do Banco'</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2"></div>
                                                        <div class="form-group text-left col-md-5">
                                                            <div class="border-bottom text-center font-weight-bold my-2">Cadastrar Endereço</div>
                                                            <label for="editarRua">CEP</label>
                                                            <input type="text" class="form-control campoCep"  name="postalCode" required>
                                                            <label for="editarNomePet">País</label>
                                                            <input type="text" class="form-control campoNome"  name="country" required>
                                                            <label>Estado</label>
                                                            <select required  class="form-control" name="state" > 
                                                                <option >SP</option>
                                                                <option>MG</option>
                                                                <option>RS</option>
                                                                <option>RJ</option>                                                           
                                                            </select>
                                                            <label for="editarEstado">Cidade</label>
                                                            <input type="text" class="form-control campoNome"  name="city" required>
                                                            <label for="editarCidade">Bairro</label>
                                                            <input type="text" class="form-control campoNome"  name="district" required>
                                                            <label for="editarCor">Rua</label>
                                                            <input type="text" class="form-control campoNome"  name="street" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                    <button type="submit" class="btn btn-primary" name="registerPublication">Salvar mudanças</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>   
                    <!--- publicação-->

                    <div class="col-sm-8 mb-5">
                        <h2> Publicações</h2>
                        <div class="container border py-2">
                            <%try {
                                    for (Publication p : Publication.getPublication()) {

                                        User userPublic = User.getUserForId(p.getCodUser());
                                        Animal animalPublic = Animal.getAnimal(p.getCodAnimal());
                                        Address endPublic = Address.getAddress(p.getCodAnimal());

                            %>

                            <div class="row"> 

                                <div class="col-lg-4 d-flex align-items-center">

                                    <img src="img/testePerfil.jpg" alt="avatar" class="md-avatar size-2 rounded-circle">
                                    <span class="pl-3"><%=userPublic.getName()%></span>
                                </div>

                                <div class="col-lg-2 d-flex flex-column py-4">
                                    <span class=" text-center">Nome: <%=animalPublic.getNameAnimal()%></span>
                                    <span class=" text-center">Raça: <%=animalPublic.getNameRace()%></span>
                                    <span class=" text-center">Sexo: <%=animalPublic.getNameGenderAnimal()%></span>
                                </div>
                                <div class="col-lg-2 d-flex flex-column py-4">
                                    <span class=" text-center">Cor: <%=animalPublic.getNameColor()%></span>
                                    <span class=" text-center">Idade: <%=animalPublic.getAgeAnimal()%></span>
                                </div>
                                <div class="col-lg-4 d-flex flex-column py-4">
                                    <span class=" text-center">
                                        <%if (animalPublic.getStatusAnimal() == 0) {%>
                                        <p>Perdido em: </p>
                                        <%} else {%>
                                        <p>Encontrado em:</p>
                                        <%}%></span>
                                    <span class=" text-center"><%=endPublic.getCity()%></span>
                                    <span class=" text-center"><%=endPublic.getDistrict()%></span>
                                    <span class=" text-center"><%=endPublic.getStreet()%></span>
                                </div>
                            </div>
                            <div class="row"><p> Observações</p>
                                <div class="container">
                                    <span>
                                        <%=animalPublic.getComments()%>
                                    </span>
                                </div>
                            </div>
                            <div class="row"><!-- Fotos-->
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
                            <div class="row"><!-- Botões-->
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

                            <div class="row"><!-- Barra p/ Comentar-->
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
                            <hr>
                            <%}%>
                        </div>

                        <% } catch (Exception ex) {
                                System.out.println(ex.getMessage());
                                msg = ex.getMessage();
                            }%>
                    </div>

                </div>
            </div>
        </main>

        <%}%>

        <footer >          
            <hr>
            <span class=" dark link">Disponível em : <a target="_blank" href="https://github.com/wandes/petSearch">https://github.com/wandes/petSearch</a></span>
        </footer>
        <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/jquery.mask.min.js"></script>       
        <script src="js/script_jquery.js"></script>  
        <script type="text/javascript" src="js/Funcoes.js"></script>

    </body>
</html>
