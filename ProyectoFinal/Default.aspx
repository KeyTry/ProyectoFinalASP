<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProyectoFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- CSS Global -->
    <link media="all" type="text/css" rel="stylesheet" href="js\bootstrap\css\bootstrap.min.css">

   

    <link media="all" type="text/css" rel="stylesheet" href="js\owl-carousel2\assets\owl.carousel.min.css">

    <link media="all" type="text/css" rel="stylesheet" href="js\owl-carousel2\assets\owl.theme.default.min.css">

    <link media="all" type="text/css" rel="stylesheet" href="js\swiper\css\swiper.min.css">

    <link media="all" type="text/css" rel="stylesheet" href="js\css\megamenu.min.css">

    

    
    <!-- Theme CSS -->
    <link media="all" type="text/css" rel="stylesheet" href="js\css\style.min.css">

    <link media="all" type="text/css" rel="stylesheet" href="js\css\theme.min.css">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
    <section id="offers" class="page-section">
                <div class="container">
                    <h1 class="text-center">Motos Acme</h1>
                    <h2 class="section-title wow fadeInUp" data-wow-offset="70" data-wow-delay="100ms">
                        <small>Agregue Motos a su carrito de compras</small>
                        <span>Categorías</span>
                    </h2>

                    <div class="tabs wow fadeInUp" data-wow-offset="70" data-wow-delay="300ms">
                       <%-- <ul id="tabs" class="nav">
                            
                                                            <li class=""><a OnServerClick="Cambiar" id="liCuadras">Cuadraciclos</a></li>
                                
                                                            <li class="active" id="liMontanneras" runat="server"><a>Montañeras</a></li>
                                                        
                                                            <li class="" id="liScooter" runat="server"><a href="index-7.html?class=3&amp;type%5B0%5D=12">Scooters</a></li>

                                                            <li class="" id="liPandilleras" runat="server"><a href="index-7.html?class=3&amp;type%5B0%5D=12">Pandilleras</a></li>
                                                    </ul>--%>
                         <div class="text-center">
                        <p>
                            <asp:Button ID="btnCuadras" class="btn btn-theme btn-theme-xs" runat="server" OnClick="btnCuadras_Click" Text="Cuadraciclos" />
                            <asp:Button ID="btnMontanneras" class="btn btn-theme btn-theme-xs" runat="server" OnClick="btnMontanneras_Click" Text="Montañeras" />
                            <asp:Button ID="btnScooters" class="btn btn-theme btn-theme-xs" runat="server" OnClick="btnScooters_Click" Text="Scooters" />
                            <asp:Button ID="btnPandilleras" class="btn btn-theme btn-theme-xs" runat="server" OnClick="btnPandilleras_Click" Text="Pandilleras" />
                        </p>                        
                    </div>

                    </div>

                    <div class="tab-content wow fadeInUp" data-wow-offset="70" data-wow-delay="500ms">
                        <!-- tab 1 -->
                        <div class="tab-pane fade" id="tab-1">
            </div>                        <!-- tab 2 -->
                        <div class="tab-pane fade active in" id="tab-2">
    <!--<div class="btn-toolbar text-center" role="toolbar" aria-label="Toolbar with button groups"> 
        <div role="group" aria-label="First group"> 
                        <a class="btn btn-danger btn-sm" href="index-2.html?type%5B0%5D=4&amp;class=1">Deportivas</a> 
            
                        <a class="btn btn-default btn-sm" href="index-3.html?type%5B0%5D=5&amp;class=1">Doble Propósito</a> 
            
                        <a class="btn btn-default btn-sm" href="index-4.html?type%5B0%5D=6&amp;class=1">Scooters</a> 
            
                        <a class="btn btn-default btn-sm" href="index-9.html?type%5B0%5D=7&amp;class=1">Media Cilindrada</a> 
            
                        <a class="btn btn-default btn-sm" href="index-5.html?type%5B0%5D=8&amp;class=1">Alta Cilindrada</a> 
            
                        <a class="btn btn-default btn-sm" href="index-10.html?type%5B0%5D=9&amp;class=1">Especiales</a> 
                    </div>  
    </div>     -->
       

        <!-- If we need navigation buttons -->

    </div>
    <div class="swiper swiper--mulas"  runat="server" id="Montanneras">
        <div class="swiper-container">
            &nbsp;
            <div class="swiper-wrapper">
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img1" src="img/models/cb190-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo1" class="caption-title"><a href="#">CB 190R</a></h4>
                            <div runat="server" id="precio1">&cent; 3192000</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar1" OnClick="agregarACarritoCompra" CommandArgument="CB 190R" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo1" data-toggle="tooltip" title="Año del modelo">2017</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor1" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros1" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img2" src="img/models/cb190-rp-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo2" class="caption-title"><a href="#">CB 190R Repsol</a></h4>
                            <div runat="server" id="precio2">&cent; 3528000</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar2" OnClick="agregarACarritoCompra" CommandArgument="CB 190R Repsol" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo2" data-toggle="tooltip" title="Año del modelo">2017</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor2" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros2" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                 <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img3" src="img/models/cb1-sport-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo3" class="caption-title"><a href="#">CB1 Sport</a></h4>
                            <div runat="server" id="precio3">&cent; 1671600</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar3" OnClick="agregarACarritoCompra" CommandArgument="CB1 Sport" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo3" data-toggle="tooltip" title="Año del modelo">2017</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor3" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros3" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img4" src="img/models/cb1-tuf-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo4" class="caption-title"><a href="#">CB1 TUF Plus</a></h4>
                            <div runat="server" id="precio4">&cent; 1722000</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar4" OnClick="agregarACarritoCompra" CommandArgument="CB1 TUF Plus" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo4" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor4" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros4" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img5" src="img/models/cb160-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo5" class="caption-title"><a href="#">CBF160F</a></h4>
                            <div runat="server" id="precio5">&cent; 2604000</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar5"  OnClick="agregarACarritoCompra" CommandArgument="CBF160F" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo5" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor5" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros5" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img6" src="img/models/cgl125-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo6" class="caption-title"><a href="#">CGL 125</a></h4>
                            <div runat="server" id="precio6">&cent; 1562400</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar6" OnClick="agregarACarritoCompra" CommandArgument="CGL 125" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo6" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor6" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros6" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img7" src="img/models/gl150-cargo-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo7" class="caption-title"><a href="#">GL 150 Cargo</a></h4>
                            <div runat="server" id="precio7">&cent; 2301600</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar7" OnClick="agregarACarritoCompra" CommandArgument="GL 150 Cargo" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo7" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor7" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros7" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img8" src="img/models/gl150-ws-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo8" class="caption-title"><a href="#">GL 150 WS</a></h4>
                            <div runat="server" id="precio8">&cent; 2293200</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar8" OnClick="agregarACarritoCompra" CommandArgument="GL 150 WS" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo8" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor8" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros8" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
               <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img9" src="img/models/shadow150-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo9" class="caption-title"><a href="#">Shadow 150</a></h4>
                            <div runat="server" id="precio9">&cent; 2175600</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar9" OnClick="agregarACarritoCompra" CommandArgument="Shadow 150" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo9" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor9" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros9" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                                <!-- Slides -->
                <div runat="server" class="swiper-slide">
                    <div runat="server" class="thumbnail no-border no-padding thumbnail-car-card">
                                                <div runat="server" class="media">
                            <a runat="server" class="">
                                <img runat="server" id="img10" src="img/models/unicorn160-sm.jpg" alt="">
                                
                            </a>
                        </div>
                                                <div runat="server" class="caption text-center">
                            <h4 runat="server" id="modelo10" class="caption-title"><a href="#">Unicorn 160</a></h4>
                            <div runat="server" id="precio10">&cent; 2175600</div>
                            <div runat="server" class="buttons">
                                <asp:Button runat="server" ID="btnComprar10" OnClick="agregarACarritoCompra" CommandArgument="Unicorn 160" class="btn btn-theme btn-theme-xs" Text="Comprar" />
                            </div>
                            <table class="table">
            <tr>
                <td runat="server" style="vertical-align: middle;"><i runat="server" class="fa fa-motorcycle"></i> <span runat="server" id="annoModelo10" data-toggle="tooltip" title="Año del modelo">2018</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="tipoMotor10" data-toggle="tooltip" title="Tipo Motor">4 Tiempos</span></td>
                                    <td runat="server" style="vertical-align: middle;"><i class="fa fa-cogs"></i> <span runat="server" id="cantCilindros10" data-toggle="tooltip" title="Cantidad Cilindros">1</span></td>
                                    <td style="vertical-align: middle;"><img src="img\logo_honda_sm.jpg" class="img-responsive center-block" alt="Honda"></td>
            </tr>
        </table>
    
                        </div>
                    </div>
                </div>
                
            </div>

        </div>

        <!-- SLIDERS END -->
        

    </div>
       
    </div>
</div>                        <!-- tab 3 -->
                        <div class="tab-pane fade" id="tab-3">
           
    </div>                    <br>
                    <div class="text-center">
                        <p>
                            <button type="button" class="btn btn-theme btn-theme-xs btn-prev">Anterior</button>
                            <button type="button" class="btn btn-theme btn-theme-xs btn-next">Siguiente</button>
                        </p>                        
                    </div>
                </section>
    <script src="js\jquery\jquery-1.11.1.min.js"></script>

    <script src="js\bootstrap\js\bootstrap.min.js"></script>

    
    <script src="js\owl-carousel2\owl.carousel.min.js"></script>

    <script src="js\retina.min.js"></script>

    <script src="js\functions.js"></script>

    <script src="js\swiper\js\swiper.jquery.min.js"></script>

    
    <script src="js\theme.min.js"></script>

</asp:Content>
