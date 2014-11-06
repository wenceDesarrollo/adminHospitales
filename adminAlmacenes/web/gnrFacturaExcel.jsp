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
    response.setHeader("Content-Disposition", "attachment;filename=\"Factura_" + request.getParameter("fol_gnkl") + ".xls\"");
%>
<div>
    <h4>Folio de Factura: <%=request.getParameter("fol_gnkl")%></h4>
    <%
        try {
            con.conectar();
            try {
                ResultSet rset = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,DATE_FORMAT(F_FecCad,'%d/%m/%Y') AS F_FecCad,F_CantReq,F_CantSur,F_Costo,F_Iva,F_Monto, F_Ubicacion FROM facturas WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "' GROUP BY F_NomCli");
                while (rset.next()) {


    %>
    <h4>Cliente: <%=rset.getString(1)%></h4>
    <h4>Fecha de Entrega: <%=rset.getString(2)%></h4>
    <h4>Factura: <%=rset.getString(3)%></h4>
    <%
        int req = 0, sur = 0;
        Double imp = 0.0;
        ResultSet rset2 = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,DATE_FORMAT(F_FecCad,'%d/%m/%Y') AS F_FecCad,F_CantReq,F_CantSur,F_Costo,F_Iva,F_Monto, F_Ubicacion FROM facturas WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "'");
        while (rset2.next()) {
            req = req + rset2.getInt("F_CantReq");
            sur = sur + rset2.getInt("F_CantSur");
            imp = imp + rset2.getDouble("F_Monto");
            System.out.println(req);
        }
    %>

    <div class="row">
        <h5 class="col-sm-3">Total Solicitado: <%=formatter.format(req)%></h5>
        <h5 class="col-sm-3">Total Surtido: <%=formatter.format(sur)%></h5>
        <h5 class="col-sm-3">Total Importe: $ <%=formatterDecimal.format(imp)%></h5>
    </div>
    <%
                }
            } catch (Exception e) {

            }
            con.cierraConexion();
        } catch (Exception e) {

        }
    %>
    <br />
    <div class="panel panel-primary">
        <div class="panel-body">
            <table class="table table-bordered table-striped" id="datosCompras" border="1">
                <thead>
                    <tr>
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
                    <%
                        try {
                            con.conectar();
                            try {
                                ResultSet rset = con.consulta("SELECT F_NomCli,F_FecEnt,F_ClaDoc,F_ClaPro,F_DesPro,F_ClaLot,F_FecCad,SUM(F_CantReq),SUM(F_CantSur),F_Costo,F_Iva,sum(F_Monto), F_Ubicacion FROM facturas WHERE F_ClaDoc='" + request.getParameter("fol_gnkl") + "' GROUP BY F_ClaPro");
                                while (rset.next()) {
                    %>
                    <tr>
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