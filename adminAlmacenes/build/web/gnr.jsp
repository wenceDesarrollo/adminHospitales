<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="conn.*" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.text.*" import="java.lang.*" import="java.util.*" import= "javax.swing.*" import="java.io.*" import="java.text.DateFormat" import="java.text.ParseException" import="java.text.SimpleDateFormat" import="java.util.Calendar" import="java.util.Date"  import="java.text.NumberFormat" import="java.util.Locale" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns:v="urn:schemas-microsoft-com:vml"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns="http://www.w3.org/TR/REC-html40">
    <%

        ConectionDB_LermaServer con = new ConectionDB_LermaServer();
        NumberFormat nf1 = NumberFormat.getInstance(Locale.US);
        DecimalFormat formatter2 = new DecimalFormat("#,###,###.##");

        String totPzs = "";
        String totMon = "";
        String totPzsMed = "";
        String totMonMed = "";
        String totPzsMat = "";
        String totMonMat = "";
        String fecha_1 = "";
        String fecha_2 = "";
        String unidad_jv = "";
        int total_pzs = 0, total_medi = 0, total_cura = 0;
        double total_mon_medi = 0.0, total_mon_cura = 0.0, total_montos = 0.0, total_tot = 0.0, montos_res = 0.0;
        String ixt_cad = "", ixt_cad2 = "";
        int cant_pzs = 0, ixt_uni = 0;
        double cant_totMon = 0.0, ixt_costo = 0.0;
        String only = "";

        try {
            unidad_jv = request.getParameter("id_cs");
            fecha_1 = request.getParameter("fecha_1_vi");
            fecha_2 = request.getParameter("fecha_2_vi");
        } catch (Exception e) {
        }
        String but = "r";

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=Reporte Existencias en Cedis.xls");
        //ingresar un try y realizar una sola conexión
        try {
            con.conectar();
            ResultSet rset = con.consulta("SELECT  SUM(F_ExiLot) FROM tb_lote ");
            while (rset.next()) {
                totPzs = rset.getString("SUM(F_ExiLot)");
            }

    %>
    <head>
    </head>

    <body link=blue vlink=purple>

        <table border="1">

            <tr  >
                <td  >Información</td>
                <td colspan=2 style='mso-ignore:colspan'></td>
            </tr>
            <tr  >
                <td  >Total de Piezas:</td>
                <%total_pzs = Integer.parseInt(totPzs);%>
                <td class=xl72 align=right><%=nf1.format(total_pzs)%></td>
                <td  style='mso-ignore:colspan'></td>
            </tr>
            <tr  >
                <td  >&nbsp;</td>
                <td class=xl73 align=right>&nbsp;</td>
                <td style='mso-ignore:colspan'></td>
            </tr>

            <tr  >
                <td  colspan=3 style='height:15.0pt;mso-ignore:colspan'></td>
            </tr>
            <%
                ResultSet rset2 = con.consulta("SELECT l.F_ClaPro, m.F_DesPro, l.F_ClaLot, DATE_FORMAT(l.F_FecCad, '%d/%m/%Y') AS F_FecCad, l.F_Ubica, l.F_Cb, SUM(F_ExiLot), u.F_DesUbi,(m.F_Costo*SUM(l.F_ExiLot)) as monto,m.F_Costo, F_DesMar FROM tb_marca mar, tb_lote l, tb_medica m, tb_ubica u WHERE mar.F_ClaMar = l.F_ClaMar and m.F_ClaPro = l.F_ClaPro AND l.F_Ubica = u.F_ClaUbi AND F_ExiLot != 0 GROUP BY l.F_ClaPro,l.F_ClaLot,l.F_FecCad,l.F_Ubica, l.F_Cb, u.F_DesUbi");

            %>
            <tr  >
                <td  style='height:15.0pt;mso-ignore:colspan'>Clave</td>
                <td >Descripción</td>
                <td >Lote</td>
                <td >Caducidad</td>
                <td >Ubicacion</td>
                <td >Marca</td>
                <td >Cantidad</td>
                <td >Costo U.</td>
                <td >Monto</td>
            </tr>
            <tr  >

                <%     while (rset2.next()) {

                        ixt_cad = rset2.getString("SUM(F_ExiLot)");
                        ixt_uni = Integer.parseInt(ixt_cad);
                        double monto1 = 0;
                        System.out.println(rset2.getString(1));
                        if (rset2.getInt("F_ClaPro") < 9999) {
                            monto1 = Double.parseDouble(rset2.getString("monto"));
                        } else {
                            monto1 = (Double.parseDouble(rset2.getString("monto")) * 1.16);
                        }
                %>
                <td  class=xl75 ><%=rset2.getString("l.F_ClaPro")%></td>
                <td  class=xl75 ><%=rset2.getString("m.F_DesPro")%></td>
                <td  class=xl75 style='height:15.0pt;mso-number-format:"@"'><%=rset2.getString("l.F_ClaLot")%></td>
                <td  class=xl75 ><%=rset2.getString("F_FecCad")%></td>
                <td  class=xl75 ><%=rset2.getString("u.F_DesUbi")%></td>
                <td  class=xl75 ><%=rset2.getString("F_DesMar")%></td>
                <td class=xl68><div align="center"><%=nf1.format(ixt_uni)%></div></td>
                <td class=xl68 style='mso-number-format:"#,##0.00"'><div align="center"><%=rset2.getDouble("m.F_Costo")%></div></td>
                <td class=xl68 style='mso-number-format:"#,##0.00"'><div align="center"><%=monto1%></div></td>

            </tr>
            <% } %>
            <tr height=0 style='display:none'>
                <td width=120 style='width:90pt'></td>
                <td width=117 style='width:88pt'></td>
                <td width=101 style='width:76pt'></td>
                <td width=101 style='width:76pt'></td>
            </tr>
        </table>

    </body>

</html>
<%
        con.cierraConexion();
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }

%>