<?php
  $page_title = 'Inventario';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>

<?php include_once('layouts/header.php'); ?>



<div class="row" id="">
    <div class="col-md-2"></div>
    <!--fromulario de busqueda--> 
    <div class="col-md-8" >
      <form method="post" action="ajax.php" autocomplete="off" id="sug-form">
        <div class="form-group">
          <div class="input-group">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-primary">Búsqueda</button>
            </span>
            <input type="text" id="sug_input" class="form-control" name="title"  placeholder="Buscar por el nombre del producto">
          </div>
          <div id="result" class="list-group"></div>
        </div>
      </form>
    <!--fromulario de busqueda--> 
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span> 
              registrar precio 
            </span>
         </strong>
        </div>
        <div class="panel-body">
         <div class="col-md-12">


          <form method="post" id="prices"  class="clearfix">
                
                <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>
                        
                        <select id="product" class="form-control" name="product-name">
                           
                        </select>
                       
                      </div>
                </div>
                <div class="form-group col-md-4">
                      <div class="input-group">

                        <select id="money" class="form-control" name="product-money">
                        
                        </select>
                        <div class="input-group-addon money-check">
                          <input type="checkbox" name="money-check" id="money-check">
                        </div>
                      </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    
                    <input id="price" type="text" class="form-control" name="product-price" placeholder="Ingrese precio" value="">
                  </div> 
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    
                    <input id="date" class="datepicker form-control" name="product-date"  value="" placeholder="Fecha de registro">
                  </div>
                </div>

                <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select id="provider" class="form-control" name="product-provider">
                        </select>
                        <div class="input-group-addon provider-check">
                          <input type="checkbox" name="provider-check" id="provider-check">
                        </div>
                      </div>
                </div>  
                 <div class="form-group col-md-3">
                   <div class="input-group">
                     <input type="hidden" name="idprice" class="form-control" value="" >
                  </div>
                 </div>

                 <div class="form-group col-md-12">
                  <input type="submit" name="" class="btn btn-danger" value="Agregar precio">
                  <a class="btn btn-primary" id="listar-price">Listar</a>
                 </div>
                 
          </form>
                 <div class="alert alert-message" id="respuesta"> </div>
         </div>

        </div>
      </div>
    </div>
    <div class="col-md-2"></div>
  </div> 


<?php include_once('layouts/footer.php'); ?>