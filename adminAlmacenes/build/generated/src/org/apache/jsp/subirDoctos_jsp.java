package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import conn.*;

public final class subirDoctos_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    String usua = "", tipo = "";
    if (sesion.getAttribute("nombre") != null) {
        usua = (String) sesion.getAttribute("nombre");
        tipo = (String) sesion.getAttribute("Tipo");
    } else {
        response.sendRedirect("index.jsp");
    }
    ConectionDB con = new ConectionDB();

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Estilos CSS -->\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/cupertino/jquery-ui-1.10.3.custom.css\" />\n");
      out.write("        <link href=\"css/navbar-fixed-top.css\" rel=\"stylesheet\">\n");
      out.write("        <!---->\n");
      out.write("        <title>SIALSS</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <h1>SIALSS</h1>\n");
      out.write("            <h4>Módulo - Sistema de Administración de Almacenes (SAA)</h4>\n");
      out.write("            <!--div class=\"navbar navbar-default\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"navbar-header\">\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("                            <span clss=\"icon-bar\"></span>\n");
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
      out.write("            ");

                if (tipo.equals("2") || tipo.equals("3")) {
            
      out.write("\n");
      out.write("        <li><a href=\"verificarCompraAuto.jsp\">Verificar OC</a></li>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('reimpresion.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Reimpresión de Compras</a></li>\n");
      out.write("        <li><a href=\"#\"  onclick=\"window.open('ordenesCompra.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Órdenes de Compras</a></li>\n");
      out.write("        <li><a href=\"#\"  onclick=\"window.open('kardexClave.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Kardex Claves</a></li>\n");
      out.write("        <li><a href=\"#\"  onclick=\"window.open('Ubicaciones/Consultas.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Ubicaciones</a></li>\n");
      out.write("    </ul>\n");
      out.write("</li>\n");
      out.write("<li class=\"dropdown\">\n");
      out.write("    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Facturación<b class=\"caret\"></b></a>\n");
      out.write("    <ul class=\"dropdown-menu\">\n");
      out.write("        <li><a href=\"requerimiento.jsp\">Carga de Requerimiento</a></li>\n");
      out.write("        <li><a href=\"factura.jsp\">Facturación Automática</a></li>\n");
      out.write("        <li><a href=\"reimp_factura.jsp\">Reimpresión de Facturas</a></li>\n");
      out.write("    </ul>\n");
      out.write("</li>\n");
      out.write("<li class=\"dropdown\">\n");
      out.write("    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Catálogos<b class=\"caret\"></b></a>\n");
      out.write("    <ul class=\"dropdown-menu\">\n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('medicamento.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Catálogo de Medicamento</a></li>\n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('catalogo.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Catálogo de Proveedores</a></li>\n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('marcas.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Catálogo de Marcas</a></li>\n");
      out.write("    </ul>\n");
      out.write("</li>\n");
      out.write("<li class=\"dropdown\">\n");
      out.write("    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Fecha Recibo<b class=\"caret\"></b></a>\n");
      out.write("    <ul class=\"dropdown-menu\">\n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('Entrega.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Fecha de Recibo en CEDIS</a></li> \n");
      out.write("        <li><a href=\"#\" onclick=\"window.open('historialOC.jsp', '', 'width=1200,height=800,left=50,top=50,toolbar=no')\">Historial OC</a></li>                                      \n");
      out.write("    </ul>\n");
      out.write("</li>\n");
      out.write("            <!--li class=\"dropdown\">\n");
      out.write("                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">ADASU<b class=\"caret\"></b></a>\n");
      out.write("                <ul class=\"dropdown-menu\">\n");
      out.write("                    <li><a href=\"captura.jsp\">Captura de Insumos</a></li>\n");
      out.write("                    <li class=\"divider\"></li>\n");
      out.write("                    <li><a href=\"catalogo.jsp\">Catálogo de Proveedores</a></li>\n");
      out.write("                    <li><a href=\"reimpresion.jsp\">Reimpresión de Docs</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("            <li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span> ");
      out.print(usua);
      out.write("</a></li>\n");
      out.write("            <li class=\"active\"><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span></a></li>\n");
      out.write("        </ul>\n");
      out.write("    </div--><!--/.nav-collapse >\n");
      out.write("</div>\n");
      out.write("</div-->\n");
      out.write("            <hr/>\n");
      out.write("            <h2>Cargar Imagenes de Orden de Compra</h2>\n");
      out.write("            <form method=\"post\" class=\"marco\"  action=\"FileUploadServlet\" enctype=\"multipart/form-data\" name=\"form1\" id=\"form1\"> \n");
      out.write("                <div class=\"container\">\n");
      out.write("                    \n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <select class=\"form-control\">\n");
      out.write("                            <option value=\"\">-Seleccione la OC-</option>\n");
      out.write("                            ");

                            try{
                                con.conectar();
                                ResultSet rset = con.consulta("select o.F_NoCompra, p.F_NomPro from tb_pedidoisem o, tb_proveedor p where o.F_Provee = p.F_ClaProve and F_StsPed !='2' and F_Recibido=0  group by o.F_NoCompra");
                                while(rset.next()){
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(rset.getString(1));
      out.write('"');
      out.write('>');
      out.print(rset.getString(2));
      out.write(" - ");
      out.print(rset.getString(1));
      out.write("</option>\n");
      out.write("                                    ");

                                }
                                con.cierraConexion();
                            }catch(Exception e){
                                
                            }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <br/>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <table class=\"table table-bordered table-striped\">\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 1</th><td><input type=\"file\" name=\"file1\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 2</th><td><input type=\"file\" name=\"file2\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 3</th><td><input type=\"file\" name=\"file3\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 4</th><td><input type=\"file\" name=\"file4\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 5</th><td><input type=\"file\" name=\"file5\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 6</th><td><input type=\"file\" name=\"file6\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 7</th><td><input type=\"file\" name=\"file7\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>Foto 8</th><td><input type=\"file\" name=\"file8\" accept=\".JPG\"/></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td colspan=\"2\"><a data-toggle=\"modal\" href=\"#myModal\" class=\"btn btn-block btn-primary\" onclick=\"form1.submit();\">CARGAR IMAGENES</a><!--button class=\"btn btn-block btn-primary\" type=\"submit\" onclick=\"location.href = 'cargaFotosCensos.jsp#myModal'\" id=\"botonCarga\">CARGAR IMAGENES</button--></td>\n");
      out.write("                                </tr>\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
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
      out.write("        <!-- \n");
      out.write("             fin Mensaje de Acerca de...\n");
      out.write("        -->                            \n");
      out.write("        <div class=\"modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                        <h4 class=\"modal-title\">Carga de Imagenes</h4>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"modal-body\">\n");
      out.write("                        <form name=\"form_com\" method=\"post\" id=\"form_com\">\n");
      out.write("                            <img src='imagenes/loading.gif' width='100px' height='100px' align='center' />\n");
      out.write("                            Se están subiendo las imágenes, por favor espere...\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div><!-- /.modal-content -->\n");
      out.write("            </div><!-- /.modal-dialog -->\n");
      out.write("        </div><!-- /.modal -->\n");
      out.write("    </body>\n");
      out.write("    <!-- \n");
      out.write("    ================================================== -->\n");
      out.write("    <!-- Se coloca al final del documento para que cargue mas rapido -->\n");
      out.write("    <!-- Se debe de seguir ese orden al momento de llamar los JS -->\n");
      out.write("    <script src=\"js/jquery-1.9.1.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.js\"></script>\n");
      out.write("    <script src=\"js/jquery-ui-1.10.3.custom.js\"></script>\n");
      out.write("\n");
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
