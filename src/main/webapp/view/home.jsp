<%-- 
    Document   : home
    Created on : 06/04/2019, 22:49:14
    Author     : Leona
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/jspf/head.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/header.jspf"%>
        
        <main class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="container border"><!-- Sidebar -->
                            <div class="row">
                            <div class="col-sm-12 py-3 ">
                                <img src="../img/testePerfil.jpg" alt="avatar" class="md-avatar rounded-circle">
                            </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-sm-8 mb-5">
                        <div class="container border py-2"><!-- Principal -->
                            <div class="row"><!-- Header da postagem -->
                                <div class="col-sm-4 d-flex align-items-center">
                                    <img src="../img/testePerfil.jpg" alt="avatar" class="md-avatar size-3 rounded-circle">
                                    <p class="pl-2">Nome Sobrenome</p>
                                </div>
                                <div class="col-sm-2 d-flex flex-column py-4">
                                    <span class=" text-center">Nome</span>
                                    <span class=" text-center">Espécie Raça</span>
                                    <span class=" text-center">Sexo</span>
                                </div>
                                <div class="col-sm-2 d-flex flex-column py-4">
                                    <span class=" text-center">Cor</span>
                                    <span class=" text-center">Idade</span>
                                </div>
                                <div class="col-sm-4 d-flex flex-column py-4">
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
                                            <img src="../img/testeCarrossel.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="../img/testeCarrossel.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="../img/testeCarrossel.jpg" class="d-block w-100" alt="...">
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
        
        <%@include file="../WEB-INF/jspf/bootstrapBody.jspf"%>
    </body>
</html>
