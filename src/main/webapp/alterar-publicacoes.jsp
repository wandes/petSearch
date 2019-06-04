<%-- any content can be specified here e.g.: --%>

<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page import="br.com.petsearch.mvc.dao.Address"%>
<%@ page pageEncoding="UTF-8" %>


<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%if (session.getAttribute("session_user") == null) {
                response.sendRedirect("index.jsp");
            } else {%>
        <%String msg = "";%>
        <% if (session.getAttribute("session_animal") == null) {

                Animal animal = Animal.getAnimal(Integer.parseInt(request.getParameter("idAnimal")));
                session.setAttribute("session_animal", animal);
            }
              if (session.getAttribute("session_animal") != null) {
                Animal an = (Animal) session.getAttribute("session_animal");%>

        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>Alterar Publicação</title>

    </head>

    <body style="text-align:center;">

        <%@include file="../WEB-INF/jspf/header.jspf"%>



        <%
            User user = (User) session.getAttribute("session_user");

            if (request.getParameter("updateAnimal") != null) {

                try {
                    Animal.updateAnimal(Integer.parseInt(request.getParameter("statusAnimal")), request.getParameter("nameAnimal"), request.getParameter("nameSpeciesAnimal"),
                            request.getParameter("nameRace"), request.getParameter("nameGenderAnimal"), request.getParameter("nameColor"), Integer.parseInt(request.getParameter("ageAnimal")), request.getParameter("comments"), an.getIdAnimal());

                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
            } %> 
        <%if (request.getParameter("updateAnimal") != null) {
                try {

                    Address.updateAddress(request.getParameter("street"), Integer.parseInt(request.getParameter("postalCode").replaceAll("\\D", "")), request.getParameter("district"), request.getParameter("city"), request.getParameter("state"), request.getParameter("country"), an.getIdAnimal());
                    session.setAttribute("session_animal", null);
                    response.sendRedirect("perfil.jsp");
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            }

        %>   
        <%try {

        %> 
        <div id="conteudo">
            <div class="container" style="background-color: #A2B5CD" >   
                <form method="post" >   
                    <div class="modal-body">
                        <!-- FORMULÁRIO DE EDIÇÃO --->

                        <% if (an == null) {
                            msg = Animal.getMsgConnection();
                            } else {

                        %>

                        <div class="form-group text-left">
                            <div class="border-bottom text-center font-weight-bold my-2">Sobre sua publicação</div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="statusAnimal" id="perdidoRadio" value="0" checked>
                                <label class="form-check-label" for="perdidoRadio">
                                    Perdido
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="statusAnimal" id="encontradoRadio" value="1">
                                <label class="form-check-label" for="encontradoRadio">
                                    Encontrado
                                </label>
                            </div>

                        </div>

                        <div class="form-group text-left">
                            <div class="border-bottom text-center font-weight-bold my-2">Sobre seu pet</div>
                            <label for="editarNomePet">Numero de Publicação</label>
                            <input type="text" class="form-control" id="editarNomePet" id="editarNomePet" value="<%=an.getIdAnimal()%>" name="idAnimalAlt" placeholder="Nome do seu pet" disabled >
                            <label for="editarNomePet">Nome</label>
                            <input type="text" class="form-control campoNome" id="editarNomePet"  value="<%=an.getNameAnimal()%>" name="nameAnimal" placeholder="Nome do seu pet" >
                            <label for="editarIdade">Idade</label>
                            <input type="text" class="form-control campoIdade" id="editarIdade" value="<%=an.getAgeAnimal()%>" name="ageAnimal" placeholder="Idade do seu pet">

                            <label for="editarEspecie">Espécie</label>
                            <input type="text" class="form-control campoNome"  id="editarEspecie"  value="<%=an.getNameSpeciesAnimal()%>" name="nameSpeciesAnimal" placeholder="Espécie do seu pet">
                            <label for="editarRaca">Raça</label>
                            <input type="text" class="form-control campoNome" id="editarRaca"  value="<%=an.getNameRace()%>" name="nameRace" placeholder="Raça do seu pet">
                            <label for="editarRua">Sexo</label>
                            <input type="text" class="form-control campoNome" id="editarRua"  value="<%=an.getNameGenderAnimal()%>" name="nameGenderAnimal" placeholder="Sexo do seu pet">
                            <label for="editarCor">Cor</label>
                            <input type="text" class="form-control campoNome" id="editarCor"  value="<%=an.getNameColor()%>" name="nameColor" placeholder="Cor do seu pet">
                            <div class="form-group">
                                <label>Observações</label>
                                <textarea class="form-control" rows="3"  name="comments" value=""><%=an.getComments()%></textarea>
                            </div>
                            <% Address end = Address.getAddress(an.getIdAnimal());%>      

                            <div class="border-bottom text-center font-weight-bold my-2">Sobre o endereço</div>
                            <label for="editarCep">CEP</label>
                            <input type="text" class="form-control campoCep" id="editarCep"  value="<%=end.getPostalCode()%>" name="postalCode">
                            <label for="editarPais">País</label>
                            <input type="text" class="form-control campoNome" id="editarPais"  value="<%=end.getCountry()%>" name="country" >
                            <label>Estado</label>
                            <select class="form-control" name="state">
                                <option >SP</option>
                                <option>MG</option>
                                <option>RS</option>
                                <option>RJ</option>  
                            </select>
                            <label for="editarCidade">Cidade</label>
                            <input type="text" class="form-control campoNome" id="editarCidade"  value="<%=end.getCity()%>" name="city">
                            <label for="editarBairro">Bairro</label>
                            <input type="text" class="form-control campoNome" id="editarRua" value="<%=end.getDistrict()%>" name="district">
                            <label for="editarRua">Rua</label>
                            <input type="text" class="form-control campoNome" id="editarRua" value="<%=end.getStreet()%>" name="street">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger" href="publicacoes.jsp">Voltar</a>                           
                        <button class="btn btn-success" type="submit" name="updateAnimal" >Alterar</button>  

                    </div>
                </form>
            </div>
        </div>


        <%}%>


        <% } catch (Exception ex) {
                System.out.println(ex.getMessage());
                msg = ex.getMessage();
            }
        %>  


        <%}}%>



        <footer >          
            <hr>
            <span class=" dark link">Disponível em : <a target="_blank" href="https://github.com/wandes/petSearch">https://github.com/petSearch.git</a></span>
        </footer>
        <%@include file="WEB-INF/jspf/bootstrapBody.jspf"%>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/jquery.mask.min.js"></script>       
        <script src="js/script_jquery.js"></script>  
        <script type="text/javascript" src="js/Funcoes.js"></script>

    </body>
</html>


