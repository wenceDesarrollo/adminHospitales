<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="conn.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%

    ConectionDB_LermaServer con = new ConectionDB_LermaServer();
    NumberFormat nf1 = NumberFormat.getInstance(Locale.US);

    ResultSet rset, rset2, rset3, rset4, rset5;
    String Clave = "", Claves = "", clave = "", provee = "", nomprovee = "", fecha = "", orden = "", Exist = "", Prioridad = "";
    int exist1 = 0, exist2 = 0, existr = 0, existt = 0, cont = 0, inventario = 0, inventariof = 0;

    String totPzs = "";
    String totMon = "";
    String totPzsMed = "";
    String totMonMed = "";
    String totPzsMat = "";
    String totMonMat = "";
    String fecha_1 = "";
    String fecha_2 = "";
    int total_pzs = 0, total_medi = 0, total_cura = 0;
    double total_mon_medi = 0.0, total_mon_cura = 0.0, total_montos = 0.0, total_tot = 0.0, montos_res = 0.0;
    String ixt_cad = "", ixt_cad2 = "";
    int cant_pzs = 0, ixt_uni = 0;
    double cant_totMon = 0.0, ixt_costo = 0.0;
    String only = "";

    String but = "r";

    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment; filename=Reporte Recibo en Almacén.xls");
    //ingresar un try y realizar una sola conexión
    try {
        con.conectar();


%>


<table border=1>
    <tr>  
        <td>Proveedor</td>
        <td>Claves</td>
        <td>Cant. Max.</td>
        <td>Solicitado</td>
        <%            rset4 = con.consulta("SELECT F_Priori FROM tb_pedidoisem GROUP BY F_Priori ORDER BY F_Priori+0");
            while (rset4.next()) {
        %>
        <td><%=rset4.getString(1)%>. Solicitado</td>
        <td><%=rset4.getString(1)%>. Entrega</td>
        <%}%>
        <td>Total Recibido</td>
        <td>Sol - Sur</td>
        <td>Max - Sol</td>
    </tr>
    <tr>

        <%
            rset3 = con.consulta("SELECT F_NomPro,F_Provee,F_Clave,SUM(F_Cant) AS recibe FROM tb_pedidoisem p INNER JOIN tb_proveedor po on p.F_Provee=po.F_ClaProve where F_StsPed!=2 GROUP BY F_NomPro,F_Provee,F_Clave ASC");
            while (rset3.next()) {
                int maximo = 0;
                rset4 = con.consulta("select F_CantMax from tb_prodprov where F_ClaProve = '" + rset3.getString("F_Provee") + "' and F_ClaPro = '" + rset3.getString("F_Clave") + "' group by F_IdProdProv");
                while (rset4.next()) {
                    maximo = rset4.getInt("F_CantMax");
                }

                provee = rset3.getString("F_Provee");
                nomprovee = rset3.getString("F_NomPro");
                Clave = rset3.getString("F_Clave");
                Exist = rset3.getString("recibe");
                if (Exist == null) {
                    existt = 0;
                } else {
                    existt = Integer.parseInt(Exist);
                }
        %>
        <td><%=nomprovee%></td>
        <td><%=Clave%></td>
        <td><%=nf1.format(maximo)%></td>
        <td><%=nf1.format(existt)%></td>
        <%
            rset4 = con.consulta("SELECT F_Priori FROM tb_pedidoisem GROUP BY F_Priori ORDER BY F_Priori+0");
            while (rset4.next()) {
                orden = "";
                Prioridad = rset4.getString("F_Priori");
                cont++;
                rset5 = con.consulta("SELECT F_NoCompra FROM tb_pedidoisem p INNER JOIN tb_proveedor po on p.F_Provee=po.F_ClaProve WHERE F_StsPed!=2 and F_Clave='" + Clave + "' AND F_Priori='" + Prioridad + "' GROUP BY F_NoCompra");
                while (rset5.next()) {
                    orden = rset5.getString("F_NoCompra");

                }
                int solicitado = 0;
                rset = con.consulta("SELECT SUM(F_Cant) as soli from tb_pedidoisem where F_NoCompra ='" + orden + "' and F_Clave='" + Clave + "'");
                while (rset.next()) {
                    solicitado = rset.getInt(1);
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
        <td><%=nf1.format(solicitado)%></td>
        <td><%=nf1.format(exist1)%></td>
        <%cont = 0;
            }
        %>
        <td><%=nf1.format(exist2)%></td>
        <td><div align="center"><%=nf1.format(existt - exist2)%></div></td>
        <td><%=nf1.format(maximo-existt)%></td>
    </tr>
    <% exist2 = 0;
        } %>
</table>
<%
        con.cierraConexion();
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }

%>