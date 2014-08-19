<%-- 
    Document   : exist
    Created on : 02-jul-2014, 23:24:11
    Author     : wence
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
    DecimalFormat formatter2 = new DecimalFormat("#,###,###.##");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "ISEM", Clave = "1",Claves="";
    ResultSet rset ;
    ResultSet rset2;
    int Cantidad=0;
    double monto=0, montof=0;
    
    /*if (sesion.getAttribute("nombre") != null) {
     usua = (String) sesion.getAttribute("nombre");
     Clave = (String) session.getAttribute("clave");
     } else {
     response.sendRedirect("index.jsp");
     }
     if (Clave== null){
     Clave="";
     }*/
    ConectionDB_SAA con = new ConectionDB_SAA();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Estilos CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link rel="stylesheet" href="css/cupertino/jquery-ui-1.10.3.custom.css" />
        <link href="css/navbar-fixed-top.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <!---->
        <title>Ingresos en Almac&eacute;n</title>



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
                                    <li><a href="captura.jsp">Captura de Insumos</a></li>
                                    <li class="divider"></li>
                                    <li><a href="catalogo.jsp">Catálogo de Proveedores</a></li>
                                    <li><a href="reimpresion.jsp">Reimpresión de Docs</a></li>
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
                            <li><a href="indexMain.jsp"><span class="glyphicon glyphicon-user"></span> <%=usua%></a></li>
                            <li class="active"><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span></a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container">
            <form action="exist.jsp" method="post">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Existencias en CEDIS
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="clave" id="clave" placeholder="Clave" > <button class="btn btn-sm btn-success" id="btn-buscar2">BUSCAR&nbsp;<label class="glyphicon glyphicon-search"></label></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="gnr.jsp">Descargar<label class="glyphicon glyphicon-download"></label></a></h3>
                </div>

                <div class="panel-footer">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="datosProv">
                        <thead>
                            <tr>
                                <td>Clave</td>
                                <td>Descripción</td>
                                <td>Lote</td>
                                <td>Caducidad</td>
                                <td>Ubicacion</td>
                                <td>Cantidad</td>
                                <td>Costo U.</td>
                                <td>Monto</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    con.conectar();
                                    
                                   Claves = request.getParameter("clave");
                                   if(Claves==null){
                                       Claves="";
                                   }
                                   
                                   if (Claves.equals("")){
                                    rset = con.consulta("SELECT l.F_ClaPro, m.F_DesPro, l.F_ClaLot, DATE_FORMAT(l.F_FecCad, '%d/%m/%Y') AS F_FecCad, l.F_Ubica, l.F_Cb, SUM(F_ExiLot), u.F_DesUbi,(m.F_Costo*l.F_ExiLot) as monto,m.F_Costo FROM tb_lote l, tb_medica m, tb_ubica u WHERE m.F_ClaPro = l.F_ClaPro AND l.F_Ubica = u.F_ClaUbi AND F_ExiLot != 0 GROUP BY l.F_ClaPro,l.F_ClaLot,l.F_FecCad,l.F_Ubica, l.F_Cb, u.F_DesUbi");
                                   }else{
                                       rset = con.consulta("SELECT l.F_ClaPro, m.F_DesPro, l.F_ClaLot, DATE_FORMAT(l.F_FecCad, '%d/%m/%Y') AS F_FecCad, l.F_Ubica, l.F_Cb, SUM(F_ExiLot), u.F_DesUbi,(m.F_Costo*l.F_ExiLot) as monto,m.F_Costo FROM tb_lote l, tb_medica m, tb_ubica u WHERE m.F_ClaPro = l.F_ClaPro AND l.F_Ubica = u.F_ClaUbi AND F_ExiLot != 0 and l.F_ClaPro='"+Claves+"' GROUP BY l.F_ClaPro,l.F_ClaLot,l.F_FecCad,l.F_Ubica, l.F_Cb, u.F_DesUbi");
                                   }
                                    while (rset.next()) {
                                        System.out.println(rset.getString(1));
                                        
                            %>
                            <tr>
                                <td><%=rset.getString(1)%></td>
                                <td><%=rset.getString(2)%></td>
                                <td><%=rset.getString(3)%></td>
                                <td><%=rset.getString(4)%></td>
                                <td><%=rset.getString(8)%></td>
                                <td><%=formatter.format(rset.getInt(7))%></td>
                                <td><%=formatter2.format(rset.getDouble(10))%></td>
                                <td><%=formatter2.format(rset.getDouble(9))%></td>
                            </tr>
                            <%
                                    }
                                    if (Claves.equals("")){
                                    rset2 = con.consulta("SELECT SUM(F_ExiLot),sum((m.F_Costo*l.F_ExiLot)) as monto FROM tb_lote l INNER JOIN tb_medica m on l.F_ClaPro=m.F_ClaPro");
                                    }else{
                                        rset2 = con.consulta("SELECT SUM(F_ExiLot),sum((m.F_Costo*l.F_ExiLot)) as monto FROM tb_lote l INNER JOIN tb_medica m on l.F_ClaPro=m.F_ClaPro where l.F_ClaPro='"+Claves+"'");
                                    }
                                    while (rset2.next()) {
                                    Cantidad = Integer.parseInt(rset2.getString(1));
                                    monto = Double.parseDouble(rset2.getString(2));
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
                            %>
                        </tbody>
                        
                    </table><h3>Total Piezas = <%=formatter.format(Cantidad)%>&nbsp;&nbsp;&nbsp;Monto Total = $<%=formatter2.format(monto)%></h3>
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
    </body>
</html>


<!-- 
================================================== -->
<!-- Se coloca al final del documento para que cargue mas rapido -->
<!-- Se debe de seguir ese orden al momento de llamar los JS -->
<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery-ui-1.10.3.custom.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script>
    $(document).ready(function() {
        $('#datosProv').dataTable();
    });
</script>
<script>


    function isNumberKey(evt, obj)
    {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode === 13 || charCode > 31 && (charCode < 48 || charCode > 57)) {
            if (charCode === 13) {
                frm = obj.form;
                for (i = 0; i < frm.elements.length; i++)
                    if (frm.elements[i] === obj)
                    {
                        if (i === frm.elements.length - 1)
                            i = -1;
                        break
                    }
                /*ACA ESTA EL CAMBIO*/
                if (frm.elements[i + 1].disabled === true)
                    tabular(e, frm.elements[i + 1]);
                else
                    frm.elements[i + 1].focus();
                return false;
            }
            return false;
        }
        return true;

    }

    function valida_clave() {
        var missinginfo = "";
        if ($("#Nombre").val() == "") {
            missinginfo += "\n El campo Clave de la Unidad no debe de estar vacío";
        }
        if (missinginfo != "") {
            missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA ENVIAR PETICIÓN DE SOPORTE:\n" + missinginfo + "\n\n ¡INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
            alert(missinginfo);
            return false;
        } else {
            return true;
        }
    }

    function valida_alta() {
        var missinginfo = "";
        if ($("#Nombre").val() == "") {
            missinginfo += "\n El campo Clave de la Unidad no debe de estar vacío";
        }
        if ($("#FecFab").val() == "") {
            missinginfo += "\n El campo Fecha Entrega no debe de estar vacío";
        }
        if (missinginfo != "") {
            missinginfo = "\n TE HA FALTADO INTRODUCIR LOS SIGUIENTES DATOS PARA ENVIAR PETICIÓN DE SOPORTE:\n" + missinginfo + "\n\n ¡INGRESA LOS DATOS FALTANTES Y TRATA OTRA VEZ!\n";
            alert(missinginfo);

            return false;
        } else {

            return true;
        }
    }
