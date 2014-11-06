package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormatSymbols;
import java.text.DecimalFormat;
import java.sql.ResultSet;
import conn.*;

public final class ordenesCompra_jsp extends org.apache.jasper.runtime.HttpJspBase
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
java.text.DateFormat df1 = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
      out.write('\n');
java.text.DateFormat df2 = new java.text.SimpleDateFormat("dd/MM/yyyy"); 
      out.write('\n');


    DecimalFormat formatter = new DecimalFormat("#,###,###");
    DecimalFormatSymbols custom = new DecimalFormatSymbols();
    custom.setDecimalSeparator('.');
    custom.setGroupingSeparator(',');
    formatter.setDecimalFormatSymbols(custom);
    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("Usuario") != null) {
        usua = (String) sesion.getAttribute("Usuario");
    } else {
        //response.sendRedirect("indexIsem.jsp");
    }
    ConectionDB_LermaServer con = new ConectionDB_LermaServer();
    String NoCompra = "", Fecha = "";

    try {
        Fecha = request.getParameter("Fecha");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    if (Fecha == null) {
        Fecha = "";
    }
    try {
        NoCompra = request.getParameter("NoCompra");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    if (Fecha == null) {
        NoCompra = "";
    }

    String claPro = "", desPro = "";

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Estilos CSS -->\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/cupertino/jquery-ui-1.10.3.custom.css\" />\n");
      out.write("        <link href=\"css/navbar-fixed-top.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/dataTables.bootstrap.css\">\n");
      out.write("        <!---->\n");
      out.write("        <title>SIALSS</title>\n");
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
      out.write("                        <a class=\"navbar-brand\" href=\"indexMain.jsp\">Inicio</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"navbar-collapse collapse\">\n");
      out.write("                        <ul class=\"nav navbar-nav\">\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Men&uacute; de Opciones <b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"indexMain.jsp\">Men&uacute; Principal</a></li>\n");
      out.write("                                    <li><a href=\"entregas.jsp\">Entrega a Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"exist.jsp\">Existencias en CEDIS</a></li>\n");
      out.write("                                    <li><a href=\"Entrega.jsp\">Fecha de Recibo en CEDIS</a></li>\n");
      out.write("                                    <li><a href=\"historialOC.jsp\">Historial OC</a></li>\n");
      out.write("                                    <li><a href=\"factura.jsp\">Ingresos en Almac&eacute;n</a></li>\n");
      out.write("                                    <li><a href=\"ordenesCompra.jsp\">Órdenes de Compra</a></li>\n");
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
      out.write("                                    <li><a href=\"captura.jsp\">Captura de Insumos</a></li>\n");
      out.write("                                    <li class=\"divider\"></li>\n");
      out.write("                                    <li><a href=\"catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"reimpresion.jsp\">Reimpresión de Docs</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li-->\n");
      out.write("                           \n");
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
      out.write("            <form method=\"post\" action=\"ordenesCompra.jsp\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <label class=\"col-sm-1\">\n");
      out.write("                        <h4>Proveedor</h4>\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <select class=\"form-control\" name=\"Proveedor\" id=\"Proveedor\" onchange=\"SelectProve(this.form);\n");
      out.write("                                document.getElementById('Fecha').focus()\">\n");
      out.write("                            <option value=\"\">--Proveedor--</option>\n");
      out.write("                            ");

                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select F_ClaProve, F_NomPro from tb_proveedor p, tb_pedidoisem o where p.F_ClaProve = o.F_Provee group by o.F_Provee order by F_NomPro");
                                    while (rset.next()) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rset.getString(1));
      out.write("\" >");
      out.print(rset.getString(2));
      out.write("</option>\n");
      out.write("                            ");

                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <label class=\"col-sm-3\">\n");
      out.write("                        <h4>Fecha de Entrega a GNKL:</h4>\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"col-sm-2\">\n");
      out.write("                        <input type=\"text\" class=\"form-control\" data-date-format=\"dd/mm/yyyy\" id=\"Fecha\" name=\"Fecha\" value=\"\" onchange=\"document.getElementById('Hora').focus()\" />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br/>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <label class=\"col-sm-1\">\n");
      out.write("                        <h4>Usuario:</h4>\n");
      out.write("                    </label>\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <select class=\"form-control\" name=\"Usuario\" id=\"Usuario\" onchange=\"\">\n");
      out.write("                            <option value=\"\">--Usuarios--</option>\n");
      out.write("                            ");

                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select u.F_IdUsu, u.F_Usuario from tb_usuariosisem u, tb_pedidoisem p where F_Usuario !='root' and u.F_IdUsu = p.F_IdUsu group by F_IdUsu");
                                    while (rset.next()) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rset.getString(1));
      out.write("\" >");
      out.print(rset.getString(2));
      out.write("</option>\n");
      out.write("                            ");

                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <br/>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12\">\n");
      out.write("                        <button class=\"btn btn-primary btn-block\" name=\"accion\" value=\"fecha\">Buscar</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"row\" style=\"width: 90%; margin: auto;\">\n");
      out.write("            <div class=\"col-sm-6\">\n");
      out.write("                <form method=\"post\">\n");
      out.write("                    <input value=\"");
      out.print(Fecha);
      out.write("\" name=\"Fecha\" class=\"hidden\"/>\n");
      out.write("                    <input value=\"");
      out.print(request.getParameter("Usuario"));
      out.write("\" name=\"Usuario\"  class=\"hidden\"/>\n");
      out.write("                    <input value=\"");
      out.print(request.getParameter("Proveedor"));
      out.write("\" name=\"Proveedor\"  class=\"hidden\"/>\n");
      out.write("                    <label class=\"col-sm-12\">\n");
      out.write("                        <h4>Órdenes de Compra: </h4>\n");
      out.write("                    </label>\n");
      out.write("                    <table class=\"table table-bordered table-condensed table-striped\" id=\"datosCompras\">\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>No. Orden</td>\n");
      out.write("                                <td>Capturó</td>\n");
      out.write("                                <td>Proveedor</td>\n");
      out.write("                                <td>Fecha Entrega</td>\n");
      out.write("                                <td>Hora entrega</td>\n");
      out.write("                                <td>Ver</td>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        <tbody>\n");
      out.write("                            ");

                                String fecha = "";
                                try {
                                    fecha = df1.format(df2.parse(Fecha));
                                } catch (Exception e) {

                                }
                                try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select o.F_NoCompra, u.F_Usuario, p.F_NomPro,DATE_FORMAT(o.F_FecSur, '%d/%m/%Y') F_FecSur, F_HorSur, F_Fecha from tb_pedidoisem o, tb_proveedor p, tb_usuariosisem u where u.F_IdUsu = o.F_IdUsu and  o.F_Provee = p.F_ClaProve and o.F_FecSur like  '%" + fecha + "%' and o.F_IdUsu like '%" + request.getParameter("Usuario") + "' and o.F_Provee like '%" + request.getParameter("Proveedor") + "' group by o.F_NoCompra");
                                    while (rset.next()) {
                            
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
      out.write("                                <td>");
      out.print(rset.getString(4));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rset.getString(5));
      out.write("</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <button class=\"btn btn-success text-center\" name=\"NoCompra\" value=\"");
      out.print(rset.getString(1));
      out.write("\"><span class=\"glyphicon glyphicon-search\"></span></button>\n");
      out.write("                                </td>\n");
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
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-sm-6\">\n");
      out.write("                <div class=\"panel panel-primary\">\n");
      out.write("                    <div class=\"panel-heading\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"panel-body\">\n");
      out.write("                        ");
                try {
                                con.conectar();
                                ResultSet rset = con.consulta("select o.F_NoCompra, p.F_NomPro, DATE_FORMAT(o.F_FecSur, '%d/%m/%Y'), F_HorSur, F_Usuario, F_StsPed from tb_pedidoisem o, tb_proveedor p, tb_usuariosisem u where u.F_IdUsu = o.F_IdUsu and  o.F_Provee = p.F_ClaProve and F_NoCompra = '" + NoCompra + "'  group by o.F_NoCompra");
                                while (rset.next()) {
                        
      out.write("\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-sm-2\">\n");
      out.write("                                <h4>\n");
      out.write("                                    Orden: ");
      out.print(NoCompra);
      out.write("\n");
      out.write("                                </h4>\n");
      out.write("                            </div>\n");
      out.write("                            <!--div class=\"col-sm-1 col-sm-offset-9\">\n");
      out.write("                                <a class=\"btn btn-default\" target=\"_blank\" href=\"imprimeOrdenCompra.jsp?ordenCompra=");
      out.print(NoCompra);
      out.write("\"><span class=\"glyphicon glyphicon-print\"></span></a>\n");
      out.write("                            </div-->\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"panel-body\">\n");
      out.write("                            <form name=\"FormBusca\" action=\"CapturaPedidos\" method=\"post\">\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <h4 class=\"col-sm-3\">Orden No. </h4>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <input class=\"form-control\" value=\"");
      out.print(rset.getString(1));
      out.write("\" name=\"NoCompra\" id=\"NoCompra\" readonly=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <h4 class=\"col-sm-3\">Capturó: </h4>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <input class=\"form-control\" value=\"");
      out.print(rset.getString("F_Usuario"));
      out.write("\" readonly=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                                ");

                                    System.out.println("###" + rset.getString("F_StsPed"));
                                    if (rset.getString("F_StsPed").equals("2")) {
                                
      out.write("\n");
      out.write("                                <h4 class=\"text-danger\">FOLIO CANCELADO</h4>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <h4 class=\"col-sm-3\">Proveedor: </h4>\n");
      out.write("                                    <div class=\"col-sm-9\">\n");
      out.write("                                        <input class=\"form-control\" value=\"");
      out.print(rset.getString(2));
      out.write("\" readonly=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <h4 class=\"col-sm-3\">Fecha de Entrega: </h4>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <input class=\"form-control\" value=\"");
      out.print(rset.getString(3));
      out.write("\" readonly=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <h4 class=\"col-sm-3\">Hora de Entrega: </h4>\n");
      out.write("                                    <div class=\"col-sm-3\">\n");
      out.write("                                        <input class=\"form-control\" value=\"");
      out.print(rset.getString(4));
      out.write("\" readonly=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                ");


                                    if (rset.getString("F_StsPed").equals("2")) {
                                        ResultSet rset2 = con.consulta("select F_Observaciones from tb_obscancela where F_NoCompra = '" + NoCompra + "' ");
                                        while (rset2.next()) {
                                
      out.write("\n");
      out.write("                                <br/>\n");
      out.write("                                <textarea class=\"form-control\" name=\"Observa\" id=\"Observa\" readonly=\"\">");
      out.print(rset2.getString(1));
      out.write("</textarea>\n");
      out.write("                                <br>\n");
      out.write("                                ");

                                        }
                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                                <br/>\n");
      out.write("                                ");

                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                
      out.write("\n");
      out.write("                            </form>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <br/>\n");
      out.write("                                <table class=\"table table-bordered table-condensed table-striped\">\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td><strong>Clave</strong></td>\n");
      out.write("                                        <td><strong>Descripción</strong></td>\n");
      out.write("                                        <!--td><strong>Lote</strong></td>\n");
      out.write("                                        <td><strong>Caducidad</strong></td-->\n");
      out.write("                                        <td><strong>Cantidad</strong></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("select s.F_Clave, m.F_DesPro, s.F_Lote, DATE_FORMAT(F_Cadu, '%d/%m/%Y'), s.F_Cant, F_IdIsem from tb_pedidoisem s, tb_medica m where s.F_Clave = m.F_ClaPro and F_NoCompra = '" + NoCompra + "' ");
                                            while (rset.next()) {
                                    
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>");
      out.print(rset.getString(1));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(rset.getString(2));
      out.write("</td>\n");
      out.write("                                        <!--td>");
      out.print(rset.getString(3));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(rset.getString(4));
      out.write("</td-->\n");
      out.write("                                        <td>");
      out.print(formatter.format(rset.getInt(5)));
      out.write("</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    
      out.write("\n");
      out.write("\n");
      out.write("                                </table>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
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
      out.write("    <!-- \n");
      out.write("    ================================================== -->\n");
      out.write("    <!-- Se coloca al final del documento para que cargue mas rapido -->\n");
      out.write("    <!-- Se debe de seguir ese orden al momento de llamar los JS -->\n");
      out.write("    <script src=\"js/jquery-1.9.1.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.js\"></script>\n");
      out.write("    <script src=\"js/jquery-ui-1.10.3.custom.js\"></script>\n");
      out.write("    <script src=\"js/jquery.dataTables.js\"></script>\n");
      out.write("    <script src=\"js/dataTables.bootstrap.js\"></script>\n");
      out.write("    <script>\n");
      out.write("                            $(document).ready(function() {\n");
      out.write("                                $('#datosCompras').dataTable();\n");
      out.write("                            });\n");
      out.write("\n");
      out.write("                            $(function() {\n");
      out.write("                                $(\"#Fecha\").datepicker();\n");
      out.write("                                $(\"#Fecha\").datepicker('option', {dateFormat: 'dd/mm/yy'});\n");
      out.write("                            });\n");
      out.write("    </script>\n");
      out.write("</html>\n");
      out.write("\n");
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
