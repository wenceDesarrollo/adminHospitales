/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package in.co.sneh.controller;

import in.co.sneh.model.FileUpload;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import java.io.InputStream;
import java.io.PrintWriter;
import org.apache.commons.fileupload.FileItemIterator;
import javax.servlet.http.HttpSession;
import conn.*;

/**
 *
 * @author CEDIS TOLUCA3
 */
public class FileUploadServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectionDB_SAA con = new ConectionDB_SAA();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String Unidad = "";

        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        if (isMultiPart) {
            ServletFileUpload upload = new ServletFileUpload();
            try {
                HttpSession sesion = request.getSession(true);
                FileItemIterator itr = upload.getItemIterator(request);
                while (itr.hasNext()) {
                    FileItemStream item = itr.next();
                    if (item.isFormField()) {
                        String fielName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b = new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        Unidad = value;
                        response.getWriter().println(fielName + ":" + value + "<br/>");
                    } else {
                        String path = getServletContext().getRealPath("/");
                        if (FileUpload.processFile(path, item)) {
                            try {
                                con.conectar();
                                con.insertar("insert into TB_ImaOC values(0,'" + Unidad + "','" + item.getName() + "')");
                                con.cierraConexion();
                            } catch (Exception e) {
                            }
                            //response.getWriter().println("file uploaded successfully");
                            //response.sendRedirect("cargaFotosCensos.jsp");
                        } else {
                            //response.getWriter().println("file uploading falied");
                            //response.sendRedirect("cargaFotosCensos.jsp");
                        }
                    }
                }
            } catch (FileUploadException fue) {
                fue.printStackTrace();
                out.println("<script>alert('No se pudo cargar el Folio, verifique las celdas')</script>");
                out.println("<script>window.location='subirDoctos.jsp'</script>");
            }
            //response.sendRedirect("carga.jsp");
            response.getWriter().println("Subida Completa");
            response.sendRedirect("subirDoctos.jsp");
        }

        /*
         * Para insertar el excel en tablas
         */
    }
}
