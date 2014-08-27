<%-- 
    Document   : index
    Created on : 02-jul-2014, 15:14:09
    Author     : wence
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="conn.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConectionDB con = new ConectionDB();
    ConectionDB_SAA con_saa = new ConectionDB_SAA();
    String usuario = "";

    try {
        usuario = request.getParameter("usuario");
    } catch (Exception e) {

    }

    if (usuario == null) {
        usuario = "";
    }
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIALSS</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.css">



        <!-- Just for debugging purposes. Don't actually copy this line! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><b>Consulta Ingresos a Reportes ISEM</b></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="consultaEntradasISEM.jsp">Entradas Rep ISEM</a></li>
                        <!--li class=""><a href="consultaEntradasOC.jsp">Entradas OC</a></li>
                        <!--li><a data-toggle="modal" href="#myModal2">Acerca de...</a></li>
                        <li><a data-toggle="modal" href="#myModal">Cont&aacute;ctanos</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">M&oacute;dulos <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="historialOC.jsp">Historial OC</a></li>
                                <li><a href="ordenesCompra.jsp">Órdenes de Compra</a></li>
                                <li><a href="factura.jsp">Recibo en Almac&eacute;n</a></li>
                                <li><a href="entregas.jsp">Entrega a Proveedores</a></li>
                                <li><a href="exist.jsp">Existencias en CEDIS</a></li>
                                <li><a href="Entrega.jsp">Fecha de Recibo en CEDIS</a></li>
                        <!--li><a href="rep.jsp">Reporteador</a></li>

                    </ul>
                </li-->
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <!--li><a href="../navbar/">Default</a></li>
                        <li><a href="../navbar-static-top/">Static top</a></li-->
                        <!--li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Salir</a></li-->
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
        <div style="padding-top: 60px;">

            <div class="container">

                <!-- Main component for a primary marketing message or call to action -->
                <h1>Consulta Ingresos a Reportes ISEM</h1>
                <div class="row">
                    <form action="consultaEntradasISEM.jsp" method="post">
                        <div class="col-sm-2">
                            <h4>Filtrar por usuario</h4>
                        </div>
                        <div class="col-sm-2">
                            <select class="form-control" name="usuario" onchange="this.form.submit();">
                                <option value="">-Seleecione-</option>
                                <%
                                    try {
                                        Calendar calendar = Calendar.getInstance();
                                        con.conectar();
                                        ResultSet rset = con.consulta("select usuario from ingEnt where usuario!='' and status='1' group by usuario ");
                                        while (rset.next()) {
                                            /*calendar.setTime(df.parse(rset.getString(4)));
                                             calendar.add(Calendar.HOUR, 6);
                                             Date hora = calendar.getTime();*/

                                %>
                                <option value="<%=rset.getString(1)%>"><%=rset.getString(1)%></option>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                        System.out.println(e.getMessage());
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <a href="consultaEntradasISEM.jsp" class="btn btn-default" >Todos</a>
                        </div>
                    </form>
                </div>
                <div class="panel panel-body">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="datosProv">
                        <thead>
                            <tr>
                                <td>id</td>
                                <td>Usuario</td>
                                <td>Fecha y Hora</td>
                                <td>Status</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Calendar calendar = Calendar.getInstance();
                                    con.conectar();
                                    ResultSet rset = con.consulta("select idEnt, usuario, DATE_FORMAT(fecha, '%d/%m/%Y') AS fecha, hora, status from ingEnt where usuario like '%"+usuario+"' and status='1' order by (idEnt+0) desc");
                                    while (rset.next()) {
                                        /*calendar.setTime(df.parse(rset.getString(4)));
                                         calendar.add(Calendar.HOUR, 6);
                                         Date hora = calendar.getTime();*/

                            %>
                            <tr class="odd gradeX">
                                <td><%=rset.getInt(1)%></td>
                                <td><%=rset.getString(2)%></td>
                                <td><%=rset.getString(3)%> <%=rset.getString(4)%></td>
                                <td><%=rset.getString(5)%></td>
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
                </div>
                <!--
                Envío de Correo
                -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Ingresa tus Datos</h4>
                            </div>
                            <div class="modal-body">
                                <form name="form_com" method="post" id="form_com">
                                    Nombre: <input type="text" class="form-control" autofocus placeholder="Ingrese su Nombre" name="txtf_nom" id="txtf_nom">
                                    Cuenta de Correo Electr&oacute;nico: <input type="text" class="form-control"  placeholder="Ingrese su Cuenta de Correo" name="txtf_cor" id="txtf_cor" onblur="validarEmail(this.form.txtf_cor.value);" >
                                    Deje su Comentario: <textarea name="txta_com" cols="10" rows="5" class="form-control" id="txta_com"></textarea>
                                    <div class="modal-footer">
                                        <div id="contenidoAjax">
                                            <p></p>
                                        </div>
                                        <input type="submit" class="btn btn-primary" value="Enviar" id="btn_com" onClick="return verificaCom(document.forms.form_com);">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>

                                </form>
                            </div>

                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <!--
                Fin envío de correo
                -->

                <!-- 
              Mensaje de Acerca de...
                -->
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Control de Almacenes / Desarrollo WEB</h4>
                            </div>
                            <div class="modal-body">
                                <br>
                                <img src="imagenes/GNKL_Small.JPG"  >Sistema de Administración de Almac&eacute;n para el ISEM V.1<br>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                <!--button type="button" class="btn btn-primary">Guardar Info</button-->
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->


                <!-- 
                 fin Mensaje de Acerca de...
                -->


            </div>

        </div><!-- /container -->



        <!-- end Functions with Ajax/Jquery W-->


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
                                                $('#datosProv').dataTable();
                                            });

                                            $(document).ready(function() {
                                                $('#form_login').submit(function() {
                                                    alert("Introduzca credenciales válidas");
                                                    return false;
                                                });


                                                $('#form_com').submit(function() {
                                                    //alert("huges");
                                                    return false;
                                                });
                                                $("#btn_com").click(function() {

                                                    var nom = $('#txtf_nom').val();
                                                    var cor = $('#txtf_cor').val();
                                                    var com = $('#txta_com').val();
                                                    //alert(id+" "+id);

                                                    if (nom == '' || cor == '' || com == '') {
                                                        return false;
                                                    }
                                                    else {
                                                        var $contenidoAjax = $('div#contenidoAjax').html('<p><img src="imagenes/ajax-loader-1.gif" /></p>');
                                                        var dataString = $('#form_com').serialize();
                                                        var dir = '/adminAlmacenes/servletCorreo';
                                                        //alert('Datos serializados: '+dataString+dir);

                                                        $.ajax({
                                                            url: dir,
                                                            type: "POST",
                                                            data: dataString,
                                                            success: function(data) {
                                                                $contenidoAjax.html(data);
                                                                alert("Sus datos han sido Enviados");
                                                                location.reload();
                                                                //$("#form_com").fadeOut("slow");
                                                                /*$('#txtf_nom').value='huge';
                                                                 $('#txtf_cor').value='';
                                                                 $('#txta_com').value='';*/
                                                            },
                                                        });
                                                    }
                                                });

                                            });

        </script>
    </body>
</html>
