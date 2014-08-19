<%-- 
    Document   : index
    Created on : 17/02/2014, 03:34:46 PM
    Author     : Americo
--%>

<%@page import="java.text.*"%>
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
    ConectionDB_SAA con = new ConectionDB_SAA();

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

    String Cliente = "", fecEnt = "";
    try {
        Cliente = request.getParameter("Cliente");
    } catch (Exception e) {

    }
    if (Cliente == null) {
        Cliente = "";
    }
    try {
        fecEnt = request.getParameter("Fecha");
        fecEnt = df2.format(df3.parse(fecEnt));
    } catch (Exception e) {

    }
    if (fecEnt == null) {
        fecEnt = "";
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
                        <a class="navbar-brand" href="indexMain.jsp">Inicio</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men&uacute; de Opciones <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="indexMain.jsp">Men&uacute; Principal</a></li>
                                    <li><a href="entregas.jsp">Entrega a Proveedores</a></li>
                                    <li><a href="exist.jsp">Existencias en CEDIS</a></li>
                                    <li><a href="Entrega.jsp">Fecha de Recibo en CEDIS</a></li>
                                    <li><a href="historialOC.jsp">Historial OC</a></li>
                                    <li><a href="factura.jsp">Ingresos en Almac&eacute;n</a></li>
                                    <li><a href="ordenesCompra.jsp">Órdenes de Compra</a></li>
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
                <h3>Reimpresion de Remisiones</h3>
                <h4>Seleccione el folio a imprimir</h4>
                <div class="row">
                    <form action="entregas.jsp" method="post">
                        <h4 class="col-sm-2">Cliente</h4>
                        <div class="col-sm-5">
                            <select class="form-control" name="Cliente" id="Cliente" onchange="this.form.submit();">
                                <option value="">--Cliente--</option>
                                <%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("select F_ClaCli, F_NomCli from tb_uniatn order by F_ClaCli");
                                        while (rset.next()) {
                                %>
                                <option value="<%=rset.getString(2)%>"
                                        <%
                                            if (Cliente.equals(rset.getString(2))) {
                                                out.println("selected");
                                            }
                                        %>
                                        ><%=rset.getString(1)%> - <%=rset.getString(2)%></option>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                        System.out.println(e.getMessage());
                                    }
                                %>

                            </select>
                        </div>
                        <h4 class="col-sm-1">Fecha</h4>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" data-date-format="dd/mm/yyyy" id="Fecha" name="Fecha" readonly value="<%=fecEnt%>" onchange="this.form.submit();" />
                        </div>
                        <a class="btn btn-primary" href="entregas.jsp">Todo</a>
                    </form>
                </div>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped" id="datosCompras">
                            <thead>
                                <tr>
                                    <td>No. Folio</td>
                                    <td>Clave del Cliente</td>
                                    <td>Fecha</td>
                                    <td>Importe</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try {
                                        con.conectar();
                                        try {
                                            ResultSet rset = con.consulta("SELECT F_ClaDoc, F_NomCli, DATE_FORMAT(F_FecEnt, '%d/%m/%Y') AS F_FecEnt, SUM(F_Monto) AS F_Costo FROM tb_facturavista WHERE F_NomCli like '%" + Cliente + "%' AND F_FecEnt like '%" + fecEnt + "%' GROUP BY F_ClaDoc ORDER BY F_ClaDoc+0;");
                                            while (rset.next()) {
                                %>
                                <tr>

                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(2)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td>
                                        <form action="verFactura.jsp" method="post">
                                            <input class="hidden" name="fol_gnkl" value="<%=rset.getString(1)%>">
                                            <button class="btn btn-block btn-primary">Ver Factura</button>
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
        $("#Fecha").datepicker();
        $("#Fecha").datepicker('option', {dateFormat: 'dd/mm/yy'});
    });
</script>