<%-- 
    Document   : perfil
    Created on : 02/04/2019, 22:05:12
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.petsearch.mvc.dao.User"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>Usuarios</title>
    </head>
   <body style="text-align:center;">
        <%@include file="../WEB-INF/jspf/header.jspf"%>
         <%User user = (User)session.getAttribute("session_user");%>
        
        <%if(user == null) {
            response.sendRedirect("login.jsp");             
              }%> 
        
        <main class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container border"><!-- Sidebar -->
                            <div class="row">
                                <button class="btn btn-block btn-outline-warning text-left m-0" type="button" data-toggle="collapse" data-target="#perfilConteudo" aria-expanded="true" aria-controls="perfilConteudo">
                                  Perfil
                                </button>
                                <button class="btn btn-block btn-outline-warning collapsed text-left m-0" type="button" data-toggle="collapse" data-target="#publicacoesConteudo" aria-expanded="false" aria-controls="publicacoesConteudo">
                                  Publicações
                                </button>
                                <button class="btn btn-block btn-outline-warning collapsed text-left m-0" type="button" data-toggle="collapse" data-target="#contaConteudo" aria-expanded="false" aria-controls="contaConteudo">
                                  Conta
                                </button>
                                <button class="btn btn-block btn-outline-warning collapsed text-left m-0" type="button" data-toggle="collapse" data-target="#ajudaConteudo" aria-expanded="false" aria-controls="ajudaConteudo">
                                  Ajuda
                                </button>
                            </div>    
                        </div>
                    </div>
                    <div class="col-sm-8 ">
                        <div class="container conteudoPerfil border pb-3"><!-- Principal -->
<!-- ABA DO PERFIL ------------------------------------------------------------>
                            <div class="accordion" id="areaConteudo">
                                <div id="perfilConteudo" class="collapse show" aria-labelledby="headingOne" data-parent="#areaConteudo">
                                    <div class="row d-flex justify-content-end">
                                        <button type="button" class="btn btn-primary m-2" data-toggle="modal" data-target="#editarConteudoPerfil">Editar</button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="editarConteudoPerfil" tabindex="-1" role="dialog" aria-labelledby="TituloModalPerfil" aria-hidden="true">
                                          <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <h5 class="modal-title" id="TituloModalPerfil">Edite suas informações!</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                                  <span aria-hidden="true">&times;</span>
                                                </button>
                                              </div>
                                              <div class="modal-body">
<!---------------- FORMULÁRIO DE EDIÇÃO --------------------------------------->
                                                <form>
                                                    <div class="form-group text-left">
                                                      <div class="border-bottom text-center font-weight-bold my-2">Sobre seu perfil</div>
                                                      <label for="editarFoto">Fonto de perfil</label>
                                                      <input type="file" class="form-control-file" id="editarFoto">
                                                      <label for="editarNome">Nome</label>
                                                      <input type="text" class="form-control" id="editarNome" value="Leonardo Santos">
                                                      <label for="editarNome">E-mail</label>
                                                      <input type="email" class="form-control" id="editarEmail" value="leonardo@hotmail.com">
                                                      <label for="editarNome">Senha</label>
                                                      <input type="text" class="form-control" id="editarSenha" value="1234">
                                                      <label for="editarNome">Celular</label>
                                                      <input type="number" class="form-control" id="editarCelular" value="13988741744">
                                                      <label class="d-block" for="editarSexo">Sexo</label>
                                                      <div class="form-check form-check-inline">
                                                          <input class="form-check-input" type="radio" name="radioSexo" id="editarSexo" value="Masculino">
                                                        <label class="form-check-label" for="editarSexo">Masculino</label>
                                                      </div>
                                                      <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="radioSexo" id="editarSexo" value="Feminino">
                                                        <label class="form-check-label" for="editarSexo">Feminino</label>
                                                      </div><!--
                                                      <div class="border-bottom text-center font-weight-bold my-2">Sobre seu endereço</div>
                                                      <label for="editarPais">País</label>
                                                      <input type="text" class="form-control" id="editarNome" value="Brasil" placeholder="Seu país">
                                                      <label for="editarEstado">Estado</label>
                                                      <input type="text" class="form-control" id="editarNome" value="São Paulo" placeholder="Seu estado">
                                                      <label for="editarCidade">Cidade</label>
                                                      <input type="text" class="form-control" id="editarNome" value="Praia Grande" placeholder="Sua cidade">
                                                      <label for="editarRua">Rua</label>
                                                      <input type="text" class="form-control" id="editarNome" value="José Agapito Cardoso" placeholder="Sua rua">-->
                                                    </div>
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
                                                <div class="text-left">leonardo@hotmail.com</div>
                                            </div>
                                        </div>
                                            <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Senha:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">1234</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Celular:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">13988741744</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Sexo:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Masculino</div>
                                            </div>
                                        </div><!--
                                        <div class="border-bottom text-left pl-3">
                                                Sobre seu endereço
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">País:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Brasil</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Estado:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">São Paulo</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Cidade:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Praia Grande</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Rua:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">José Agapito Cardoso</div>
                                            </div>
                                        </div>-->
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
                                                    <div class="form-group text-left">
                                                      <div class="border-bottom text-center font-weight-bold my-2">Sobre seu pet</div>
                                                      <label for="editarNomePet">Nome</label>
                                                      <input type="text" class="form-control" id="editarNomePet" value="Bob" placeholder="Nome do seu pet">
                                                      <label for="editarIdade">Idade</label>
                                                      <input type="text" class="form-control" id="editarIdade" value="3 anos" placeholder="Idade do seu pet">
                                                      <label for="editarEstado">Espécie</label>
                                                      <input type="text" class="form-control" id="editarEspecie" value="Cachorro" placeholder="Espécie do seu pet">
                                                      <label for="editarCidade">Raça</label>
                                                      <input type="text" class="form-control" id="editarRaca" value="Poodle" placeholder="Raça do seu pet">
                                                      <label for="editarRua">Sexo</label>
                                                      <input type="text" class="form-control" id="editarSexo" value="Macho" placeholder="Sexo do seu pet">
                                                      <label for="editarCor">Cor</label>
                                                      <input type="text" class="form-control" id="editarCor" value="Branco" placeholder="Cor do seu pet">
                                                    </div>
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
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Nome:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Bob</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Idade:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">3 anos</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Espécie:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Cachorro</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Raça:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Poodle</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Sexo:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Macho</div>
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-4 ">
                                                <div class="font-weight-bold text-right">Cor:</div>
                                            </div>
                                            <div class="col-8">
                                                <div class="text-left">Branco</div>
                                            </div>
                                        </div>
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
    </body>
</html>
