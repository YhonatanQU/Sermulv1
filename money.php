<?php
  $page_title = 'Lista de tipo de monedas';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
  
  $all_money = find_all('money')
?>



<?php
 if(isset($_POST['add_money'])){
   $req_field = array('money-name');
   validate_fields($req_field);
   $money_name = remove_junk($db->escape($_POST['money-name']));
   $money_symbol = remove_junk($db->escape($_POST['money-symbol']));
   if(empty($errors)){
      $sql  = "INSERT INTO money (moneda,simbolo)";
      $sql .= " VALUES ('{$money_name}','{$money_symbol}')";
      if($db->query($sql)){
        $session->msg("s", "Moneda agregada exitosamente.");
        redirect('money.php',false);
      } else {
        $session->msg("d", "Lo siento, registro falló");
        redirect('money.php',false);
      }
   } else {
     $session->msg("d", $errors);
     redirect('money.php',false);
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
            <span>Agregar Moneda</span>
         </strong>
        </div>
        <div class="panel-body">
          <form method="post" action="money.php">
              <div class="form-group">
                  <input type="text" class="form-control" name="money-name" placeholder="Nombre de la Moneda" required>
              </div>
              <div class="form-group">
                  <input type="text" class="form-control" name="money-symbol" placeholder="Simbolo" required>
              </div>
              
              <button type="submit" name="add_money" class="btn btn-primary">Agregar Moneda</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-9">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong>
          <span class="glyphicon glyphicon-th"></span>
          <span>Lista de Monedas</span>
       </strong>
      </div>
        <div class="panel-body">
          <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th class="text-center" style="width: 50px;">#</th>
                    <th>Nombre de moneda</th>
                    <th>Simbolo</th>
                    <th class="text-center" style="width: 100px;">Acciones</th>
                </tr>
            </thead>
            <tbody>
              <?php foreach ($all_money as $money):?>
                <tr>
                    <td class="text-center"><?php echo count_id();?></td>
                    <td><?php echo remove_junk(ucfirst($money['moneda'])); ?></td>
                    <td><?php echo remove_junk(ucfirst($money['simbolo'])); ?></td>
                    <td class="text-center">
                      <div class="btn-group">
                        <a href="edit_money.php?id=<?php echo (int)$money['id'];?>"  class="btn btn-xs btn-warning" data-toggle="tooltip" title="Editar">
                          <span class="glyphicon glyphicon-edit"></span>
                        </a>
                        <a href="delete_money.php?id=<?php echo (int)$money['id'];?>"  class="btn btn-xs btn-danger" data-toggle="tooltip" title="Eliminar">
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
