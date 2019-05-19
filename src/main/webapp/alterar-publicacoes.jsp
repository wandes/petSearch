<%-- any content can be specified here e.g.: --%>

<%@page import="br.com.petsearch.mvc.dao.User"%>
<%@page import="br.com.petsearch.mvc.dao.Animal"%>
<%@page import="br.com.petsearch.mvc.dao.Address"%>
<%@ page pageEncoding="UTF-8" %>


<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head.jspf"%>




        <title>Alterar Usuário</title>
    </head> 

    <p><%=request.getParameter("idAnimal")%></p>
    <body>
        <%
            if (session.getAttribute("session_animal") == null) {

                Animal animal = Animal.getAnimal(Integer.parseInt(request.getParameter("idAnimal")));
                session.setAttribute("session_animal", animal);

            } else {
                Animal an = (Animal) session.getAttribute("session_animal");

        %>
        <%String msg = ""; %>
        <div id="publicacoesConteudo">

            <%if (session.getAttribute("session_user") == null) {
                    response.sendRedirect("index.jsp");
                } else {%>


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

                            Address.updateAddress(request.getParameter("street"), Integer.parseInt(request.getParameter("postalCode")), request.getParameter("district"), request.getParameter("city"), request.getParameter("state"), request.getParameter("country"), an.getIdAnimal());
                            response.sendRedirect("publicacoes.jsp");
                        } catch (Exception ex) {
                            System.out.println(ex.getMessage());
                            msg = ex.getMessage();
                        }
                    }
                }
            %>   
            <%try {

            %>  

            <form method="post" >   
                <div class="modal-body">
                    <!-- FORMULÁRIO DE EDIÇÃO --->

                    <%                                        if (an == null) {
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
                        <input type="text" class="form-control" id="editarNomePet" value="<%=an.getIdAnimal()%>" name="idAnimalAlt" placeholder="Nome do seu pet" disabled >
                        <label for="editarNomePet">Nome</label>
                        <input type="text" class="form-control" id="editarNomePet" value="<%=an.getNameAnimal()%>" name="nameAnimal" placeholder="Nome do seu pet" >
                        <label for="editarIdade">Idade</label>
                        <input type="text" class="form-control" id="editarIdade" value="<%=an.getAgeAnimal()%>" name="ageAnimal" placeholder="Idade do seu pet">
                        <label for="editarEstado">Espécie</label>
                        <input type="text" class="form-control" id="editarEspecie" value="<%=an.getNameSpeciesAnimal()%>" name="nameSpeciesAnimal" placeholder="Espécie do seu pet">
                        <label for="editarCidade">Raça</label>
                        <input type="text" class="form-control" id="editarRaca" value="<%=an.getNameRace()%>" name="nameRace" placeholder="Raça do seu pet">
                        <label for="editarRua">Sexo</label>
                        <input type="text" class="form-control" id="editarSexo" value="<%=an.getNameGenderAnimal()%>" name="nameGenderAnimal" placeholder="Sexo do seu pet">
                        <label for="editarCor">Cor</label>
                        <input type="text" class="form-control" id="editarCor" value="<%=an.getNameColor()%>" name="nameColor" placeholder="Cor do seu pet">
                        <div class="form-group">
                            <label>Observações</label>
                            <textarea class="form-control" rows="3" name="comments"></textarea>
                        </div>
                        <% Address end = Address.getAddress(an.getIdAnimal());%>      

                        <div class="border-bottom text-center font-weight-bold my-2">Sobre o endereço</div>
                        <label for="editarNomePet">CEP</label>
                        <input type="text" class="form-control" id="editarCepEnd" value="<%=end.getPostalCode()%>" name="postalCode">
                        <label for="editarIdade">País</label>
                        <input type="text" class="form-control" id="editarPais" value="<%=end.getCountry()%>" name="country" >
                        <label>Estado</label>
                        <select class="form-control" name="state">
                            <option>SP</option>
                            <option>MG</option>
                            <option>PR</option>
                            <option>AM</option>
                            <option>RJ</option>
                        </select>
                        <label for="editarCidade">Cidade</label>
                        <input type="text" class="form-control" id="editarCidade" value="<%=end.getCity()%>" name="city">
                        <label for="editarRua">Bairro</label>
                        <input type="text" class="form-control" id="editarBairro" value="<%=end.getDistrict()%>" name="district">
                        <label for="editarCor">Rua</label>
                        <input type="text" class="form-control" id="editarRua" value="<%=end.getStreet()%>" name="street">
                    </div>

                </div>
                <div class="modal-footer">
                      <a class="btn btn-danger" href="publicacoes.jsp">Voltar</a>                           
                    <button class="btn btn-success" type="submit" name="updateAnimal" >Alterar</button>  

                </div>
            </form>

            <%}%>
            <p><%=msg%></p>

            <% } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    msg = ex.getMessage();
                }
            %>  
           

            <% }%>  


        </div>
</html>


