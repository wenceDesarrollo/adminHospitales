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
<%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); %>
<%java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
<%java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###,###");
    DecimalFormat formatterDecimal = new DecimalFormat("#,###,##0.00");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator('.');
    custom.setGroupingSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    formatterDecimal.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB_LermaServer con = new ConectionDB_LermaServer();

    String fol_gnkl = "", fol_remi = "", orden_compra = "", fecha = "";
    try {
        if (request.getParameter("accion").equals("buscar")) {
            fol_gnkl = request.getParameter("fol_gnkl");
            fol_remi = request.getParameter("fol_remi");
            orden_compra = request.getParameter("orden_compra");
            fecha = request.getParameter("fecha");
        }
    } catch (Exception e) {

    }
    if (fol_gnkl == null) {
        fol_gnkl = "";
        fol_remi = "";
        orden_compra = "";
        fecha = "";
    }

    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment;filename=\"GlobalFacturas.xls\"");
%>
<div>

    <br />
    <div class="panel panel-primary">
        <div class="panel-body">
            <table class="table table-bordered table-striped" id="datosCompras" border="1">
                <thead>
                    <tr>
                        <td>Distribuidor</td>
                        <td>Fecha de Entrega</td>
                        <td>Factura</td>
                        <td>Clave</td>
                        <td>Descripcion</td>
                        <td>Lote</td>
                        <td>Caducidad</td>
                        <td>Req.</td>
                        <td>Ent.</td>
                        <td>Costo U</td>
                        <td>IVA</td>
                        <td>Importe</td>
                    </tr>
                </thead>
                <tbody>
                    <%                        try {
                            con.conectar();
                            try {
                                ResultSet rset = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,F_FecCad,SUM(F_CantReq),SUM(F_CantSur),F_Costo,F_Iva,sum(F_Monto), F_Ubicacion FROM facturas group by F_NomCli, F_ClaPro, F_ClaDoc order by F_ClaDoc+0");
                                while (rset.next()) {
                    %>
                    <tr>
                        <td><%=rset.getString(1)%></td>
                        <td><%=rset.getString(2)%></td>
                        <td><%=rset.getString(3)%></td>
                        <td><%=rset.getString(4)%></td>
                        <td><%=rset.getString(5)%></td>
                        <td><%=rset.getString(6)%></td>
                        <td><%=rset.getString(7)%></td>
                        <td><%=formatterDecimal.format(rset.getInt(8))%></td>
                        <td><%=formatterDecimal.format(rset.getInt(9))%></td>
                        <td>$ <%=formatterDecimal.format(rset.getDouble(10))%></td>
                        <td>$ <%=formatterDecimal.format(rset.getDouble(11))%></td>
                        <td>$ <%=formatterDecimal.format(rset.getDouble(12))%></td>
                    </tr>
                    <%
                                }
                            } catch (Exception e) {
                                System.out.println(e.getMessage());
                            }
                            con.cierraConexion();
                        } catch (Exception e) {

                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>