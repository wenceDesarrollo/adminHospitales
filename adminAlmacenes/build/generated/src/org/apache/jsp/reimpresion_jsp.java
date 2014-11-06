package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import conn.*;

public final class reimpresion_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
java.text.DateFormat df = new java.text.SimpleDateFormat("yyyyMMddhhmmss"); 
      out.write('\n');
java.text.DateFormat df2 = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
      out.write('\n');
java.text.DateFormat df3 = new java.text.SimpleDateFormat("dd/MM/yyyy"); 
      out.write('\n');


    HttpSession sesion = request.getSession();
    String usua = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
    } else {
        //response.sendRedirect("index.jsp");
    }
    ConectionDB con = new ConectionDB();

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

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
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
      out.write("            <!--div class=\"navbar navbar-default\">\n");
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
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Entradas<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"captura.jsp\">Entrada Manual</a></li>\n");
      out.write("                                    <li><a href=\"compraAuto2.jsp\">Entrada Automática OC ISEM</a></li>\n");
      out.write("                                    <li><a href=\"reimpresion.jsp\">Reimpresión de Compras</a></li>\n");
      out.write("                                    <li><a href=\"ordenesCompra.jsp\">Órdenes de Compras</a></li>\n");
      out.write("                                    <li><a href=\"kardexClave.jsp\">Kardex Claves</a></li>\n");
      out.write("                                    <li><a href=\"Ubicaciones/Consultas.jsp\">Ubicaciones</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Facturación<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"requerimiento.jsp\">Carga de Requerimiento</a></li>\n");
      out.write("                                    <li><a href=\"factura.jsp\">Facturación Automática</a></li>\n");
      out.write("                                     <li><a href=\"reimp_factura.jsp\">Administrar Remisiones</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Catálogos<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"medicamento.jsp\">Catálogo de Medicamento</a></li>\n");
      out.write("                                    <li><a href=\"catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                                    <li><a href=\"marcas.jsp\">Catálogo de Marcas</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"dropdown\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Fecha Recibo<b class=\"caret\"></b></a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a href=\"Entrega.jsp\">Fecha de Recibo en CEDIS</a></li>     \n");
      out.write("                                    <li><a href=\"historialOC.jsp\">Historial OC</a></li>                                  \n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("            <!--li class=\"dropdown\">\n");
      out.write("                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">ADASU<b class=\"caret\"></b></a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    <li><a href=\"../captura.jsp\">Captura de Insumos</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"../catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                    <li><a href=\"../reimpresion.jsp\">Reimpresión de Docs</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            \n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <li><a href=\"\"><span class=\"glyphicon glyphicon-user\"></span> ");
      out.print(usua);
      out.write("</a></li>\n");
      out.write("            <li class=\"active\"><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span></a></li>\n");
      out.write("        </ul>\n");
      out.write("    </div><!--/.nav-collapse >\n");
      out.write("</div>\n");
      out.write("</div-->\n");
      out.write("            <hr/>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <h3>Reimpresion de folios de Compras</h3>\n");
      out.write("                <h4>Seleccione el folio a imprimir</h4>\n");
      out.write("\n");
      out.write("                <br />\n");
      out.write("                <div class=\"panel panel-primary\">\n");
      out.write("                    <div class=\"panel-body table-responsive\">\n");
      out.write("                        <table class=\"table table-bordered table-striped\" id=\"datosCompras\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>No. Folio</td>\n");
      out.write("                                    <td>Folio Remisión</td>\n");
      out.write("                                    <td>Orden de Compra</td>\n");
      out.write("                                    <td>Fecha</td>\n");
      out.write("                                    <td>Usuario</td>\n");
      out.write("                                    <td>Proveedor</td>\n");
      out.write("                                    <td>Compra</td>\n");
      out.write("                                    <td>REP ISEM</td>\n");
      out.write("                                    <td>Marbete</td>\n");
      out.write("                                    <td>Ver Compra</td>\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                ");

                                    try {
                                        con.conectar();
                                        try {
                                            ResultSet rset = con.consulta("SELECT c.F_ClaDoc, c.F_FolRemi, c.F_OrdCom, c.F_FecApl, c.F_User, p.F_NomPro FROM tb_compra c, tb_proveedor p where c.F_ProVee = p.F_ClaProve GROUP BY F_ClaDoc; ");
                                            while (rset.next()) {
                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("\n");
      out.write("                                    <td>");
      out.print(rset.getString(1));
      out.write("</td>\n");
      out.write("                                    <td><button type=\"submit\" class=\"btn btn-default btn-block\" data-toggle=\"modal\" data-target=\"#EditaRemision\" id=\"");
      out.print(rset.getString(1));
      out.write(',');
      out.print(rset.getString(2));
      out.write("\" onclick=\"ponerRemision(this.id)\">");
      out.print(rset.getString(2));
      out.write("</button>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>");
      out.print(rset.getString(3));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(df3.format(df2.parse(rset.getString(4))));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rset.getString(5));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(rset.getString(6));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form action=\"reimpReporte.jsp\" target=\"_blank\">\n");
      out.write("                                            <input class=\"hidden\" name=\"fol_gnkl\" value=\"");
      out.print(rset.getString(1));
      out.write("\">\n");
      out.write("                                            <button class=\"btn btn-block btn-primary\">Imprimir</button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form action=\"reimpISEM.jsp\" target=\"_blank\">\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-primary btn-block\" data-toggle=\"modal\" data-target=\"#Observaciones\" name=\"accion\" value=\"remisionCamion\" id=\"");
      out.print(rset.getString(1));
      out.write("\" onclick=\"ponerFolio(this.id)\">Imprimir</button>\n");
      out.write("                                            <input class=\"hidden\" name=\"fol_gnkl\" value=\"");
      out.print(rset.getString(1));
      out.write("\">\n");
      out.write("                                            <!--button class=\"btn btn-block btn-primary\">Imprimir</button-->\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form action=\"reimp_marbete.jsp\" target=\"_blank\">\n");
      out.write("                                            <input class=\"hidden\" name=\"fol_gnkl\" value=\"");
      out.print(rset.getString(1));
      out.write("\">\n");
      out.write("                                            <button class=\"btn btn-block btn-primary\">Imprimir</button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form action=\"verCompra.jsp\" method=\"post\">\n");
      out.write("                                            <input class=\"hidden\" name=\"fol_gnkl\" value=\"");
      out.print(rset.getString(1));
      out.write("\">\n");
      out.write("                                            <button class=\"btn btn-block btn-primary\">Ver Compra</button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                            }
                                        } catch (Exception e) {

                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--\n");
      out.write("               Modal\n");
      out.write("        -->\n");
      out.write("        <div class=\"modal fade\" id=\"Observaciones\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"basicModal\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <form action=\"reimpISEM.jsp\" target=\"_blank\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <input name=\"idCom\" id=\"idCom\" class=\"hidden\" />\n");
      out.write("                            <h4 class=\"modal-title\" id=\"myModalLabel\">Fecha de Recepción</h4>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12\">\n");
      out.write("                                    <input type=\"date\" name=\"fecRecepcion\" id=\"fecRecepcion\" class=\"form-control\" />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <h4 class=\"modal-title\" id=\"myModalLabel\">Fecha de Revisión</h4>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12\">\n");
      out.write("                                    <input type=\"date\" name=\"fecRevision\" id=\"fecRevision\" class=\"form-control\" />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div style=\"display: none;\" class=\"text-center\" id=\"Loader\">\n");
      out.write("                                <img src=\"imagenes/ajax-loader-1.gif\" height=\"150\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\" onclick=\"return validaRemision();\" name=\"accion\" value=\"actualizarCB\">Imprimir</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"modal fade\" id=\"EditaRemision\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"basicModal\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                    <form action=\"Modificaciones\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h3>Edición de remisiones</h3>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <input name=\"idRem\" id=\"idRem\" class=\"form-control\" />\n");
      out.write("                            <h4 class=\"modal-title\" id=\"myModalLabel\">Remisión Incorrecta</h4>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12\">\n");
      out.write("                                    <input type=\"text\" name=\"remiIncorrecta\" id=\"remiIncorrecta\" class=\"form-control\" readonly=\"\" />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <h4 class=\"modal-title\" id=\"myModalLabel\">Remisión</h4>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12\">\n");
      out.write("                                    <input type=\"text\" name=\"remiCorrecta\" id=\"remiCorrecta\" class=\"form-control\" />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <h4 class=\"modal-title\" id=\"myModalLabel\">Contraseña</h4>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12\">\n");
      out.write("                                    <input type=\"password\" name=\"fecRecepcion\" id=\"remiContraseña\" class=\"form-control\"  onkeyup=\"validaContra(this.id);\" />\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div style=\"display: none;\" class=\"text-center\" id=\"LoaderRemi\">\n");
      out.write("                                <img src=\"imagenes/ajax-loader-1.gif\" height=\"150\" />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"modal-footer\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\" onclick=\"return validaRemision();\" name=\"accion\" value=\"actualizarRemi\" id=\"actualizaRemi\" disabled>Actualizar</button>\n");
      out.write("                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!--\n");
      out.write("        /Modal\n");
      out.write("        -->\n");
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
      out.write("                                    $(document).ready(function() {\n");
      out.write("                                        $('#datosCompras').dataTable();\n");
      out.write("                                    });\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("    $(function() {\n");
      out.write("        $(\"#fecha\").datepicker();\n");
      out.write("        $(\"#fecha\").datepicker('option', {dateFormat: 'dd/mm/yy'});\n");
      out.write("    });\n");
      out.write("\n");
      out.write("    function ponerFolio(id) {\n");
      out.write("        document.getElementById('idCom').value = id;\n");
      out.write("        document.getElementById('idCom').value = id;\n");
      out.write("    }\n");
      out.write("\n");
      out.write("\n");
      out.write("    function ponerRemision(id) {\n");
      out.write("        var elem = id.split(',');\n");
      out.write("        document.getElementById('idRem').value = elem[0];\n");
      out.write("        document.getElementById('remiIncorrecta').value = elem[1];\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function validaRemision() {\n");
      out.write("        var fr = document.getElementById('fecRecepcion').value;\n");
      out.write("        var fs = document.getElementById('fecRevision').value;\n");
      out.write("\n");
      out.write("        if (fr === \"\" || fs === \"\") {\n");
      out.write("            alert('Ingrese todas los datos')\n");
      out.write("            return false;\n");
      out.write("        } \n");
      out.write("    }\n");
      out.write("\n");
      out.write("    function validaContra(elemento) {\n");
      out.write("        //alert(elemento);\n");
      out.write("        var pass = document.getElementById(elemento).value;\n");
      out.write("        //alert(pass);\n");
      out.write("        if (pass === \"GnKlTolu2014\") {\n");
      out.write("            document.getElementById('actualizaRemi').disabled = false;\n");
      out.write("        } else {\n");
      out.write("            document.getElementById('actualizaRemi').disabled = true;\n");
      out.write("        }\n");
      out.write("    }\n");
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
