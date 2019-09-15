<?php
  $page_title = 'Nuevo requerimiento';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(2);
  $all_categories = find_all('categories');
  $all_photo = find_all('media');
  $all_measure = find_all('measure');
  $all_type = find_all('typy');
  $all_ceco = find_all('ceco');
  $all_product = find_all('price');
  
  
?>

<?php
 if(isset($_POST['add-requirements'])){
   $req_fields = array('rq-categorie','rq-priority');
   //validate_fields($req_fields);
   if(empty($errors)){
     $r_number  = make_number_rq();
     $r_priority  = remove_junk($db->escape($_POST['rq-priority']));
     $r_ceco  = remove_junk($db->escape($_POST['rq-ceco']));
     $r_user  = remove_junk($db->escape($_POST['rq-user']));
     $r_categorie   = remove_junk($db->escape($_POST['rq-categorie']));
     $r_begin  = read_date($_POST['rq-begin']);
     $r_finish  = read_date($_POST['rq-finish']);     
    
    
     $query  = "INSERT INTO requirements (";
     $query .=" NumberRq, priority, Ceco, User, Categorie, DateCreation, DateAtention";
     $query .=") VALUES (";
     $query .=" '{$r_number}', '{$r_priority}', '{$r_ceco}', '{$r_user}', '{$r_categorie}', '{$r_begin}', '{$r_finish}'";
     $query .=")";
     if($db->query($query)){
       $session->msg('s',"Requerimiento agregado exitosamente. ");
       redirect('add_detail.php', false);
     } else {
       $session->msg('d',' Lo siento, registro falló.');
       redirect('requirements.php', false);
     }
   } else{
     $session->msg("d", $errors);
     redirect('add_requirements.php',false);
   }

 }

?>

<?php 

  $price = join_product_table();

?>

<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-12">
    <?php echo display_msg($msg); ?>
  </div>
</div>

<!--Lista de requerimientos-->
  
  <div class="row" id="lista-requerimiento">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <strong>
            <span class="glyphicon glyphicon-list-alt"></span>
            <span>Lista de requerimientos</span>
          </strong>
          <a href="#"  class="btn btn-xs btn-success pull-right" id="requerimiento-add" data-toggle="tooltip" title="Crear nuevo requerimiento">
            <span class="glyphicon glyphicon-plus"></span>
          </a>
        </div>
      <div class="panel-body">
      
        <div class="requerimiento-table">
          <div class="paginacion-botones" id="paginacion-botones"></div>
          <table id = "" class="table table-bordered table-striped">
            <thead>
              <tr>
                <th class="text-center">Numero</th>
                <th class="text-center">Centro de costos</th>
                <th class="text-center">Categoria</th>
                <th class="text-center">F. creacion</th>
                <th class="text-center">F. atencion</th>
                <th class="text-center">Estado</th>
                <th class="text-center">Creado por:</th>
              </tr>
            </thead>
            <tbody id="data-requerimientos">
                 <!--Elementos cargados por ajax-->

            </tbody>
          </table>
          <div class="paginacion-botones" id="paginacion-botones"></div>
        </div>          
       </div>
      </div>
    </div>
  </div>

<!--Fin lista de requerimientos-->

