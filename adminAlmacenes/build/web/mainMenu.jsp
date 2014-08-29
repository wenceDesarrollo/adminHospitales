<%-- 
    Document   : mainMenu
    Created on : 08-may-2014, 9:18:01
    Author     : Amerikillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!---BootStrap--->
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <!----BootStrap---->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISTEMAS PROPIETARIOS GNKL</title>
        
        <script language="JavaScript">
       function openNewWindow(url,h,w){
       var l = (screen.width - w) / 2;
       var t = (screen.height - h) / 2;
       win = window.open(url,
       null,
       "top=" + t + ",left=" + l + ", width=" + w + ", height=" + h +
       ",toolbar=no,scrollbars=3,location=no,statusbar=no ,menubar=no,resizable=no,copyhistory=no,directorie s=no");
       if (parseInt(navigator.appVersion) >= 4) win.window.focus();
       }
        </script> 
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <h2 class="text-primary text-right">GNKL |</h2>
                </div>
                <div class="col-lg-8">
                    <h2>SISTEMAS PROPIETARIOS</h2>
                </div>
            </div>
            <div class="row">
                <a class="btn btn-default" href="http://www.gnklogistica.com.mx">Regresar al Web Site de GNKL</a>&nbsp;&nbsp;
                <a class="btn btn-default" href="index.jsp">Regresar al Web Site de Sistemas GNKL</a>
            </div>
            <h4>Elija una Opción*</h4>
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <a class="btn btn-block btn-primary" href="javascript:openNewWindow('http://187.176.10.50:8081/Proyectos/index.html',650,1200)">
                        <h1><span class="glyphicon glyphicon-home"></span></h1>
                        <br/>
                        CEDIS Toluca 1
                    </a>
                </div>
				<div class="col-lg-4">
                    <a class="btn btn-block btn-default" href="menuToluca.jsp">
                        <h1><span class="glyphicon glyphicon-home"></span></h1>
                        <br/>
                        CEDIS Toluca Lerma Park
                    </a>
                </div>
                <div class="col-lg-4">
                    <a class="btn btn-block btn-warning" href="menuTep.jsp">
                        <h1><span class="glyphicon glyphicon-home"></span></h1>
                        <br/>
                        CEDIS Tepic
                    </a>
                </div>
                
                
            </div>
            <br />
            <div class="row">
			<div class="col-lg-4">
                    <a class="btn btn-block btn-danger" href="menuDgo.jsp">
                        <h1><span class="glyphicon glyphicon-home"></span></h1>
                        <br/>
                        CEDIS Durango
                    </a>
                </div>
                <div class="col-lg-4">
                    <a class="btn btn-block btn-info" href="Censos.jsp">
                        <h1><span class="glyphicon glyphicon-list"></span></h1>
                        <br/>
                        Estadísticas de Ingresos a Censos
                    </a>
                </div>
                <div class="col-lg-4">
                    <a class="btn btn-block btn-success" href="javascript:openNewWindow('http://187.176.10.50:8080/iso9001/iso9001/index_rweb1.jsp',650,1200)">
                        <h1><span class="glyphicon glyphicon-globe"></span></h1>
                        <br/>
                        ISO
                    </a>
                </div>
            </div>
        </div>
    </body>
    <!--Bootstrap-->
    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/bootstrap.js"></script>
</html>
