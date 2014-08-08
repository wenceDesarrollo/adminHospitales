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
<%java.text.DateFormat df1 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%

    DecimalFormat formatter = new DecimalFormat("#,###,###");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator('.');
    custom.setGroupingSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("Usuario") != null) {
        usua = (String) sesion.getAttribute("Usuario");
    } else {
        //response.sendRedirect("indexIsem.jsp");
    }
    ConectionDB_SAA con = new ConectionDB_SAA();
    String NoCompra = "", Fecha = "";

    try {
        Fecha = request.getParameter("Fecha");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    if (Fecha == null) {
        Fecha = "";
    }
    try {
        NoCompra = request.getParameter("NoCompra");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    if (Fecha == null) {
        NoCompra = "";
    }

    String claPro = "", desPro = "";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!---->
        <title>SIALSS</title>
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
                                    <li><a href="factura.jsp">Ingresos en Almac&eacute;n</a></li>
                                    <li><a href="entregas.jsp">Entrega a Proveedores</a></li>
                                    <li><a href="exist.jsp">Existencias en CEDIS</a></li>
                                    <li><a href="historialOC.jsp">Historial OC</a></li>
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
                                    <li><a href="captura.jsp">Captura de Insumos</a></li>
                                    <li class="divider"></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="reimpresion.jsp">Reimpresión de Docs</a></li>
                                </ul>
                            </li-->
                           
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href=""><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
                            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>

            <form method="post" action="ordenesCompra.jsp">
                <div class="row">
                    <label class="col-sm-1">
                        <h4>Proveedor</h4>
                    </label>
                    <div class="col-sm-6">
                        <select class="form-control" name="Proveedor" id="Proveedor" onchange="SelectProve(this.form);
                                document.getElementById('Fecha').focus()">
                            <option value="">--Proveedor--</option>
                            <%
                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select F_ClaProve, F_NomPro from tb_proveedor p, tb_pedidoisem o where p.F_ClaProve = o.F_Provee group by o.F_Provee order by F_NomPro");
                                    while (rset.next()) {
                            %>
                            <option value="<%=rset.getString(1)%>" ><%=rset.getString(2)%></option>
                            <%
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                }
                            %>

                        </select>
                    </div>

                    <label class="col-sm-3">
                        <h4>Fecha de Entrega a GNKL:</h4>
                    </label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" data-date-format="dd/mm/yyyy" id="Fecha" name="Fecha" value="" onchange="document.getElementById('Hora').focus()" />
                    </div>
                </div>
                <br/>
                <div class="row">
                    <label class="col-sm-1">
                        <h4>Usuario:</h4>
                    </label>
                    <div class="col-sm-6">
                        <select class="form-control" name="Usuario" id="Usuario" onchange="">
                            <option value="">--Usuarios--</option>
                            <%
                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select u.F_IdUsu, u.F_Usuario from tb_usuariosisem u, tb_pedidoisem p where F_Usuario !='root' and u.F_IdUsu = p.F_IdUsu group by F_IdUsu");
                                    while (rset.next()) {
                            %>
                            <option value="<%=rset.getString(1)%>" ><%=rset.getString(2)%></option>
                            <%
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                }
                            %>

                        </select>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-sm-12">
                        <button class="btn btn-primary btn-block" name="accion" value="fecha">Buscar</button>
                    </div>
                </div>
            </form>
        </div>
        <br/>
        <div class="row" style="width: 90%; margin: auto;">
            <div class="col-sm-6">
                <form method="post">
                    <input value="<%=Fecha%>" name="Fecha" class="hidden"/>
                    <input value="<%=request.getParameter("Usuario")%>" name="Usuario"  class="hidden"/>
                    <input value="<%=request.getParameter("Proveedor")%>" name="Proveedor"  class="hidden"/>
                    <label class="col-sm-12">
                        <h4>Órdenes de Compra: </h4>
                    </label>
                    <table class="table table-bordered table-condensed table-striped" id="datosCompras">
                        <thead>
                            <tr>
                                <td>No. Orden</td>
                                <td>Capturó</td>
                                <td>Proveedor</td>
                                <td>Fecha Entrega</td>
                                <td>Hora entrega</td>
                                <td>Ver</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String fecha = "";
                                try {
                                    fecha = df1.format(df2.parse(Fecha));
                                } catch (Exception e) {

                                }
                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select o.F_NoCompra, u.F_Usuario, p.F_NomPro,DATE_FORMAT(o.F_FecSur, '%d/%m/%Y') F_FecSur, F_HorSur, F_Fecha from tb_pedidoisem o, tb_proveedor p, tb_usuariosisem u where u.F_IdUsu = o.F_IdUsu and  o.F_Provee = p.F_ClaProve and o.F_FecSur like  '%" + fecha + "%' and o.F_IdUsu like '%" + request.getParameter("Usuario") + "' and o.F_Provee like '%" + request.getParameter("Proveedor") + "' group by o.F_NoCompra");
                                    while (rset.next()) {
                            %>
                            <tr>
                                <td><%=rset.getString(1)%></td>
                                <td><%=rset.getString(2)%></td>
                                <td><%=rset.getString(3)%></td>
                                <td><%=rset.getString(4)%></td>
                                <td><%=rset.getString(5)%></td>
                                <td>
                                    <button class="btn btn-success text-center" name="NoCompra" value="<%=rset.getString(1)%>"><span class="glyphicon glyphicon-search"></span></button>
                                </td>
                            </tr>
                            <%
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
                            %>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <%                try {
                                con.conectar();
                                ResultSet rset = con.consulta("select o.F_NoCompra, p.F_NomPro, DATE_FORMAT(o.F_FecSur, '%d/%m/%Y'), F_HorSur, F_Usuario, F_StsPed from tb_pedidoisem o, tb_proveedor p, tb_usuariosisem u where u.F_IdUsu = o.F_IdUsu and  o.F_Provee = p.F_ClaProve and F_NoCompra = '" + NoCompra + "'  group by o.F_NoCompra");
                                while (rset.next()) {
                        %>
                        <div class="row">
                            <div class="col-sm-2">
                                <h4>
                                    Orden: <%=NoCompra%>
                                </h4>
                            </div>
                            <!--div class="col-sm-1 col-sm-offset-9">
                                <a class="btn btn-default" target="_blank" href="imprimeOrdenCompra.jsp?ordenCompra=<%=NoCompra%>"><span class="glyphicon glyphicon-print"></span></a>
                            </div-->
                        </div>
                        <div class="panel-body">
                            <form name="FormBusca" action="CapturaPedidos" method="post">
                                <div class="row">
                                    <h4 class="col-sm-3">Orden No. </h4>
                                    <div class="col-sm-3">
                                        <input class="form-control" value="<%=rset.getString(1)%>" name="NoCompra" id="NoCompra" readonly="" />
                                    </div>
                                    <h4 class="col-sm-3">Capturó: </h4>
                                    <div class="col-sm-3">
                                        <input class="form-control" value="<%=rset.getString("F_Usuario")%>" readonly="" />
                                    </div>

                                </div>
                                <%
                                    System.out.println("###" + rset.getString("F_StsPed"));
                                    if (rset.getString("F_StsPed").equals("2")) {
                                %>
                                <h4 class="text-danger">FOLIO CANCELADO</h4>
                                <%
                                    }
                                %>
                                <div class="row">
                                    <h4 class="col-sm-3">Proveedor: </h4>
                                    <div class="col-sm-9">
                                        <input class="form-control" value="<%=rset.getString(2)%>" readonly="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <h4 class="col-sm-3">Fecha de Entrega: </h4>
                                    <div class="col-sm-3">
                                        <input class="form-control" value="<%=rset.getString(3)%>" readonly="" />
                                    </div>
                                    <h4 class="col-sm-3">Hora de Entrega: </h4>
                                    <div class="col-sm-3">
                                        <input class="form-control" value="<%=rset.getString(4)%>" readonly="" />
                                    </div>
                                </div>
                                <%

                                    if (rset.getString("F_StsPed").equals("2")) {
                                        ResultSet rset2 = con.consulta("select F_Observaciones from tb_obscancela where F_NoCompra = '" + NoCompra + "' ");
                                        while (rset2.next()) {
                                %>
                                <br/>
                                <textarea class="form-control" name="Observa" id="Observa" readonly=""><%=rset2.getString(1)%></textarea>
                                <br>
                                <%
                                        }
                                    }
                                %>

                                <br/>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                %>
                            </form>
                            <div class="row">
                                <br/>
                                <table class="table table-bordered table-condensed table-striped">
                                    <tr>
                                        <td><strong>Clave</strong></td>
                                        <td><strong>Descripción</strong></td>
                                        <!--td><strong>Lote</strong></td>
                                        <td><strong>Caducidad</strong></td-->
                                        <td><strong>Cantidad</strong></td>
                                    </tr>
                                    <%
                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("select s.F_Clave, m.F_DesPro, s.F_Lote, DATE_FORMAT(F_Cadu, '%d/%m/%Y'), s.F_Cant, F_IdIsem from tb_pedidoisem s, tb_medica m where s.F_Clave = m.F_ClaPro and F_NoCompra = '" + NoCompra + "' ");
                                            while (rset.next()) {
                                    %>
                                    <tr>
                                        <td><%=rset.getString(1)%></td>
                                        <td><%=rset.getString(2)%></td>
                                        <!--td><%=rset.getString(3)%></td>
                                        <td><%=rset.getString(4)%></td-->
                                        <td><%=formatter.format(rset.getInt(5))%></td>
                                    </tr>
                                    <%
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %>

                                </table>
                            </div>
                        </div>
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
    <!-- 
    ================================================== -->
    <!-- Se coloca al final del documento para que cargue mas rapido -->
    <!-- Se debe de seguir ese orden al momento de llamar los JS -->
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/dataTables.bootstrap.js"></script>
    <script>
                            $(document).ready(function() {
                                $('#datosCompras').dataTable();
                            });

                            $(function() {
                                $("#Fecha").datepicker();
                                $("#Fecha").datepicker('option', {dateFormat: 'dd/mm/yy'});
                            });
    </script>
</html>

