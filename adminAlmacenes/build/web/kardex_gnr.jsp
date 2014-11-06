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

ConectionDB_SAA con = new ConectionDB_SAA();
NumberFormat nf1 = NumberFormat.getInstance(Locale.US); 
DecimalFormat formatter2 = new DecimalFormat("#,###,###.##");

ResultSet rset2 = null;
ResultSet rset = null;
String totPzs="";
String totMon="";
String totPzsMed="";
String totMonMed="";
String totPzsMat="";
String totMonMat="";
String fecha_1= "";
String fecha_2= "";
String unidad_jv="",clave="",provee="";
int total_pzs=0,total_medi=0,total_cura=0;
double total_mon_medi=0.0,total_mon_cura=0.0, total_montos=0.0, total_tot=0.0, montos_res=0.0;
String ixt_cad="",ixt_cad2="",fecha="",folio="";
int cant_pzs=0, ixt_uni=0,cont=0,existencia=0,inventario=0,inventariof=0;
double cant_totMon=0.0,ixt_costo=0.0;
String only="";

	try {
		clave = request.getParameter("clave");       			   
		provee = request.getParameter("provee");       			         			   
        } catch (Exception e) { }
String but="r";
	  

response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition","attachment; filename=Concentrado de la  Clave: "+clave+".xls");


//ingresar un try y realizar una sola conexión
    try{
       con.conectar();
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
  if (parent.window.g_iIEVer>=4) {
   if (parent.document.readyState=="complete"
    && parent.frames['frTabs'].document.readyState=="complete")
   parent.fnSetActiveSheet(0);
  else
   window.setTimeout("fnUpdateTabs();",150);
 }
}
 
if (window.name!="frSheet")
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
  <td height=20 style='height:15.0pt'></td>  
  <td class=xl72 align=right></td>
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
       rset2 = con.consulta("SELECT F_Fecha,F_Doc,F_inv,F_Ingreso,F_Egreso,F_Final FROM tb_reporteclave WHERE F_Clave ='"+clave+"' and F_Provee='"+provee+"' ORDER BY F_Id+0");   
       System.out.println(con);
 %>
 <tr height=20 style='height:15.0pt'>
  <td height=20 style='height:15.0pt;mso-ignore:colspan'>Fecha</td>
  <td class=xl66>No. Remisión</td>
  <td class=xl66>Inv. Inicial / MOvimientos</td>
  <td class=xl66>Ingreso</td>
  <td class=xl66>Egreso</td>
  <td class=xl66>Inv. Final</td>
  </tr>
 <tr height=20 style='height:15.0pt'>
 
 <%
   while (rset2.next()) {
      
 %>
  <td height=20 class=xl75 style='height:15.0pt'><%=rset2.getString(1)%></td>
  <td height=20 class=xl75 style='height:15.0pt;mso-number-format:"@"' align="center"><%=rset2.getString(2)%></td>
  <td height=20 class=xl75 style='height:15.0pt' align="center"><%=nf1.format(rset2.getInt(3))%></td> 
  <td height=20 class=xl75 style='height:15.0pt' align="center"><%=nf1.format(rset2.getInt(4))%></td>
  <td height=20 class=xl75 style='height:15.0pt' align="center"><%=nf1.format(rset2.getInt(5))%></td>  
  <td height=20 class=xl75 style='height:15.0pt' align="center"><%=nf1.format(rset2.getInt(6))%></td>  
 </tr>
 <%} %>

 
  
  
 
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