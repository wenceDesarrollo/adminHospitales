<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Grid Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="grid.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="ie-emulation.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="viewport.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <br > 
    <br > 
    <br > 
    <div class="container"> 
    <div class="jumbotron">
    <form class="form-CapturaOrden">
    <h2 class="text-center form-CapturaOrden-heading">CAPTURA DE ORDEN DE COMPRA</h2>
    <br >
    <br >
    <div class="form-group">   
           <div class="col-md-2">
               <div class="form-control primary">Proveedor</div>
           </div>    
           <div class="col-md-2">
                  <input class="form-control" id="txt_1"placeholder="">
           </div>
           <div class="col-md-2 col-md-offset-1">
           <select class="form-control">
                 <option>Seleccione Proveedor</option>
           </select>
           </div>    
           <button type="button" class="col-md-1 btn btn-primary">Buscar</button>
           <div class="col-md-1 col-md-offset-1">
                   <div class="form-control">Fecha</div>
           </div>
           <div class="col-md-2">
                <input class="form-control"id="txt_2" placeholder="DD/MM/AAAA">
           </div>
</div>
<br > 
<div class="form-group">
    <div class="col-md-2">
        <div class="form-control">Nro de Compra</div>
    </div>
    <div class="col-md-2">
        <input class="form-control" placeholder="">
    </div>
</div>
<br > 
<br >
<div class="form-group">
  <div class="col-md-2">
      <input class="form-control" placeholder="Ingrese Clave">
  </div>
  <div class="col-md-2">
  <button type="button" class="btn btn-primary">Mostrar Datos</button>
  </div>
  <div class="col-md-3 col-md-offset-1">
       <input class="form-control" placeholder="Descripción"> 
  </div>
  <button type="button" class="col-md-1 btn btn-primary">Buscar</button>
</div>
<br >
<br >
<div class="form-group">
       <div class="col-md-2">
               <div class="form-control">Clave</div>
           </div>    
           <div class="col-md-2">
                  <input class="form-control" id="txt_4"placeholder="">
           </div>
           <div class="col-md-2 col-md-offset-1">
               <div class="form-control">Descripción</div>
           </div>
           <div class="col-md-3">
           <textarea class="form-control" rows="2" cols="200"></textarea>
           </div>
           <br>
</div>
<br>
<br>
  <div class="form-group">
  <div class="col-md-2">
             <input class="form-control" placeholder="Ingrese Lote">
  </div>
  <div class="col-md-2">
  <div class="form-control">Caducidad: </div>
  </div>
  <div class="col-md-1">
  <input class="form-control" placeholder="dd"> 
  </div>
  <div class="col-md-1">
  <input class="form-control" placeholder="mm"> 
  </div>
  <div class="col-md-1">
  <input class="form-control" placeholder="aaaa"> 
  </div>
  <div class="col-md-2 col-md-offset-1">
  <input class="form-control" placeholder="Ingrese Cantidad">
  </div>
  <button type="button" class="col-md-2 btn btn-primary">Agregar a orden de Compra</button>
  </div>
  <br > 
  <br >   
  <br > 
  <br >
  <div class="form-group">
  <div class="col-md-1">
  <div class="form-control">Clave</div>
  </div>
  <div class="col-md-2">
  <div class="form-control">Descripción</div>
  </div>
  <div class="col-md-1">
  <div class="form-control">Lote</div>
  </div>
  <div class="col-md-2">
  <div class="form-control">Caducidad</div>
  </div>
  <div class="col-md-2">
  <div class="form-control">Cantidad</div>
  </div>
  <div class="col-md-2">
  <div class="form-control">Precio Unitario</div>
  </div>
  <div class="col-md-2">
  <div class="form-control">Importe</div>
  </div>
  </div>
</form>
 </div>
 </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>