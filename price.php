<?php
  $page_title = 'Lista de precios';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>

<?php include_once('layouts/header.php'); ?>


<!--fromulario de ingresar y eliminar--> 
  <div class="row" id="formNewPrice">
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
                        
                        <select id="product-price" class="form-control" name="product-name">
                           
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
<!-- fin de fromulario de ingresar y eliminar-->


<!--lista de precios datatable-->
  <div class="row">
     <div class="col-md-12">
       <?php echo display_msg($msg); ?>
     </div>
  </div>
  <div class="row content-table" id="table-prices">   
       
      <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
              <strong>
                <span class="glyphicon glyphicon-th"></span>
                <span>Lista de PRECIOS</span>
             </strong>
             <div class="pull-right">
                <a href="#"  class="btn btn-xs btn-success" id="newPrice" data-toggle="tooltip" title="Agregar precio">
                  <span class="glyphicon glyphicon-plus"></span>
                </a>                       
             </div>
            </div>
            <div class="panel-body">
              <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th class="text-center" style="width: 50px;">Codigo</th>
                        <th class="text-center">Articulo</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Fecha</th>
                        <th class="text-center">Proveedor</th>
                        <th class="text-center" style="width: 100px;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="data-price">
                 
                </tbody>
              </table>
            </div>
          </div>
      </div>
  </div>

<!--fin de lista de precios datatable-->

<!--modal detrlle producto-->

  <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">DETALLE DE ARTICULO</h4>
        </div>
        <div class="modal-body">
          <div class="row table-data">
            <table class="table table-bordered col-md-10">
            <tbody id="data-product">
                           
            </tbody>
          </table>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<!--modal detrlle producto-->

  <?php include_once('layouts/footer.php'); ?>
