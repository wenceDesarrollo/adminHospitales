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
    String usua = "ISEM", Clave = "", Claves = "", clave = "", provee = "", nomprovee = "", fecha = "", orden = "", Exist = "", Prioridad = "";
    int exist1 = 0, exist2 = 0, existr = 0, existt = 0, cont = 0, inventario = 0, inventariof = 0;

    ResultSet rset, rset2, rset3, rset4, rset5;
    int Cantidad = 0;
    double monto = 0, montof = 0;

    /*if (sesion.getAttribute("nombre") != null) {
     usua = (String) sesion.getAttribute("nombre");
     Clave = (String) session.getAttribute("clave");
     } else {
     response.sendRedirect("index.jsp");
     }
     if (Clave== null){
     Clave="";
     }*/
    ConectionDB_LermaServer con = new ConectionDB_LermaServer();

    try {
        con.conectar();
        clave = request.getParameter("clave");
        provee = request.getParameter("provee");

    } catch (Exception e) {
    }
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
        <title>Reporte por proveedor</title>



    </head>
    <body>
        <div class="container">
            <h1>SIALSS</h1>
            <h4>SISTEMA INTEGRAL DE ADMINISTRACIÓN Y LOGÍSTICA PARA SERVICIOS DE SALUD</h4>

        </div>
        <div class="container">
            <form action="reporprovee.jsp" method="post">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Reporte de Entrega por Proveedor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="reporprovee_gnr.jsp">Descargar<label class="glyphicon glyphicon-download"></label></a></h3>
                    </div>

                    <div class="panel-footer">
                        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="datosProv">
                            <thead>
                                <tr>
                                    <td>Proveedor</td>
                                    <td>Claves</td> 
                                    <td>Cant. Max.</td>
                                    <td>Por Recibir</td>
                                    <%
                                        rset4 = con.consulta("SELECT F_Priori FROM tb_pedidoisem GROUP BY F_Priori ORDER BY F_Priori+0");
                                        while (rset4.next()) {
                                    %>
                                    <td><%=rset4.getString(1)%>. Entrega</td>
                                    <%}%>
                                    <td>Total Recibido</td>
                                    <td>Sol - Sur</td>
                                    <td>Max - Sol</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //  try {
                                    //con.conectar();
                                    // con.actualizar("delete from tb_reporte");

                                    rset3 = con.consulta("SELECT F_NomPro,F_Provee,F_Clave,SUM(F_Cant) AS recibe FROM tb_pedidoisem p INNER JOIN tb_proveedor po on p.F_Provee=po.F_ClaProve where F_StsPed!=2 GROUP BY F_NomPro,F_Provee,F_Clave ASC");
                                    while (rset3.next()) {
                                        provee = rset3.getString("F_Provee");
                                        nomprovee = rset3.getString("F_NomPro");
                                        Clave = rset3.getString("F_Clave");
                                        Exist = rset3.getString("recibe");
                                        if (Exist == null) {
                                            existt = 0;
                                        } else {
                                            existt = Integer.parseInt(Exist);
                                        }

                                        rset4 = con.consulta("select F_CantMax from tb_prodprov where F_ClaProve = '" + rset3.getString("F_Provee") + "' and F_ClaPro = '" + rset3.getString("F_Clave") + "' group by F_IdProdProv");
                                        int maximo = 0;
                                        while (rset4.next()) {
                                            maximo = rset4.getInt("F_CantMax");
                                        }
                                %>

                                <tr>
                                    <td><%=nomprovee%></td>
                                    <td><%=Clave%></td>        
                                    <td><%=formatter.format(maximo)%></td>                        
                                    <td><%=formatter.format(existt)%></td> 
                                    <%
                                        rset4 = con.consulta("SELECT F_Priori FROM tb_pedidoisem GROUP BY F_Priori ORDER BY F_Priori+0");
                                        while (rset4.next()) {
                                            orden = "";
                                            Exist = "0";
                                            Prioridad = rset4.getString("F_Priori");
                                            cont++;
                                            rset5 = con.consulta("SELECT F_NoCompra FROM tb_pedidoisem p INNER JOIN tb_proveedor po on p.F_Provee=po.F_ClaProve WHERE F_StsPed!=2 and F_Clave='" + Clave + "' AND F_Priori='" + Prioridad + "' GROUP BY F_NoCompra");
                                            while (rset5.next()) {
                                                orden = rset5.getString("F_NoCompra");
                                            }

                                            rset = con.consulta("SELECT SUM(F_CanCom) as entrega from tb_compra where F_OrdCom ='" + orden + "' and F_ClaPro='" + Clave + "'");
                                            while (rset.next()) {
                                                Exist = rset.getString("entrega");
                                                if (Exist == null) {
                                                    exist1 = 0;
                                                } else {
                                                    exist1 = Integer.parseInt(Exist);
                                                }
                                            }
                                            for (int x = 0; x < cont; x++) {

                                                existr = exist2;
                                                exist2 = existr + exist1;
                                            }

                                    %>
                                    <td><%=formatter.format(exist1)%></td>
                                    <%cont = 0;
                                        }
                                    %>
                                    <!--td><%//=formatter.format(exist2)%></td-->     
                                    <td><%=formatter.format(exist2)%></td>     
                                    <td><%=formatter.format(existt - exist2)%></td>    
                                    <td><%=formatter.format(maximo - existt)%></td> 
                                </tr>
                                <%exist2 = 0;
                                    }
                                    con.cierraConexion();
                                    /*} catch (Exception e) {
                                     System.out.println(e.getMessage());
                                     }*/
                                %>
                            </tbody>

</table><!--h3>Total Piezas = <%//=formatter.format(Cantidad)%>&nbsp;&nbsp;&nbsp;Monto Total = $<%//=formatter2.format(monto)%></h3-->
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


