<?php
  $page_title = 'Centro de costos';
  require_once('includes/load.php');
?>
<?php
// Checkin What level user has permission to view this page
 page_require_level(1);
//pull out all user form database
 $all_users = find_all_user();
?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
   <div class="col-md-12">
     <?php echo display_msg($msg); ?>
   </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="panel panel-default">
      <div class="panel-heading clearfix">
        <strong>
          <span class="glyphicon glyphicon-folder-open"></span>
          <span>Centro de costos</span>
       </strong>
         <a href="#" class="btn btn-xs btn-success pull-right" id="ceco-add">
           <span class="glyphicon glyphicon-plus"></span>
         </a>

         
         <a href="#" class="btn btn-xs btn-danger pull-right" id="ceco-list">
          <span class="glyphicon glyphicon-menu-hamburger"></span>
         </a>
      </div>
     <div class="panel-body">
        <div class="row ceco-form">
          <div class="col-md-2"></div>
          <div class="col-md-8">
            <div class="panel panel-info"> 
              <div class="panel-heading">Agregar nuevo centro de costos</div>            
              <div class="panel-body">
                <form method="post" action="" class="" id="form-ceco">
                      <div class="alert alert-warning alert-dismissible" role="alert" id="msg-popup">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Advertencia!</strong> Todos los datos son obligatorios.
                      </div>
                      <div class="col-md-6">
                         <div class="form-group ">                        
                          <input type="text" class="form-control" name="ceco-codigo" placeholder="Codigo ceco" id ="ceco-codigo" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group ">                        
                          <input type="text" class="form-control" name="ceco-nombre" placeholder="Nombre corto" id="ceco-nombre" required="required">              
                        </div>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group ">                        
                            <input type="text" class="form-control" name="ceco-descripcion" placeholder="Descripción" id="ceco-descripcion" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                            <select name="ceco-rubro"class="form-control" id="ceco-rubro" required="required">
                              <option value="">Selecciona un rubro</option>
                              <option value="Mina">Mina</option>
                              <option value="Construccion">Construccion</option>
                              <option value="Intermediacion laboral">Intermediacion laboral</option>                                                     
                            </select>                                    
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">                        
                            <input type="text" class="form-control" name="ceco-contrato" placeholder="Contrato" id="ceco-contrato" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">                        
                            <input type="text" class="form-control" name="ceco-region" placeholder="Region" id="ceco-region" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">                        
                            <input type="text" class="form-control" name="ceco-distrito" placeholder="Distrito" id="ceco-distrito" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">                        
                            <input type="text" class="form-control" name="ceco-referencia" placeholder="referencia" id="ceco-referencia" required="required">              
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group" id="ceco-registro">                         
                             <input class="datepicker form-control" name="ceco-registro"  value="" placeholder="Fecha de registro"  required="required">          
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group" id="ceco-inicio">                         
                             <input class="datepicker form-control" name="ceco-inicio"  value="" placeholder="Fecha de inicio"  required="required">              
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group" id="ceco-fin">
                             <input class="datepicker form-control" name="ceco-fin"  value="" placeholder="Fecha de fin" required="required">
                        </div>
                      </div>

                                                
                             <input type="hidden" class="form-control" name="cecoId"  value="" placeholder="id" id="ceco-id">              
                        
                      <div class="col-md-12">
                        <div class="form-group">
                             <button type="submit" name="ceco_add" class="btn btn-block btn-info">Agregar articulo</button>
                        </div>
                      </div>
                </form>
              </div>
            </div>
          </div>
          <div class="col-md-2"></div>
        </div>
        <div class="ceco-table">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th class="text-center">Ceco</th>
                  <th class="text-center">Nombre corto</th>
                  <th class="text-center">Registro  </th>
                  <th class="text-center">Region</th>
                  <th class="text-center">Distrito</th>
                  <th class="text-center">Rubro</th>
                  <th class="text-center">Estado</th>
                  <th class="text-center">Acciones</th>
                </tr>
              </thead>
              <tbody id="data-ceco">
               <!-- ajax -->
             </tbody>
            </table>
        </div>          
     </div>
    </div>
  </div>
</div>
<!--modal detrlle producto-->

  <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">DETALLE DE CENTRO DE COSTOS</h4>
        </div>
        <div class="modal-body">
          <div class="row table-data">
            <table class="table table-bordered col-md-10">
            <tbody id="data-ceco-detalle">
                <!-- ajax -->           
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
