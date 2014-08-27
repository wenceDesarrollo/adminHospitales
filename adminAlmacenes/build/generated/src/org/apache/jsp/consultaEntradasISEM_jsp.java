package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.util.Calendar;
import conn.*;

public final class consultaEntradasISEM_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    ConectionDB con = new ConectionDB();
    ConectionDB_SAA con_saa = new ConectionDB_SAA();
    String usuario = "";

    try {
        usuario = request.getParameter("usuario");
    } catch (Exception e) {

    }

    if (usuario == null) {
        usuario = "";
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("\n");
      out.write("        <title>SIALSS</title>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/cupertino/jquery-ui-1.10.3.custom.css\" />\n");
      out.write("        <link href=\"css/navbar-fixed-top.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/datepicker3.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/dataTables.bootstrap.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Just for debugging purposes. Don't actually copy this line! -->\n");
      out.write("        <!--[if lt IE 9]><script src=\"../../assets/js/ie8-responsive-file-warning.js\"></script><![endif]-->\n");
      out.write("\n");
      out.write("        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n");
      out.write("          <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Fixed navbar -->\n");
      out.write("        <div class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\"><b>Consulta Ingresos a Reportes ISEM</b></a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"navbar-collapse collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <li class=\"active\"><a href=\"consultaEntradasISEM.jsp\">Entradas Rep ISEM</a></li>\n");
      out.write("                        <!--li class=\"\"><a href=\"consultaEntradasOC.jsp\">Entradas OC</a></li>\n");
      out.write("                        <!--li><a data-toggle=\"modal\" href=\"#myModal2\">Acerca de...</a></li>\n");
      out.write("                        <li><a data-toggle=\"modal\" href=\"#myModal\">Cont&aacute;ctanos</a></li>\n");
      out.write("                        <li class=\"dropdown\">\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">M&oacute;dulos <b class=\"caret\"></b></a>\n");
      out.write("                            <ul class=\"dropdown-menu\">\n");
      out.write("                                <li><a href=\"historialOC.jsp\">Historial OC</a></li>\n");
      out.write("                                <li><a href=\"ordenesCompra.jsp\">Órdenes de Compra</a></li>\n");
      out.write("                                <li><a href=\"factura.jsp\">Recibo en Almac&eacute;n</a></li>\n");
      out.write("                                <li><a href=\"entregas.jsp\">Entrega a Proveedores</a></li>\n");
      out.write("                                <li><a href=\"exist.jsp\">Existencias en CEDIS</a></li>\n");
      out.write("                                <li><a href=\"Entrega.jsp\">Fecha de Recibo en CEDIS</a></li>\n");
      out.write("                        <!--li><a href=\"rep.jsp\">Reporteador</a></li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </li-->\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        <!--li><a href=\"../navbar/\">Default</a></li>\n");
      out.write("                        <li><a href=\"../navbar-static-top/\">Static top</a></li-->\n");
      out.write("                        <!--li class=\"active\"><a href=\"index.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span>&nbsp;&nbsp;Salir</a></li-->\n");
      out.write("                    </ul>\n");
      out.write("                </div><!--/.nav-collapse -->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div style=\"padding-top: 60px;\">\n");
      out.write("\n");
      out.write("            <div style=\"width: 1200px; margin: auto\">\n");
      out.write("\n");
      out.write("                <!-- Main component for a primary marketing message or call to action -->\n");
      out.write("                <h1>Consulta Ingresos a Reportes ISEM</h1>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-9\">\n");
      out.write("                        <form action=\"consultaEntradasISEM.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"col-sm-2\">\n");
      out.write("                                <h4>Filtrar por usuario</h4>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-sm-2\">\n");
      out.write("                                <select class=\"form-control\" name=\"usuario\" onchange=\"this.form.submit();\">\n");
      out.write("                                    <option value=\"\">-Seleecione-</option>\n");
      out.write("                                    ");

                                        try {
                                            Calendar calendar = Calendar.getInstance();
                                            con.conectar();
                                            ResultSet rset = con.consulta("select usuario from ingEnt where usuario!='' and status='1' group by usuario ");
                                            while (rset.next()) {
                                                /*calendar.setTime(df.parse(rset.getString(4)));
                                                 calendar.add(Calendar.HOUR, 6);
                                                 Date hora = calendar.getTime();*/

                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(rset.getString(1));
      out.write('"');
      out.write('>');
      out.print(rset.getString(1));
      out.write("</option>\n");
      out.write("                                    ");

                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                            System.out.println(e.getMessage());
                                        }
                                    
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-sm-2\">\n");
      out.write("                                <a href=\"consultaEntradasISEM.jsp\" class=\"btn btn-default\" >Todos</a>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"panel panel-body\">\n");
      out.write("                            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"table table-striped table-bordered\" id=\"datosProv\">\n");
      out.write("                                <thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>id</td>\n");
      out.write("                                        <td>Usuario</td>\n");
      out.write("                                        <td>Fecha y Hora</td>\n");
      out.write("                                        <td>Status</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody>\n");
      out.write("                                    ");

                                        try {
                                            Calendar calendar = Calendar.getInstance();
                                            con.conectar();
                                            ResultSet rset = con.consulta("select idEnt, usuario, DATE_FORMAT(fecha, '%d/%m/%Y') AS fecha, hora, status from ingEnt where usuario like '%" + usuario + "' and status='1' order by (idEnt+0) desc");
                                            while (rset.next()) {
                                                /*calendar.setTime(df.parse(rset.getString(4)));
                                                 calendar.add(Calendar.HOUR, 6);
                                                 Date hora = calendar.getTime();*/

                                    
      out.write("\n");
      out.write("                                    <tr class=\"odd gradeX\">\n");
      out.write("                                        <td>");
      out.print(rset.getInt(1));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(rset.getString(2));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(rset.getString(3));
      out.write(' ');
      out.print(rset.getString(4));
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(rset.getString(5));
      out.write("</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {
                                            System.out.println(e.getMessage());
                                        }
                                    
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <h3>Conteo de Entradas por Usuario</h3>\n");
      out.write("                        <table class=\"table table-bordered table-striped table-responsive\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td><strong>Usuario</strong></td>\n");
      out.write("                                <td><strong>Entradas</strong></td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                            try {
                                Calendar calendar = Calendar.getInstance();
                                con.conectar();
                                ResultSet rset = con.consulta("select i.usuario, u.apellido, count(i.usuario) as suma from ingEnt i, usuarios_wss u where i.usuario = u.nombre and  i.usuario!='' and status='1' and usuario !='ope' and usuario != 'sistemas' group by i.usuario order by i.usuario");
                                while (rset.next()) {
                                    /*calendar.setTime(df.parse(rset.getString(4)));
                                     calendar.add(Calendar.HOUR, 6);
                                     Date hora = calendar.getTime();*/

                            
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>");
      out.print(rset.getString(1));
      out.write(' ');
      out.print(rset.getString(2));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(rset.getString(3));
      out.write("</td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");

                               }
                               con.cierraConexion();
                           } catch (Exception e) {
                               System.out.println(e.getMessage());
                           }
                            
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                    <!--\n");
      out.write("                    Envío de Correo\n");
      out.write("                    -->\n");
      out.write("                    <div class=\"modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("                        <div class=\"modal-dialog\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                                    <h4 class=\"modal-title\">Ingresa tus Datos</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-body\">\n");
      out.write("                                    <form name=\"form_com\" method=\"post\" id=\"form_com\">\n");
      out.write("                                        Nombre: <input type=\"text\" class=\"form-control\" autofocus placeholder=\"Ingrese su Nombre\" name=\"txtf_nom\" id=\"txtf_nom\">\n");
      out.write("                                        Cuenta de Correo Electr&oacute;nico: <input type=\"text\" class=\"form-control\"  placeholder=\"Ingrese su Cuenta de Correo\" name=\"txtf_cor\" id=\"txtf_cor\" onblur=\"validarEmail(this.form.txtf_cor.value);\" >\n");
      out.write("                                        Deje su Comentario: <textarea name=\"txta_com\" cols=\"10\" rows=\"5\" class=\"form-control\" id=\"txta_com\"></textarea>\n");
      out.write("                                        <div class=\"modal-footer\">\n");
      out.write("                                            <div id=\"contenidoAjax\">\n");
      out.write("                                                <p></p>\n");
      out.write("                                            </div>\n");
      out.write("                                            <input type=\"submit\" class=\"btn btn-primary\" value=\"Enviar\" id=\"btn_com\" onClick=\"return verificaCom(document.forms.form_com);\">\n");
      out.write("                                            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div><!-- /.modal-content -->\n");
      out.write("                        </div><!-- /.modal-dialog -->\n");
      out.write("                    </div><!-- /.modal -->\n");
      out.write("                    <!--\n");
      out.write("                    Fin envío de correo\n");
      out.write("                    -->\n");
      out.write("\n");
      out.write("                    <!-- \n");
      out.write("                  Mensaje de Acerca de...\n");
      out.write("                    -->\n");
      out.write("                    <div class=\"modal fade\" id=\"myModal2\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("                        <div class=\"modal-dialog\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n");
      out.write("                                    <h4 class=\"modal-title\">Control de Almacenes / Desarrollo WEB</h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-body\">\n");
      out.write("                                    <br>\n");
      out.write("                                    <img src=\"imagenes/GNKL_Small.JPG\"  >Sistema de Administración de Almac&eacute;n para el ISEM V.1<br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"modal-footer\">\n");
      out.write("                                    <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button>\n");
      out.write("                                    <!--button type=\"button\" class=\"btn btn-primary\">Guardar Info</button-->\n");
      out.write("                                </div>\n");
      out.write("                            </div><!-- /.modal-content -->\n");
      out.write("                        </div><!-- /.modal-dialog -->\n");
      out.write("                    </div><!-- /.modal -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- \n");
      out.write("                     fin Mensaje de Acerca de...\n");
      out.write("                    -->\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div><!-- /container -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- end Functions with Ajax/Jquery W-->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- \n");
      out.write("        ================================================== -->\n");
      out.write("        <!-- Se coloca al final del documento para que cargue mas rapido -->\n");
      out.write("        <!-- Se debe de seguir ese orden al momento de llamar los JS -->\n");
      out.write("        <script src=\"js/jquery-1.9.1.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.js\"></script>\n");
      out.write("        <script src=\"js/jquery-ui-1.10.3.custom.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap-datepicker.js\"></script>\n");
      out.write("        <script src=\"js/jquery.dataTables.js\"></script>\n");
      out.write("        <script src=\"js/dataTables.bootstrap.js\"></script>\n");
      out.write("        <script>\n");
      out.write("                                            $(document).ready(function() {\n");
      out.write("                                                $('#datosProv').dataTable();\n");
      out.write("                                                });\n");
      out.write("\n");
      out.write("                                            $(document).ready(function() {\n");
      out.write("                                                $('#form_login').submit(function() {\n");
      out.write("                                                        alert(\"Introduzca credenciales válidas\");\n");
      out.write("                                                return false;\n");
      out.write("                                                });\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                    $('#form_com').submit(function() {\n");
      out.write("                                                //alert(\"huges\");\n");
      out.write("                                                return false;\n");
      out.write("                                                    });\n");
      out.write("                                                    $(\"#btn_com\").click(function() {\n");
      out.write("\n");
      out.write("                                                    var nom = $('#txtf_nom').val();\n");
      out.write("                                                    var cor = $('#txtf_cor').val();\n");
      out.write("                                                        var com = $('#txta_com').val();\n");
      out.write("                                                        //alert(id+\" \"+id);\n");
      out.write("\n");
      out.write("                                                        if (nom == '' || cor == '' || com == '') {\n");
      out.write("                                                            return false;\n");
      out.write("                                                        }\n");
      out.write("                                                        else {\n");
      out.write("                                                             var $contenidoAjax = $('div#contenidoAjax').html('<p><img src=\"imagenes/ajax-loader-1.gif\" /></p>');\n");
      out.write("                                                             var dataString = $('#form_com').serialize();\n");
      out.write("                                                var dir = '/adminAlmacenes/servletCorreo';\n");
      out.write("                                        //alert('Datos serializados: '+dataString+dir);\n");
      out.write("\n");
      out.write("                                    $.ajax({\n");
      out.write("                                                        url: dir,\n");
      out.write("                                                                type: \"POST\",\n");
      out.write("                                                                data: dataString,\n");
      out.write("                                                                success: function(data) {\n");
      out.write("                                                                    $contenidoAjax.html(data);\n");
      out.write("                                                                    alert(\"Sus datos han sido Enviados\");\n");
      out.write("                                                                    location.reload();\n");
      out.write("                                                                    //$(\"#form_com\").fadeOut(\"slow\");\n");
      out.write("                                                                    /*$('#txtf_nom').value='huge';\n");
      out.write("                                                                     $('#txtf_cor').value='';\n");
      out.write("                                                                     $('#txta_com').value='';*/\n");
      out.write("                                                                },\n");
      out.write("                                                            });\n");
      out.write("                                                        }\n");
      out.write("                                                    });\n");
      out.write("\n");
      out.write("                                                });\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
