package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormatSymbols;
import java.text.DecimalFormat;
import java.sql.ResultSet;
import conn.*;

public final class historialOC_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); 
      out.write('\n');
java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
      out.write('\n');
java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); 
      out.write('\n');

    DecimalFormat formatter = new DecimalFormat("#,###,###");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB_SAA con = new ConectionDB_SAA();
    String Fecha = "";
    String fechaCap = "";
    String Proveedor = "";
    try {
        fechaCap = df2.format(df3.parse(request.getParameter("Fecha")));
        Fecha = request.getParameter("Fecha");
    } catch (Exception e) {

    }
    if(fechaCap==null){
        fechaCap="";
    }
    try {
        Proveedor = request.getParameter("Proveedor");
    } catch (Exception e) {

    }
    if(Proveedor==null){
        Proveedor="";
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Estilos CSS -->\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/cupertino/jquery-ui-1.10.3.custom.css\" />\n");
      out.write("        <link href=\"css/navbar-fixed-top.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/datepicker3.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/dataTables.bootstrap.css\">\n");
      out.write("        <!---->\n");
      out.write("        <title>SIE Sistema de Ingreso de Entradas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>SIALSS</h1>\n");
      out.write("            <h4>SISTEMA INTEGRAL DE ADMINISTRACIÓN Y LOGÍSTICA PARA SERVICIOS DE SALUD</h4>\n");
      out.write("            <div class=\"navbar navbar-default\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                            <span class=\"icon-bar\"></span>\n");
      out.write("                        </button>\n");
      out.write("                        <a class=\"navbar-brand\" href=\"main_menu.jsp\">Inicio</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"navbar-collapse collapse\">\n");
      out.write("                        <ul class=\"nav navbar-nav\">\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Men&uacute; de Opciones <b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"indexMain.jsp\">Men&uacute; Principal</a></li>\n");
      out.write("                                    <li><a href=\"factura.jsp\">Ingresos en Almac&eacute;n</a></li>\n");
      out.write("                                    <li><a href=\"entregas.jsp\">Entrega a Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"exist.jsp\">Existencias en CEDIS</a></li>\n");
      out.write("                                    <li><a href=\"historialOC.jsp\">Historial OC</a></li>\n");
      out.write("                                    <!--li><a href=\"rep.jsp\">Reporteador</a></li>\n");
      out.write("                                    <!--li><a href=\"requerimiento.jsp\">Carga de Requerimiento</a></li>\n");
      out.write("                                    <li class=\"divider\"></li>\n");
      out.write("                                    <li><a href=\"medicamento.jsp\">Catálogo de Medicamento</a></li>\n");
      out.write("                                    <li><a href=\"catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"marcas.jsp\">Catálogo de Marcas</a></li>\n");
      out.write("                                    <li><a href=\"reimpresion.jsp\">Reimpresión de Compras</a></li>\n");
      out.write("                                    <li><a href=\"reimp_factura.jsp\">Reimpresión de Facturas</a></li>\n");
      out.write("                                    <li class=\"divider\"></li>\n");
      out.write("                                    <li><a href=\"http://192.168.2.170:8081/UbicacionesConsolidado\" target=\"_blank\">Ubicaciones</a></li-->\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <!--li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">ADASU<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"../captura.jsp\">Captura de Insumos</a></li>\n");
      out.write("                                    <li class=\"divider\"></li>\n");
      out.write("                                    <li><a href=\"../catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"../reimpresion.jsp\">Reimpresión de Docs</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li-->\n");
      out.write("                            ");
                                if (usua.equals("root")) {
                            
      out.write("\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Usuario<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"usuarios/usuario_nuevo.jsp\">Nuevo Usuario</a></li>\n");
      out.write("                                    <li><a href=\"usuarios/edita_usuario.jsp\">Edicion de Usuarios</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            ");
                                }
                            
      out.write("\n");
      out.write("                        </ul>\n");
      out.write("                        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                            <li><a href=\"\"><span class=\"glyphicon glyphicon-user\"></span> ");
      out.print(usua);
      out.write("</a></li>\n");
      out.write("                            <li class=\"active\"><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div><!--/.nav-collapse -->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <h3>Historial de Órdenes de Compra</h3>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <form action=\"historialOC.jsp\" method=\"post\">\n");
      out.write("                        <h4 class=\"col-sm-2\">Proveedor</h4>\n");
      out.write("                        <div class=\"col-sm-5\">\n");
      out.write("                            <select class=\"form-control\" name=\"Proveedor\" id=\"Proveedor\" onchange=\"this.form.submit();\">\n");
      out.write("                                <option value=\"\">--Proveedor--</option>\n");
      out.write("                                ");

                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("select F_ClaProve, F_NomPro from tb_proveedor order by F_NomPro");
                                        while (rset.next()) {
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rset.getString(1));
      out.write('"');
      out.write('>');
      out.print(rset.getString(2));
      out.write("</option>\n");
      out.write("                                ");

                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                        System.out.println(e.getMessage());
                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                        <h4 class=\"col-sm-2\">Fecha de Captura</h4>\n");
      out.write("                        <div class=\"col-sm-2\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" data-date-format=\"dd/mm/yyyy\" id=\"Fecha\" name=\"Fecha\"  onchange=\"this.form.submit();\" />\n");
      out.write("                        </div>\n");
      out.write("                        <a class=\"btn btn-primary\" href=\"historialOC.jsp\">Todo</a>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <br />\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"panel panel-primary\">\n");
      out.write("                <div class=\"panel-body\">\n");
      out.write("                    <table class=\"table table-bordered table-striped\" id=\"datosCompras\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <td class=\"text-center\">No. Orden</td>\n");
      out.write("                                <td class=\"text-center\">Proveedor</td>\n");
      out.write("                                <td class=\"text-center\">Fecha de Captura</td>\n");
      out.write("                                <td class=\"text-center\">Cant x Recibir</td>\n");
      out.write("                                <td class=\"text-center\">Fecha a Recibir</td>\n");
      out.write("                                <td class=\"text-center\">Cancelado</td>\n");
      out.write("                                <td class=\"text-center\">Pendiente x Recibir</td>\n");
      out.write("                                <td class=\"text-center\">Abierta</td>\n");
      out.write("                                <td class=\"text-center\">Recibido</td>\n");
      out.write("                                <td class=\"text-center\">Fecha Recepción</td>\n");
      out.write("                                <td class=\"text-center\">Cant Recibida</td>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            ");

                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select o.F_NoCompra, p.F_NomPro, DATE_FORMAT(o.F_Fecha, '%d/%m/%Y') AS F_Fecha, SUM(o.F_Cant), DATE_FORMAT(o.F_FecSur, '%d/%m/%Y') AS F_FecSur, o.F_StsPed from tb_pedidoisem o, tb_proveedor p where o.F_Provee = F_ClaProve and o.F_Fecha like '%" + fechaCap + "%' and p.F_ClaProve like '%"+Proveedor+"%' and F_StsPed != 0 group by  o.F_NoCompra");
                                    while (rset.next()) {
                                        String pendiente="", abierta="";
                                        String cancelado = "";
                                        if (rset.getString(6).equals("2")) {
                                            cancelado = "X";
                                        }
                                        String recibido = "", fecRecibo = "";
                                        int cantRecib = 0;
                                        ResultSet rset2 = con.consulta("select F_OrdCom, SUM(F_CanCom), DATE_FORMAT(F_FecApl, '%d/%m/%Y') as F_FecApl from tb_compra_web where F_OrdCom = '" + rset.getString(1) + "' group by F_OrdCom ");
                                        while (rset2.next()) {
                                            recibido = "X";
                                            cantRecib = rset2.getInt(2);
                                            fecRecibo = rset2.getString(3);
                                        }
                                        
                                        if(rset.getInt(4)>cantRecib && cantRecib!=0){
                                            recibido = "";
                                            abierta="X";
                                        } 
                                        if(cantRecib==0){
                                            pendiente="X";
                                        }
                                        if (cancelado.equals("X")){
                                            pendiente="";
                                        }
                            
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>");
      out.print(rset.getString(1));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rset.getString(2));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rset.getString(3));
      out.write("</td>\n");
      out.write("                                <td class=\"text-right\">");
      out.print(formatter.format(rset.getInt(4)));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rset.getString(5));
      out.write("</td>\n");
      out.write("                                <td class=\"text-center\">");
      out.print(cancelado);
      out.write("</td>\n");
      out.write("                                <td class=\"text-center\">");
      out.print(pendiente);
      out.write("</td>\n");
      out.write("                                <td class=\"text-center\">");
      out.print(abierta);
      out.write("</td>\n");
      out.write("                                <td class=\"text-center\">");
      out.print(recibido);
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(fecRecibo);
      out.write("</td>\n");
      out.write("                                <td class=\"text-right\">");
      out.print(formatter.format(cantRecib));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                }
                            
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <br><br><br>\n");
      out.write("        <div class=\"navbar navbar-fixed-bottom navbar-inverse\">\n");
      out.write("            <div class=\"text-center text-muted\">\n");
      out.write("                GNK Logística || Desarrollo de Aplicaciones 2009 - 2014 <span class=\"glyphicon glyphicon-registration-mark\"></span><br />\n");
      out.write("                Todos los Derechos Reservados\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- \n");
      out.write("================================================== -->\n");
      out.write("<!-- Se coloca al final del documento para que cargue mas rapido -->\n");
      out.write("<!-- Se debe de seguir ese orden al momento de llamar los JS -->\n");
      out.write("<script src=\"js/jquery-1.9.1.js\"></script>\n");
      out.write("<script src=\"js/bootstrap.js\"></script>\n");
      out.write("<script src=\"js/jquery-ui-1.10.3.custom.js\"></script>\n");
      out.write("<script src=\"js/bootstrap-datepicker.js\"></script>\n");
      out.write("<script src=\"js/jquery.dataTables.js\"></script>\n");
      out.write("<script src=\"js/dataTables.bootstrap.js\"></script>\n");
      out.write("<script>\n");
      out.write("                                $(document).ready(function() {\n");
      out.write("                                    $('#datosCompras').dataTable();\n");
      out.write("                                });\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("    $(function() {\n");
      out.write("        $(\"#Fecha\").datepicker();\n");
      out.write("        $(\"#Fecha\").datepicker('option', {dateFormat: 'dd/mm/yy'});\n");
      out.write("    });\n");
      out.write("</script>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