</script>
<script language="javascript">
    function justNumbers(e)
    {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 46))
            return true;

        return /\d/.test(String.fromCharCode(keynum));
    }
    otro = 0;
    function LP_data() {
        var key = window.event.keyCode;//codigo de tecla. 
        if (key < 48 || key > 57) {//si no es numero 
            window.event.keyCode = 0;//anula la entrada de texto. 
        }
    }
    function anade(esto) {
        if (esto.value.length === 0) {
            if (esto.value.length == 0) {
                esto.value += "(";
            }
        }
        if (esto.value.length > otro) {
            if (esto.value.length == 4) {
                esto.value += ") ";
            }
        }
        if (esto.value.length > otro) {
            if (esto.value.length == 9) {
                esto.value += "-";
            }
        }
        if (esto.value.length < otro) {
            if (esto.value.length == 4 || esto.value.length == 9) {
                esto.value = esto.value.substring(0, esto.value.length - 1);
            }
        }
        otro = esto.value.length
    }


    function tabular(e, obj)
    {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla != 13)
            return;
        frm = obj.form;
        for (i = 0; i < frm.elements.length; i++)
            if (frm.elements[i] == obj)
            
        /*ACA ESTA EL CAMBIO*/
        if (frm.elements[i + 1].disabled == true)
            tabular(e, frm.elements[i + 1]);
        else
            frm.elements[i + 1].focus();
        return false;
    }

    $(function() {
        $("#FecFab").datepicker();
        $("#FecFab").datepicker('option', {dateFormat: 'dd/mm/yy'});
    });
</script> 


