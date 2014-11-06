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
    String usua = "ISEM", Clave = "1",Claves="",clave="",provee="",fecha="",fechaa="",fechaamov="",CantidadF="",fechamov="",folio="",docmov="",fechak="";
    String FolioC="", FolioF="";
    int existencia=0,existencia2=0,cont=0,inventario=0,inventariof=0,cantmov=0,diferencias=0,CantF=0;
    ResultSet rset,rset_1, rset_fecha, rset_fecha2;
    ResultSet rset2,rset_reporte;
    ResultSet rset3, rset3_1;
    ResultSet rset_fecfac;
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
    
    try {
		clave = request.getParameter("clave");
                provee = request.getParameter("provee");
		
} catch (Exception e) { }
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
            
        </div>
        <div class="container">
            <form action="kardex.jsp" method="post">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Movimiento por Clave&nbsp;&nbsp;&nbsp;Clave:&nbsp;<%=clave%>&nbsp;&nbsp;&nbsp;<a href="kardex_gnr.jsp?clave=<%=clave%>&provee=<%=provee%>">Descargar&nbsp;<label class="glyphicon glyphicon-download-alt"></label></a></h3>
                </div>

                <div class="panel-footer">
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="datosProv">
                        <thead>
                            <tr>
                                <td hidden="">Id</td>
                                <td>Fecha</td>
                                <td>No. Remisión/ Doc. Salida</td>                                
                                <td>Inv. Inicial / Movimientos</td>
                                <td>Ingreso</td>
                                <td>Egreso</td>
                                <td>Inv. Final</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    con.conectar();
                                    con.actualizar("delete FROM tb_fechakardex WHERE F_Clapro='"+clave+"' AND F_Claprov='"+provee+"'");
                                    con.actualizar("delete FROM tb_reporteclave  WHERE F_Clave='"+clave+"' AND F_Provee='"+provee+"'");
                                    
                                    rset_fecfac = con.consulta("SELECT F.F_FecEnt FROM tb_facturavista F INNER JOIN (SELECT F_ClaLot,F_ClaOrg FROM tb_lote GROUP BY F_ClaLot) L ON F.F_ClaLot=L.F_ClaLot WHERE F.F_ClaPro='"+clave+"' AND L.F_ClaOrg='"+provee+"' GROUP BY F.F_FecEnt");
                                    while(rset_fecfac.next()){
                                        con.actualizar("insert into tb_fechakardex values(0,'"+rset_fecfac.getString(1)+"','"+clave+"','"+provee+"')");
                                    }
                                    
                                   rset_fecha =  con.consulta(" select c.F_FecApl FROM tb_compra_web c INNER JOIN tb_proveedor p on c.F_ClaOrg=p.F_ClaProve WHERE c.F_ClaPro='"+clave+"' AND p.F_ClaProve='"+provee+"' GROUP BY c.F_FecApl");
                                    while(rset_fecha.next()){
                                        con.insertar("insert into tb_fechakardex values(0,'"+rset_fecha.getString(1)+"','"+clave+"','"+provee+"')");
                                    }
                                    
                                    rset_fecha2 =  con.consulta("SELECT F_Fecha FROM tb_fechakardex WHERE F_Clapro='"+clave+"' AND F_Claprov='"+provee+"' GROUP BY F_Fecha ORDER BY F_Fecha ASC");
                                    while(rset_fecha2.next()){
                                        fechak = rset_fecha2.getString("F_Fecha");
                                    rset_1 = con.consulta("SELECT c.F_FolRemi as folio FROM tb_compra_web c WHERE c.F_FecApl='"+fechak+"' AND c.F_ClaPro='"+clave+"' AND c.F_ClaOrg='"+provee+"' GROUP BY c.F_FolRemi");   
                                        while (rset_1.next()) {
                                            FolioC = rset_1.getString("folio");
                                        
                                   // rset = con.consulta("SELECT DATE_FORMAT(c.F_FecApl,'%d/%m/%Y') AS fecha,c.F_FecApl as fechaa,c.F_FolRemi as folio,SUM(c.F_CanCom) as cantidad FROM tb_compra_web c INNER JOIN tb_proveedor p on c.F_ClaOrg=p.F_ClaProve WHERE c.F_FecApl='"+fechak+"' AND c.F_ClaPro='"+clave+"' AND p.F_ClaProve='"+provee+"' GROUP BY c.F_FecApl,c.F_FolRemi");
                                      rset = con.consulta("SELECT DATE_FORMAT(c.F_FecApl,'%d/%m/%Y') AS fecha,c.F_FecApl as fechaa,c.F_FolRemi as folio,R.F_Final,SUM(c.F_CanCom) as cantidad FROM tb_compra_web c LEFT JOIN (SELECT F_Final,F_Clave,F_Provee FROM tb_reporteclave ORDER BY F_Id DESC LIMIT 1 ) R ON c.F_ClaPro=R.F_Clave and c.F_ClaOrg=R.F_Provee WHERE c.F_FecApl='"+fechak+"' AND c.F_ClaPro='"+clave+"' AND c.F_ClaOrg='"+provee+"' and c.F_FolRemi ='"+FolioC+"' GROUP BY c.F_FolRemi");   
                                        while (rset.next()) {
                                        //cont ++;
                                        
                                        fecha = rset.getString("fecha");
                                        folio = rset.getString("folio");
                                        existencia = Integer.parseInt(rset.getString("cantidad"));
                                        existencia2 = Integer.parseInt(rset.getString("cantidad"));
                                        CantidadF = rset.getString("R.F_Final");
                                        
                                        if (CantidadF == null ){
                                            inventario = 0;
                                            inventariof = existencia;
                                        }else{
                                            CantF = Integer.parseInt(CantidadF);
                                            inventario = CantF;
                                            inventariof = existencia + CantF;
                                        }
                                        
                                        /*                                   
                                        for(int x=0; x < cont; x++){
                                               inventario = inventariof;
                                               inventariof = (inventario + existencia) - (cantmov);
                                        }*/
                                        con.insertar("insert into tb_reporteclave values(0,'"+fecha+"','"+folio+"','"+inventario+"','"+existencia+"','0','"+inventariof+"','"+clave+"','"+provee+"')");
                                        cont=0;
                                        }
                                        }
                                        
                                      rset3_1 = con.consulta("SELECT F.F_ClaDoc AS documento FROM tb_facturavista F INNER JOIN (SELECT F_ClaLot,F_ClaOrg FROM tb_lote  GROUP BY F_ClaLot) L ON F.F_ClaLot=L.F_ClaLot  WHERE F.F_ClaPro='"+clave+"' AND L.F_ClaOrg='"+provee+"' and F.F_FecEnt='"+fechak+"' GROUP BY F.F_ClaDoc");
                                      while (rset3_1.next()) {
                                          FolioF = rset3_1.getString("documento");
                                          
                                      rset3 = con.consulta("SELECT DATE_FORMAT(F.F_FecEnt,'%d/%m/%Y') as fechamov, F.F_ClaDoc AS documento,R.F_Final, SUM(F.F_CantSur) AS F_CantSur FROM tb_facturavista F INNER JOIN (SELECT F_ClaLot,F_ClaOrg FROM tb_lote  GROUP BY F_ClaLot) L ON F.F_ClaLot=L.F_ClaLot  INNER JOIN (SELECT F_Final,F_Clave,F_Provee FROM tb_reporteclave ORDER BY F_Id DESC LIMIT 1 ) R ON F.F_ClaPro=R.F_Clave AND L.F_ClaOrg=R.F_Provee WHERE F.F_ClaPro='"+clave+"' AND L.F_ClaOrg='"+provee+"' and F.F_FecEnt='"+fechak+"' and F.F_ClaDoc='"+FolioF+"' GROUP BY F.F_ClaDoc");
                                        while (rset3.next()) {
                                            fecha = rset3.getString("fechamov");
                                            folio = rset3.getString("documento");                                            
                                            existencia2 = Integer.parseInt(rset3.getString("R.F_Final")); 
                                            cantmov = Integer.parseInt(rset3.getString("F_CantSur"));
                                            diferencias = existencia2 - cantmov;
                                            
                                            con.insertar("insert into tb_reporteclave values(0,'"+fecha+"','"+folio+"','"+existencia2+"','0','"+cantmov+"','"+diferencias+"','"+clave+"','"+provee+"')");
                                        
                                        }
                                        }
                                    }
                                    rset_reporte = con.consulta("SELECT F_Id,F_Fecha,F_Doc,F_inv,F_Ingreso,F_Egreso,F_Final FROM tb_reporteclave WHERE F_Clave ='"+clave+"' and F_Provee='"+provee+"' ORDER BY F_Id + 0");
                                    while(rset_reporte.next()){
                                        fechaa = rset_reporte.getString("F_Fecha");                                   
                                        docmov = rset_reporte.getString("F_Doc");
                                        inventario = Integer.parseInt(rset_reporte.getString("F_inv"));
                                        existencia = Integer.parseInt(rset_reporte.getString("F_Ingreso"));
                                        cantmov = Integer.parseInt(rset_reporte.getString("F_Egreso"));
                                        inventariof = Integer.parseInt(rset_reporte.getString("F_Final"));
                                        
                                    System.out.println(docmov);
                                        %>

                            <tr>
                                <td hidden=""><%=rset_reporte.getString(1)%></td>
                                <td><%=fechaa%></td>
                                <td><%=docmov%></td>                                
                                <td><%=formatter.format(inventario)%></td>                                
                                <td><%=formatter.format(existencia)%></td>
                                <td><%=formatter.format(cantmov)%></td>     
                                <td><%=formatter.format(inventariof)%></td>     
                            </tr>
                           
                            <%}
                                           
                                   
                                    
                                    
                                  /*  rset2 = con.consulta("SELECT SUM(F_ExiLot),sum((m.F_Costo*l.F_ExiLot)) as monto FROM tb_lote l INNER JOIN tb_medica m on l.F_ClaPro=m.F_ClaPro INNER JOIN tb_proveedor p on l.F_ClaOrg=p.F_ClaProve where l.F_ClaPro='"+clave+"' and p.F_ClaProve='"+provee+"'");
                                    
                                    while (rset2.next()) {
                                    Cantidad = Integer.parseInt(rset2.getString(1));
                                    monto = Double.parseDouble(rset2.getString(2));
                                    }*/
                                    con.cierraConexion();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
    
                            %>
                        </tbody>
                        
                    </table><!--h3>Total Piezas = <%=formatter.format(Cantidad)%>&nbsp;&nbsp;&nbsp;Monto Total = $<%=formatter2.format(monto)%></h3-->
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