<!--Formulario requerimiento-->
  <div class="row" id="cabecera-requerimiento">
        <div class="col-md-2"></div>
        <div class="col-md-8">
          <div class="panel panel-default">
          <div class="panel-heading clearfix">
            <strong>
                <i class="glyphicon glyphicon-copy"></i>
                <span>nuevo requerimientos</span>
           </strong> 
           <a href="#" class="btn btn-xs btn-danger pull-right" id="requerimiento-list" data-toggle="tooltip" title="Lista de requerimientos">
            <span class="glyphicon glyphicon-menu-hamburger"></span>
           </a>          
          </div>
          <div class="panel-body">
           <div class="col-md-12">
            <form  class="clearfix" id="form-requerimiento">              
              <input type="hidden" class="form-control" name="rq-user" value="<?php echo ucfirst($user['id']); ?>" >
              <input type="hidden" class="form-control" name="rq-status" value="creado" >
              <div class="col-md-12">
                <label for="centro-costos" class="label-form">Ceco:</label>
                <div class="form-group">
                  <select class="form-control" name="rq-ceco" id="centro-costos" required="required">
                    <option value="">CENTRO DE COSTOS</option>
                              <?php  foreach ($all_ceco as $ceco): ?>
                    <option value="<?php echo (int)$ceco['id'] ?>">
                              <?php echo $ceco['Description'];?>
                    </option>
                      <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <label for="categoria" class="label-form">Categoria:</label>
                <div class="form-group">
                  <select class="form-control" name="rq-categorie" id="categoria" required="required">
                    <option value="">CATEGORIA</option>
                      <?php  foreach ($all_categories as $cat): ?>
                    <option value="<?php echo (int)$cat['id'] ?>">
                      <?php echo $cat['name'];?>
                    </option>
                      <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <label for="prioridad" class="label-form">Prioridad:</label>
                <div class="form-group">
                  <select class="form-control" name="rq-priority" id="prioridad" required="required">
                    <option value="">PRIORIDAD</option>
                    <option value="ALTA">ALTA</option>
                    <option value="MEDIA">MEDIA</option>
                    <option value="BAJA">BAJA</option>                           
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <label for="fecha-ceacion" class="label-form">Fecha de creación:</label>
                <div class="form-group">
                  <input class="datepicker form-control" name="rq-begin" placeholder="Fecha inicio" value=" <?php echo date('Y-m-d'); ?> " id="fecha-ceacion" required="required">
                </div>
              </div>
              <div class="col-md-6">
                <label for="fecha-atencion" class="label-form">Fecha de atención:</label>
                <div class="form-group">
                  <input class="datepicker form-control" name="rq-finish" id="fecha-atencion" placeholder="Fecha de atencion"  required="required">
                </div>
              </div>      
              <div class=" col-md-12">
                <div class="form-group">
                  <button type="submit" name="add-requirements" class="btn btn-block btn-success">
                    Agregar articulos al requerimiento
                  </button>                      
                </div>
              </div>
            </form>
           </div>
          </div>
          </div>
        </div>
        <div class="col-md-2"></div> 
  </div>

<!--Fin formulario requerimiento-->

  
<!--Stock de materiales requerimiento-->
  <div class="row" id="detalle-requerimiento">
    <div class="col-md-8">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <strong>
            <span class="glyphicon glyphicon-list-alt"></span>
            <span class="resultado-ajax green-ajax" id="resultado" >REQUERIMIENTO N° RQ-08092019521904</span>
          </strong>

        </div>
      <div class="panel-body">
        <div class="requerimiento-table" >
          <table class="table-list table table-bordered table-striped" id="table-list">
            <thead>
              <tr>
                <th  colspan="6">
                    <form action="" class="form-inline pull-right">
                      <label for="buscador">Buscar articulo</label>
                      <input id="buscador" class="buscador form-control input-default" type="text">
                      <button class="btn btn-primary">BUSCAR</button>
                    </form>
                </th>
              </tr>
              <tr>
                <th class="text-center">Codigo</th>
                <th class="text-center">Articulo</th>
                <th class="text-center">Unidad</th>
                <th class="text-center">Cantidad</th>
                <th class="text-center">Op.</th>
              </tr>
            </thead>
            <tbody id="data-articulos-stock">
                 <!--Elementos cargados por ajax-->
            
            </tbody>
          </table>
        </div>          
       </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <strong>
            <span class="glyphicon glyphicon-shopping-cart"></span>
            <span>LISTA DE PEDIDOS</span>
          </strong>
          <a href="#" class="btn btn-xs btn-success pull-right" id="ceco-add">
            <span class="glyphicon glyphicon-plus"></span>
          </a>
          <a href="#" class="btn btn-xs btn-danger pull-right" id="ceco-list">
          <span class="glyphicon glyphicon-menu-hamburger"></span>
          </a>
        </div>
      <div class="panel-body">
        <div class="resultado-ajax green-ajax" id="resultado"></div>
        <div class="requerimiento-table">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th class="text-center">Codigo</th>
                <th class="text-center">Cantidad</th>
                <th class="text-center">Op.</th>
              </tr>
            </thead>
            <tbody id="data-articulos-pedido">
                 <!--Elementos cargados por ajax-->
             
            </tbody>
          </table>
        </div>          
       </div>
      </div>
    </div>
  </div>
<!--Fin stock de materiales requerimiento-->
  
<?php include_once('layouts/footer.php'); ?>
