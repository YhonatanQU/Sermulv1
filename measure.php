<?php
  $page_title = 'Unidades de medida';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
  
  $all_measure = find_all('measure')
?>
<?php
 if(isset($_POST['add_cat'])){
   $req_field = array('measure-name');
   validate_fields($req_field);
   $cat_name = remove_junk($db->escape($_POST['measure-name']));
   $cat_type = remove_junk($db->escape($_POST['measure-short']));
   if(empty($errors)){
      $sql  = "INSERT INTO measure (NameMedida,ShortName)";
      $sql .= " VALUES ('{$cat_name}','{$cat_type}')";
      if($db->query($sql)){
        $session->msg("s", "Medida agregada exitosamente.");
        redirect('measure.php',false);
      } else {
        $session->msg("d", "Lo siento, registro falló");
        redirect('measure.php',false);
      }
   } else {
     $session->msg("d", $errors);
     redirect('measure.php',false);
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
    <div class="col-md-5">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>Agregar medida</span>
         </strong>
        </div>
        <div class="panel-body">
          <form method="post" action="measure.php">
              <div class="form-group">
                  <input type="text" class="form-control" name="measure-name" placeholder="Nombre de la medida" required>
              </div>
              <div class="form-group">
                  <input type="text" class="form-control" name="measure-short" placeholder="Descripcion corta" required>
              </div>
             
              <button type="submit" name="add_cat" class="btn btn-primary">Agregar medida</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-7">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>Lista de unidades de medida</span>
       </strong>
      </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">#</th>
                    <th>Medidas</th>
                    <th>Descripcion corta</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
              <?php foreach ($all_measure as $cat):?>
                <tr>
                    <td class="text-center"><?php echo count_id();?></td>
                    <td><?php echo remove_junk(ucfirst($cat['NameMedida'])); ?></td>
                    <td><?php echo remove_junk(ucfirst($cat['ShortName'])); ?></td>
                    <td class="text-center">
                      <div class="btn-group">
                        <a href="edit_measure.php?id=<?php echo (int)$cat['id'];?>"  class="btn btn-xs btn-warning" data-toggle="tooltip" title="Editar">
                          <span class="glyphicon glyphicon-edit"></span>
                        </a>
                        <a href="delete_measure.php?id=<?php echo (int)$cat['id'];?>"  class="btn btn-xs btn-danger" data-toggle="tooltip" title="Eliminar">
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
