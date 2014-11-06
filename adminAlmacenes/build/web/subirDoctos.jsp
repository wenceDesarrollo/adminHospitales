<%-- 
    Document   : index
    Created on : 17/02/2014, 03:34:46 PM
    Author     : Americo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.*" %>
<!DOCTYPE html>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%

    HttpSession sesion = request.getSession();
    String usua = "", tipo = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
        tipo = (String) sesion.getAttribute("Tipo");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB_SAA con = new ConectionDB_SAA();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <!---->
        <title>SIALSS</title>
    </head>
    <body>
        <div class="container">
            <h1>SIALSS</h1>
            <h4>Módulo - Sistema de Administración de Almacenes (SAA)</h4>
            <!--div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span clss="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="main_menu.jsp">Inicio</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Entradas<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="captura.jsp">Entrada Manual</a></li>
                                    <li><a href="compraAuto2.jsp">Entrada Automática OC ISEM</a></li>
            <%
                if (tipo.equals("2") || tipo.equals("3")) {
            %>
        <li><a href="verificarCompraAuto.jsp">Verificar OC</a></li>
            <%
                }
            %>
        <li><a href="#" onclick="window.open('reimpresion.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Reimpresión de Compras</a></li>
        <li><a href="#"  onclick="window.open('ordenesCompra.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Órdenes de Compras</a></li>
        <li><a href="#"  onclick="window.open('kardexClave.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Kardex Claves</a></li>
        <li><a href="#"  onclick="window.open('Ubicaciones/Consultas.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Ubicaciones</a></li>
    </ul>
</li>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Facturación<b class="caret"></b></a>
    <ul class="dropdown-menu">
        <li><a href="requerimiento.jsp">Carga de Requerimiento</a></li>
        <li><a href="factura.jsp">Facturación Automática</a></li>
        <li><a href="reimp_factura.jsp">Reimpresión de Facturas</a></li>
    </ul>
</li>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Catálogos<b class="caret"></b></a>
    <ul class="dropdown-menu">
        <li><a href="#" onclick="window.open('medicamento.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Catálogo de Medicamento</a></li>
        <li><a href="#" onclick="window.open('catalogo.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Catálogo de Proveedores</a></li>
        <li><a href="#" onclick="window.open('marcas.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Catálogo de Marcas</a></li>
    </ul>
</li>
<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fecha Recibo<b class="caret"></b></a>
    <ul class="dropdown-menu">
        <li><a href="#" onclick="window.open('Entrega.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Fecha de Recibo en CEDIS</a></li> 
        <li><a href="#" onclick="window.open('historialOC.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')">Historial OC</a></li>                                      
    </ul>
</li>
            <!--li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">ADASU<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="captura.jsp">Captura de Insumos</a></li>
                    <li class="divider"></li>
                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                    <li><a href="reimpresion.jsp">Reimpresión de Docs</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
    </div--><!--/.nav-collapse >
</div>
</div-->
            <hr/>
            <h2>Cargar Imagenes de Orden de Compra</h2>
            <form method="post" class="marco"  action="FileUploadServlet" enctype="multipart/form-data" name="form1" id="form1"> 
                <div class="container">
                    
                    <div class="">
                        <select class="form-control" name="OC" id="OC">
                            <option value="">-Seleccione la OC-</option>
                            <%
                            try{
                                con.conectar();
                                ResultSet rset = con.consulta("select o.F_NoCompra, p.F_NomPro from tb_pedidoisem o, tb_proveedor p where o.F_Provee = p.F_ClaProve and F_StsPed !='2' and F_Recibido=0  group by o.F_NoCompra");
                                while(rset.next()){
                                    %>
                                    <option value="<%=rset.getString(1)%>"><%=rset.getString(2)%> - <%=rset.getString(1)%></option>
                                    <%
                                }
                                con.cierraConexion();
                            }catch(Exception e){
                                
                            }
                            %>
                        </select>
                    </div>
                    <br/>
                    <div class="row">
                        <table class="table table-bordered table-striped">
                            <tbody>
                                <tr>
                                    <th>Foto 1</th><td><input type="file" name="file1" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 2</th><td><input type="file" name="file2" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 3</th><td><input type="file" name="file3" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 4</th><td><input type="file" name="file4" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 5</th><td><input type="file" name="file5" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 6</th><td><input type="file" name="file6" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 7</th><td><input type="file" name="file7" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <th>Foto 8</th><td><input type="file" name="file8" accept=".JPG"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><a data-toggle="modal" href="#myModal" class="btn btn-block btn-primary" onclick="form1.submit();">CARGAR IMAGENES</a><!--button class="btn btn-block btn-primary" type="submit" onclick="location.href = 'cargaFotosCensos.jsp#myModal'" id="botonCarga">CARGAR IMAGENES</button--></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
        <br><br><br>
        <div class="navbar navbar-fixed-bottom navbar-inverse">
            <div class="text-center text-muted">
                GNK Logística || Desarrollo de Aplicaciones 2009 - 2014 <span class="glyphicon glyphicon-registration-mark"></span><br />
                Todos los Derechos Reservados
            </div>
        </div>


        <!-- 
             fin Mensaje de Acerca de...
        -->                            
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Carga de Imagenes</h4>
                    </div>
                    <div class="modal-body">
                        <form name="form_com" method="post" id="form_com">
                            <img src='imagenes/ajax-loader-1.gif' width='15px' height='15px' align='center' />
                            Se están subiendo las imágenes, por favor espere...
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
    <!-- 
    ================================================== -->
    <!-- Se coloca al final del documento para que cargue mas rapido -->
    <!-- Se debe de seguir ese orden al momento de llamar los JS -->
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <script>
        function subidaFotos(){
            var OC = document.getElementById('OC').value;
            id (OC===""){
                alert('Favor de seleccionar la Orden de Compra');
                return false();
            }
            return confirm('Seguro de Cargar las imagenes?');
            form1.submit();
        }
    </script>
                
</html>

