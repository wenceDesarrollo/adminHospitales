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
    String usua = "",obs="",producto="";
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
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">
        <!---->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                                <td><strong>Observación</strong></td>
                            </tr>
                            <%
                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("SELECT I.F_Clave,M.F_DesPro, I.F_Lote, DATE_FORMAT(I.F_Cadu, '%d/%m/%Y'), I.F_Cant, I.F_IdIsem FROM tb_pedidoisem I INNER JOIN tb_medica M ON I.F_Clave=M.F_ClaPro WHERE I.F_NoCompra='" + NoCompra + "' GROUP BY I.F_Clave,M.F_DesPro, I.F_Lote");
                                    while (rset.next()) {
                                        producto = rset.getString("I.F_Clave");
                                        
                            %>
                            <tr>
                                <td><%=rset.getString(1)%></td>
                                <td><%=rset.getString(2)%></td>
                                <!--td><%=rset.getString(3)%></td>
                                <td><%=rset.getString(4)%></td-->
                                <td><%=formatter.format(rset.getInt(5))%></td>
                                <%
                                ResultSet rset3 = con.consulta("SELECT F_Obser  FROM tb_compra where F_OrdCom='"+NoCompra+"' and F_ClaPro='"+producto+"' and F_Obser <> ''");
                                    while (rset3.next()) {
                                        obs = rset3.getString("F_Obser");
                                    }
                             
                                %>
                                <td><%=obs%></td>
                            </tr>
                            <%obs="";
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
