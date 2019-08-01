<?php
  $page_title = 'Lista de tipo de tipo de cambio';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
  
  $all_type = find_all('tipo_cambio')
?>

<?php
 if(isset($_POST['add_tipo_cambio'])){
   $req_field = array('date-type');
   validate_fields($req_field);
   $day = remove_junk($db->escape($_POST['day-type']));
   $buy = remove_junk($db->escape($_POST['buy-type']));
   $sale = remove_junk($db->escape($_POST['sale-type']));
   $date = remove_junk($db->escape($_POST['date-type']));
   if(empty($errors)){
      $sql  = "INSERT INTO tipo_cambio (dia,date,compra,venta)";
      $sql .= " VALUES ('{$day}','{$date}','{$buy}','{$sale}')";
      if($db->query($sql)){
        $session->msg("s", "Tipo de cambio agregada exitosamente.");
        redirect('type-change.php',false);
      } else {
        $session->msg("d", "Lo siento, registro falló");
        redirect('type-change.php',false);
      }
   } else {
     $session->msg("d", $errors);
     redirect('type-change.php',false);
   }
 }
?>
<?php include_once('layouts/header.php'); ?>

  <div class="row">
     <div class="col-md-12">
       <?php echo display_msg($msg); ?>
     </div>
  </div>
   <div class="row">
    <div class="col-md-3">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>Agregar tipo de cambio</span>
         </strong>
        </div>
        <div class="panel-body">
          <form method="post" action="type-change.php">
              <div class="input-group">
                  <select class="form-control" name="day-type">
                    <option value="">Dia</option>
                    <?php 
                      $dia=1;
                      while ( $dia <= 31) {
                        echo '<option value="'.$dia.'">'.$dia.'</option>';
                        $dia++;
                    } ?>
                  </select>
              </div>
                <div class="input-group from-control">
                      <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                      </span>
                      <input type="number" step="any" class="form-control" name="buy-type" placeholder="Compra">
                </div> 
              
              <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="number" step="any" class="form-control" name="sale-type" placeholder="Venta">
              </div>
              <div class="input-group">
                  <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                  </span>
                  <input class="datepicker form-control" name="date-type" placeholder="Fecha">
              </div>
              <button type="submit" name="add_tipo_cambio" class="btn btn-primary">Agregar tipo de cambio</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-9">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>Lista de tipo de cambio</span>
       </strong>
      </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">#</th>
                    <th>Dia</th>
                    <th>Fecha</th>
                    <th>Compra</th>
                    <th>Venta</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
              <?php foreach ($all_type as $type):?>
                <tr>
                    <td class="text-center"><?php echo count_id();?></td>
                    <td><?php echo remove_junk(ucfirst($type['dia'])); ?></td>
                    <td><?php echo remove_junk(ucfirst($type['date'])); ?></td>
                    <td><?php echo remove_junk(ucfirst($type['compra'])); ?></td>
                    <td><?php echo remove_junk(ucfirst($type['venta'])); ?></td>
                    <td class="text-center">
                      <div class="btn-group">
                        <a href="edit_change.php?id=<?php echo (int)$type['id'];?>"  class="btn btn-xs btn-warning" data-toggle="tooltip" title="Editar">
                          <span class="glyphicon glyphicon-edit"></span>
                        </a>
                        <a href="delete_change.php?id=<?php echo (int)$type['id'];?>"  class="btn btn-xs btn-danger" data-toggle="tooltip" title="Eliminar">
                          <span class="glyphicon glyphicon-trash"></span>
                        </a>
                      </div>
                    </td>

                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
       </div>
    </div>
    </div>
   </div>
  </div>
  <?php include_once('layouts/footer.php'); ?>
