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
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB con = new ConectionDB();

    String fol_gnkl = "", fol_remi = "", orden_compra = "", fecha = "";
    try {
        if (request.getParameter("accion").equals("buscar")) {
            fol_gnkl = request.getParameter("fol_gnkl");
            fol_remi = request.getParameter("fol_remi");
            orden_compra = request.getParameter("orden_compra");
            fecha = request.getParameter("fecha");
        }
    } catch (Exception e) {

    }
    if (fol_gnkl == null) {
        fol_gnkl = "";
        fol_remi = "";
        orden_compra = "";
        fecha = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!---->
        <title>SIE Sistema de Ingreso de Entradas</title>
    </head>
    <body>
        <div class="container">
            <h1>SIALSS</h1>
            <h4>SISTEMA INTEGRAL DE ADMINISTRACIÓN Y LOGÍSTICA PARA SERVICIOS DE SALUD</h4>
            <!--div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
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
                                    <li><a href="reimpresion.jsp">Reimpresión de Compras</a></li>
                                    <li><a href="ordenesCompra.jsp">Órdenes de Compras</a></li>
                                    <li><a href="kardexClave.jsp">Kardex Claves</a></li>
                                    <li><a href="Ubicaciones/Consultas.jsp">Ubicaciones</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Facturación<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="requerimiento.jsp">Carga de Requerimiento</a></li>
                                    <li><a href="factura.jsp">Facturación Automática</a></li>
                                     <li><a href="reimp_factura.jsp">Administrar Remisiones</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Catálogos<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="medicamento.jsp">Catálogo de Medicamento</a></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="marcas.jsp">Catálogo de Marcas</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fecha Recibo<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Entrega.jsp">Fecha de Recibo en CEDIS</a></li>     
                                    <li><a href="historialOC.jsp">Historial OC</a></li>                                  
                                </ul>
                            </li>
            <!--li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">ADASU<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="../captura.jsp">Captura de Insumos</a></li>
                    <li class="divider"></li>
                    <li><a href="../catalogo.jsp">Catálogo de Proveedores</a></li>
                    <li><a href="../reimpresion.jsp">Reimpresión de Docs</a></li>
                </ul>
            </li>
            
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href=""><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
    </div><!--/.nav-collapse >
</div>
</div-->
            <hr/>

            <div>
                <h3>Reimpresion de folios de Compras</h3>
                <h4>Seleccione el folio a imprimir</h4>

                <br />
                <div class="panel panel-primary">
                    <div class="panel-body table-responsive">
                        <table class="table table-bordered table-striped" id="datosCompras">
                            <thead>
                                <tr>
                                    <td>No. Folio</td>
                                    <td>Folio Remisión</td>
                                    <td>Orden de Compra</td>
                                    <td>Fecha</td>
                                    <td>Usuario</td>
                                    <td>Proveedor</td>
                                    <td>REP ISEM</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        con.conectar();
                                        try {
                                            ResultSet rset = con.consulta("SELECT c.F_ClaDoc, c.F_FolRemi, c.F_OrdCom, c.F_FecApl, c.F_User, p.F_NomPro FROM tb_compra c, tb_proveedor p where c.F_ProVee = p.F_ClaProve GROUP BY F_OrdCom, F_FolRemi; ");
                                            while (rset.next()) {
                                %>
                                <tr>

                                    <td><%=rset.getString(1)%></td>
                                    <td><button type="submit" class="btn btn-default btn-block" data-toggle="modal" data-target="#EditaRemision" id="<%=rset.getString(1)%>,<%=rset.getString(2)%>" onclick="ponerRemision(this.id)"><%=rset.getString(2)%></button>
                                    </td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=df3.format(df2.parse(rset.getString(4)))%></td>
                                    <td><%=rset.getString(5)%></td>
                                    <td><%=rset.getString(6)%></td>
                                    <td>
                                        <form action="reimpISEM.jsp" target="_blank">
                                            <button type="submit" class="btn btn-primary btn-block" data-toggle="modal" data-target="#Observaciones" name="accion" value="remisionCamion" id="<%=rset.getString(1)%>" onclick="ponerFolio(this.id)">Imprimir</button>
                                            <input class="hidden" name="fol_gnkl" value="<%=rset.getString(1)%>">
                                            <!--button class="btn btn-block btn-primary">Imprimir</button-->
                                        </form>
                                    </td>
                                </tr>
                                <%
                                            }
                                        } catch (Exception e) {

                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <div class="navbar navbar-fixed-bottom navbar-inverse">
            <div class="text-center text-muted">
                GNK Logística || Desarrollo de Aplicaciones 2009 - 2014 <span class="glyphicon glyphicon-registration-mark"></span><br />
                Todos los Derechos Reservados
            </div>
        </div>



        <!--
               Modal
        -->
        <div class="modal fade" id="Observaciones" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="reimpISEM.jsp" target="_blank">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <input name="idCom" id="idCom" class="hidden" />
                            <h4 class="modal-title" id="myModalLabel">Fecha de Recepción</h4>
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="date" name="fecRecepcion" id="fecRecepcion" class="form-control" />
                                </div>
                            </div>

                            <h4 class="modal-title" id="myModalLabel">Fecha de Revisión</h4>
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="date" name="fecRevision" id="fecRevision" class="form-control" />
                                </div>
                            </div>
                            <div style="display: none;" class="text-center" id="Loader">
                                <img src="imagenes/ajax-loader-1.gif" height="150" />
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" onclick="return validaRemision();" name="accion" value="actualizarCB">Imprimir</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--
        /Modal
        -->
    </body>
</html>


<!-- 
================================================== -->
<!-- Se coloca al final del documento para que cargue mas rapido -->
<!-- Se debe de seguir ese orden al momento de llamar los JS -->
<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script>
                                    $(document).ready(function() {
                                        $('#datosCompras').dataTable();
                                    });
</script>
<script>
    $(function() {
        $("#fecha").datepicker();
        $("#fecha").datepicker('option', {dateFormat: 'dd/mm/yy'});
    });

    function ponerFolio(id) {
        document.getElementById('idCom').value = id;
        document.getElementById('idCom').value = id;
    }


    function ponerRemision(id) {
        var elem = id.split(',');
        document.getElementById('idRem').value = elem[0];
        document.getElementById('remiIncorrecta').value = elem[1];
    }

    function validaRemision() {
        var fr = document.getElementById('fecRecepcion').value;
        var fs = document.getElementById('fecRevision').value;

        if (fr === "" || fs === "") {
            alert('Ingrese todas los datos')
            return false;
        } 
    }

    function validaContra(elemento) {
        //alert(elemento);
        var pass = document.getElementById(elemento).value;
        //alert(pass);
        if (pass === "GnKlTolu2014") {
            document.getElementById('actualizaRemi').disabled = false;
        } else {
            document.getElementById('actualizaRemi').disabled = true;
        }
    }
</script>