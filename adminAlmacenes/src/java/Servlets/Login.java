/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conn.*;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import java.security.*;
import java.math.*;

import java.text.DateFormat; 
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Americo
 */
public class Login extends HttpServlet {
    private SimpleDateFormat df;
    private SimpleDateFormat df2;
    private SimpleDateFormat df3;
    private String qry;
    private String nombre;
    private int regresa;
    ConectionDB con = new ConectionDB();
   

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(true);
        try {
            /* TODO output your page here. You may use following sample code. */
            if (request.getParameter("accion").equals("1")) {
                try {
                    con.conectar();
                    try {
                        String pass_n = request.getParameter("pass");
                        nombre= request.getParameter("user");
                        byte[] bytesOfMessage = pass_n.getBytes("UTF-8");
                        MessageDigest md = MessageDigest.getInstance("MD5");
                        md.update(pass_n.getBytes(),0,pass_n.length());
                        String pass_md5=(""+new BigInteger(1,md.digest()).toString(16));
                        int ban = 0;
                        ResultSet rset = con.consulta("select id_usuario, nombre from usuarios_wss where nombre = '" + request.getParameter("user") + "' and contra = '" + pass_md5 + "' ");
                         df = new java.text.SimpleDateFormat("yyyy-MM-dd");
                         df2 = new java.text.SimpleDateFormat("dd/MM/yyyy");
                         df3 = new java.text.SimpleDateFormat("HH:mm:ss");
                        Date date = new Date();
                        while (rset.next()) {
                            ban = 1;
                        }
                        if (ban == 1) {//----------------------EL USUARIO ES VÁLIDO
                            qry="insert into ingEnt values(0,'"+ nombre +"','"+df.format(date)+"','"+df3.format(date)+"','"+ban+"');";
                            //con.conectar();
                            regresa = con.insertar(qry);
                            sesion.setAttribute("valido", nombre);
                            response.sendRedirect("indexMain.jsp");
                        } else {//--------------------------EL USUARIO NO ES VÁLIDO
                            //out.println("hola");
                            sesion.setAttribute("mensaje", "Usuario no válido");
                            ban=0;
                            qry="insert into ingEnt values(0,'"+ nombre +"','"+df.format(date)+"','"+df3.format(date)+"','"+ban+"');";

                            //con.conectar();
                            regresa = con.insertar(qry);
                            response.sendRedirect("index.jsp");
                        }
                    } catch (Exception e) {
                    }
                    con.cierraConexion();
                } catch (Exception e) {

                }
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
