<%-- 
    Document   : index
    Created on : 17/02/2014, 03:34:46 PM
    Author     : Americo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.*" %>
<!DOCTYPE html>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%

    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB_LermaServer con = new ConectionDB_LermaServer();

    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment;filename=\"Remision_"+request.getParameter("F_OrdCom")+"_" + request.getParameter("F_FolRemi") + ".xls\"");
%>
<table border="1">
    <thead>
        <tr>
            <td>No. Folio</td>
            <td>Folio Remisión</td>
            <td>Orden de Compra</td>
            <td>Fecha</td>
            <td>Proveedor</td>
            <td>Clave</td>
            <td>Descripcion</td>
            <td>Lote</td>
            <td>Caducidad</td>
            <td>Cantidad</td>
            <td>Costo U</td>
            <td>IVA</td>
            <td>Importe</td>
        </tr>
    </thead>
    <tbody>
        <%                                    try {
                con.conectar();
                try {
                    ResultSet rset = con.consulta("SELECT F_ClaDoc, F_FolRemi, F_OrdCom, F_FecApl, F_User, F_NomPro, F_ClaPro, F_DesPro, F_ClaLot, F_FecCad, F_CanCom, F_Costo, F_ImpTo, F_ComTot FROM compras c WHERE F_OrdCom = '" + request.getParameter("F_OrdCom") + "' and F_FolRemi='" + request.getParameter("F_FolRemi") + "' GROUP BY F_IdCom;");
                    while (rset.next()) {
        %>
        <tr>

            <td><%=rset.getString(1)%></td>
            <td><%=rset.getString(2)%></td>
            <td><%=rset.getString(3)%></td>
            <td><%=rset.getString(4)%></td>
            <td><%=rset.getString(6)%></td>
            <td><%=rset.getString(7)%></td>
            <td><%=rset.getString(8)%></td>
            <td><%=rset.getString(9)%></td>
            <td><%=rset.getString(10)%></td>
            <td><%=rset.getString(11)%></td>
            <td><%=rset.getString(12)%></td>
            <td><%=rset.getString(13)%></td>
            <td><%=rset.getString(14)%></td>
        </tr>
        <%
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                con.cierraConexion();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>
    </tbody>
</table>