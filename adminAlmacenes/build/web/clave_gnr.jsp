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

        ResultSet rset2 = null;
        ResultSet rset = null;
        String totPzs = "";
        String totMon = "";
        String totPzsMed = "";
        String totMonMed = "";
        String totPzsMat = "";
        String totMonMat = "";
        String fecha_1 = "";
        String fecha_2 = "";
        String unidad_jv = "", clave = "";
        int total_pzs = 0, total_medi = 0, total_cura = 0;
        double total_mon_medi = 0.0, total_mon_cura = 0.0, total_montos = 0.0, total_tot = 0.0, montos_res = 0.0;
        String ixt_cad = "", ixt_cad2 = "";
        int cant_pzs = 0, ixt_uni = 0;
        double cant_totMon = 0.0, ixt_costo = 0.0;
        String only = "";

        try {
            clave = request.getParameter("clave");

        } catch (Exception e) {
        }
        String but = "r";

        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=Concentrado por Clave.xls");

    //ingresar un try y realizar una sola conexión
        try {
            con.conectar();
            if (clave.equals("")) {
                rset = con.consulta("SELECT  SUM(F_ExiLot) FROM tb_lote ");
            } else {
                rset = con.consulta("SELECT  SUM(F_ExiLot) FROM tb_lote where f_clapro='" + clave + "' ");

            }
            while (rset.next()) {
                totPzs = rset.getString("SUM(F_ExiLot)");
            }

    %>
    <head>
        <meta http-equiv=Content-Type content="text/html; charset=windows-1252">
            <meta name=ProgId content=Excel.Sheet>
                <meta name=Generator content="Microsoft Excel 12">
                    <link id=Main-File rel=Main-File href="../Libro1.htm">
                        <link rel=File-List href=filelist.xml>
                            <!--link rel=Stylesheet href=stylesheet.css-->
                            <style> 
                                <!--table
                                {mso-displayed-decimal-separator:"\.";
                                 mso-displayed-thousand-separator:"\,";}
                                @page
                                {margin:.75in .7in .75in .7in;
                                 mso-header-margin:.3in;
                                 mso-footer-margin:.3in;
                                 mso-page-orientation:landscape;}
                                .style1 {color: #FF0000}
                                -->
                            </style>
                            <![if !supportTabStrip]><script language="JavaScript">
                            <!--
                                function fnUpdateTabs()
                                {
                                    if (parent.window.g_iIEVer >= 4) {
                                        if (parent.document.readyState == "complete"
                                                && parent.frames['frTabs'].document.readyState == "complete")
                                            parent.fnSetActiveSheet(0);
                                        else
                                            window.setTimeout("fnUpdateTabs();", 150);
                                    }
                                }

                                if (window.name != "frSheet")
                                    window.location.replace("../Libro1.htm");
                                else
                                    fnUpdateTabs();
                            //-->
                            </script>
                            <![endif]>
                            </head>

                            <body link=blue vlink=purple>

                                <table border=0 cellpadding=0 cellspacing=0 width=439 style='border-collapse:
                                       collapse;table-layout:fixed;width:330pt'>
                                    <col width=120 style='mso-width-source:userset;mso-width-alt:4388;width:90pt'>
                                        <col width=117 style='mso-width-source:userset;mso-width-alt:4278;width:88pt'>
                                            <col width=101 span=2 style='mso-width-source:userset;mso-width-alt:3693;
                                                 width:76pt'>

                                                <tr height=20 style='height:15.0pt'>
                                                    <td height=20 style='height:15.0pt'>Información</td>
                                                    <td colspan=2 style='mso-ignore:colspan'></td>
                                                </tr>
                                                <tr height=20 style='height:15.0pt'>
                                                    <td height=20 style='height:15.0pt'>Total de Piezas:</td>
                                                    <%total_pzs = Integer.parseInt(totPzs);%>
                                                    <td class=xl72 align=right><%=nf1.format(total_pzs)%></td>
                                                    <td  style='mso-ignore:colspan'></td>
                                                </tr>
                                                <tr height=20 style='height:15.0pt'>
                                                    <td height=20 style='height:15.0pt'>&nbsp;</td>
                                                    <td class=xl73 align=right>&nbsp;</td>
                                                    <td style='mso-ignore:colspan'></td>
                                                </tr>

                                                <tr height=20 style='height:15.0pt'>
                                                    <td height=20 colspan=3 style='height:15.0pt;mso-ignore:colspan'></td>
                                                </tr>
                                                <%
                                                    if (clave.equals("")) {
                                                        rset2 = con.consulta("SELECT P.F_NomPro,l.F_ClaPro, m.F_DesPro, SUM(F_ExiLot),P.F_ClaProve FROM tb_lote l, tb_medica m, tb_proveedor P  WHERE m.F_ClaPro = l.F_ClaPro AND l.F_ClaOrg=P.F_ClaProve AND F_ExiLot != 0 GROUP BY l.F_ClaPro, P.F_NomPro order by l.F_ClaPro+0");
                                                    } else {
                                                        rset2 = con.consulta("SELECT P.F_NomPro,l.F_ClaPro, m.F_DesPro, SUM(F_ExiLot),P.F_ClaProve FROM tb_lote l, tb_medica m, tb_proveedor P  WHERE m.F_ClaPro = l.F_ClaPro AND l.F_ClaOrg=P.F_ClaProve AND F_ExiLot != 0 and l.F_ClaPro='" + clave + "' GROUP BY l.F_ClaPro, P.F_NomPro order by l.F_ClaPro+0");
                                                    }
                                                %>
                                                <tr height=20 style='height:15.0pt'>
                                                    <td height=20 style='height:15.0pt;mso-ignore:colspan'>Proveedor</td>
                                                    <td class=xl66>Clave</td>
                                                    <td class=xl66>Descripción</td>
                                                    <td class=xl66>Existencia</td>
                                                </tr>
                                                <tr height=20 style='height:15.0pt'>

                                                    <%
                                                        while (rset2.next()) {
                                                            ixt_cad = rset2.getString("SUM(F_ExiLot)");
                                                            ixt_uni = Integer.parseInt(ixt_cad);
                                                    %>
                                                    <td height=20 class=xl75 style='height:15.0pt'><%=rset2.getString("P.F_NomPro")%></td>
                                                    <td height=20 class=xl75 style='height:15.0pt;mso-number-format:"@"'><%=rset2.getString("l.F_ClaPro")%></td>
                                                    <td height=20 class=xl75 style='height:15.0pt'><%=rset2.getString("m.F_DesPro")%></td>
                                                    <td height=20 class=xl75 style='height:15.0pt'><%=nf1.format(ixt_uni)%></td>  
                                                </tr>
                                                <% } %>





                                                <![if supportMisalignedColumns]>
                                                <tr height=0 style='display:none'>
                                                    <td width=120 style='width:90pt'></td>
                                                    <td width=117 style='width:88pt'></td>
                                                    <td width=101 style='width:76pt'></td>
                                                    <td width=101 style='width:76pt'></td>
                                                </tr>
                                                <![endif]>
                                                </table>

                                                </body>

                                                </html>
                                                <%
                                                        con.cierraConexion();
                                                    } catch (Exception e) {
                                                        System.out.println(e.getMessage());
                                                    }

                                                %>