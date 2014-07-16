<%-- 
    Document   : index
    Created on : 01-oct-2013, 12:05:12
    Author     : wence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String info=null;
        
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Ingreso Alta de Pacientes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/login.css" rel="stylesheet" media="screen">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../css/MD5.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="container">
      <div class="row" >
          <div class="col-md-4"></div>
          <div class="col-md-4"><h1>ALTA DE PACIENTES</h1></div>
          <div class="col-md-4"></div>
      </div>
      
      <br> 
      <form name ="form" id="forma-login" class="marco" action="/CensosVer/login" method="post" >
        <!--label for="username" class="uname" data-icon="u" > Your email or username </label-->
       <div class="row">
        <div class="col-md-4"><img src="../imagenes/GNKL_Small.JPG" ></div>
        <div class="col-md-8"><h2>Validar Usuario</h2></div>
        
        </div>
            
           
 <div class="input-group">
  <span class="input-group-addon"><label class="glyphicon glyphicon-user"></label>
  </span>
     <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Introduzca Nombre de Usuario">
</div>
<div class="input-group">
  <span class="input-group-addon"><label class="glyphicon glyphicon-hand-right"></label>
  </span>
  
    <input type="password" name="pass" id="pass" onkeyup="this.form.hash.value = MD5(this.form.pass.value);" class="form-control"  placeholder="Introduzca Contrase&ntilde;a V&aacute;lida">
</div>
       
<div>
     <%
    
     info = (String)session.getAttribute("info");
     //out.print(info);
     if( !(info==null || info.equals(null)) )
     {
     %>
     <div>Datos inv&aacute;lidos, intente otra vez...</div>
     <%
     }
     session.invalidate();
     %>
<input type="hidden" name="hash" value="" class="form-control">
<input type="hidden" name="ban" value="0" class="form-control">
</div>
  <br>              
            <button name="envio" class="btn btn-primary btn-lg btn-block" type="submit">Entrar</button>
           <br>
        </form>
<br>


      <div class="row" >
          <div class="col-md-4"></div>
          <div class="col-md-4"><h4 class="left"><a href="../index.jsp">Regresar a Men&uacute;</a></h4></div>
          <div class="col-md-4"></div>
      </div>

  </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
  </body>
</html>


