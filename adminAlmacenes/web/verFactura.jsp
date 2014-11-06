<%-- 
    Document   : index
    Created on : 17/02/2014, 03:34:46 PM
    Author     : Americo
--%>

<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.*" %>
<!DOCTYPE html>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###,###");
    DecimalFormat formatterDecimal = new DecimalFormat("#,###,##0.00");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator('.');
    custom.setGroupingSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    formatterDecimal.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB_LermaServer con = new ConectionDB_LermaServer();

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
            <div class="navbar navbar-default">
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men&uacute; de Opciones <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="indexMain.jsp">Men&uacute; Principal</a></li>
                                    <li><a href="factura.jsp">Ingresos en Almac&eacute;n</a></li>
                                    <li><a href="entregas.jsp">Entrega a Proveedores</a></li>
                                    <li><a href="exist.jsp">Existencias en CEDIS</a></li>
                                    <li><a href="historialOC.jsp">Historial OC</a></li>
                                    <!--li><a href="rep.jsp">Reporteador</a></li>
                                    <!--li><a href="requerimiento.jsp">Carga de Requerimiento</a></li>
                                    <li class="divider"></li>
                                    <li><a href="medicamento.jsp">Catálogo de Medicamento</a></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="marcas.jsp">Catálogo de Marcas</a></li>
                                    <li><a href="reimpresion.jsp">Reimpresión de Compras</a></li>
                                    <li><a href="reimp_factura.jsp">Reimpresión de Facturas</a></li>
                                    <li class="divider"></li>
                                    <li><a href="http://192.168.2.170:8081/UbicacionesConsolidado" target="_blank">Ubicaciones</a></li-->
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
                            </li-->
                            <%
                                if (usua.equals("root")) {
                            %>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuario<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="usuarios/usuario_nuevo.jsp">Nuevo Usuario</a></li>
                                    <li><a href="usuarios/edita_usuario.jsp">Edicion de Usuarios</a></li>
                                </ul>
                            </li>
                            <%                                }
                            %>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href=""><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
                            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>

            <div>
                <h3>Ver Facturas</h3>
                <h4>Folio de Factura: <%=request.getParameter("fol_gnkl")%></h4>
                <%
                    try {
                        con.conectar();
                        try {
                            ResultSet rset = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,DATE_FORMAT(F_FecCad,'%d/%m/%Y') AS F_FecCad,F_CantReq,F_CantSur,F_Costo,F_Iva,F_Monto, F_Ubicacion FROM facturas WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "' GROUP BY F_NomCli");
                            while (rset.next()) {
                %>
                <h4>Cliente: <%=rset.getString(1)%></h4>
                <h4>Fecha de Entrega: <%=rset.getString(2)%></h4>
                <h4>Factura: <%=rset.getString(3)%></h4><%
                    int req = 0, sur = 0;
                    Double imp = 0.0;
                    ResultSet rset2 = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,DATE_FORMAT(F_FecCad,'%d/%m/%Y') AS F_FecCad,F_CantReq,F_CantSur,F_Costo,F_Iva,F_Monto, F_Ubicacion FROM facturas WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "'");
                    while (rset2.next()) {
                        req = req + rset2.getInt("F_CantReq");
                        sur = sur + rset2.getInt("F_CantSur");
                        imp = imp + rset2.getDouble("F_Monto");
                        System.out.println(req);
                    }
                %>

                <div class="row">
                    <h5 class="col-sm-3">Total Solicitado: <%=formatter.format(req)%></h5>
                    <h5 class="col-sm-3">Total Surtido: <%=formatter.format(sur)%></h5>
                    <h5 class="col-sm-3">Total Importe: $ <%=formatterDecimal.format(imp)%></h5>
                </div>
                <%
                            }

                        } catch (Exception e) {

                        }
                        con.cierraConexion();
                    } catch (Exception e) {

                    }
                %>
                <div class="text-right">
                    <a href="entregas.jsp" class="btn btn-default">Regresar</a>
                </div>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-condensed" id="datosCompras">
                            <thead>
                                <tr>
                                    <td>Clave</td>
                                    <td>Lote</td>
                                    <td>Caducidad</td>
                                    <td>Req.</td>
                                    <td>Ent.</td>
                                    <td>Costo U</td>
                                    <td>IVA</td>
                                    <td>Importe</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        con.conectar();
                                        try {
                                            ResultSet rset = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,F_FecCad,SUM(F_CantReq),SUM(F_CantSur),F_Costo,F_Iva,sum(F_Monto), F_Ubicacion FROM facturas  WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "' GROUP BY F_ClaPro");
                                            while (rset.next()) {
                                %>
                                <tr>
                                    <td><a href="#" data-toggle="tooltip" data-placement="bottom" title="<%=rset.getString(5)%>"><%=rset.getString(4)%></a></td>
                                    <td><%=rset.getString(6)%></td>
                                    <td><%=rset.getString(7)%></td>
                                    <td><%=formatterDecimal.format(rset.getInt(8))%></td>
                                    <td><%=formatterDecimal.format(rset.getInt(9))%></td>
                                    <td>$ <%=formatterDecimal.format(rset.getDouble(10))%></td>
                                    <td>$ <%=formatterDecimal.format(rset.getDouble(11))%></td>
                                    <td>$ <%=formatterDecimal.format(rset.getDouble(12))%></td>
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
    $(function() {
        $(document).tooltip();
    });
    $(document).ready(function() {
        $('#datosCompras').dataTable();
    });
</script>
<script>
    $(function() {
        $("#fecha").datepicker();
        $("#fecha").datepicker('option', {dateFormat: 'dd/mm/yy'});
    });
</script>