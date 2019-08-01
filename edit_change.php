<?php
  $page_title = 'Editar tipo de cambio';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
?>
<?php
  $e_change = find_by_id('tipo_cambio',(int)$_GET['id']);
  if(!$e_change){
    $session->msg("d","Missing type change id.");
    redirect('type-change.php');
  }
?>
<?php
  if(isset($_POST['update'])){

   $req_fields = array('change-day');
   validate_fields($req_fields);
   if(empty($errors)){
           $change_day = remove_junk($db->escape($_POST['change-day']));
           $change_date = remove_junk($db->escape($_POST['change-date']));
           $change_buy = remove_junk($db->escape($_POST['change-buy']));
           $change_sale = remove_junk($db->escape($_POST['change-sale']));

        $query  = "UPDATE tipo_cambio SET ";
        $query .= "dia='{$change_day}', date='{$change_date}', compra='{$change_buy}', venta='{$change_sale}'";
        $query .= "WHERE id='{$db->escape($e_change['id'])}'";
        $result = $db->query($query);
         if($result && $db->affected_rows() === 1){
          //sucess
          $session->msg('s',"Tipo de cambio se ha actualizado! ");
          redirect('type-change.php?id='.(int)$e_change['id'], false);
        } else {
          //failed
          $session->msg('d','Lamentablemente no se ha actualizado el tipo de cambio!');
          redirect('type-change.php?id='.(int)$e_change['id'], false);
        }
   } else {
     $session->msg("d", $errors);
    redirect('type-change.php?id='.(int)$e_change['id'], false);
   }
 }
?>
<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
       <h3>Editar tipo</h3>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="edit_change.php?id=<?php echo (int)$e_change['id'];?>" class="clearfix">
        <div class="form-group">
              <label for="name" class="control-label">Dia</label>
              <input type="name" class="form-control" name="change-day" value="<?php echo remove_junk(ucwords($e_change['dia'])); ?>">
        </div>

        <div class="form-group">
              <label for="name" class="control-label">Fecha</label>
              <input type="name" class="form-control" name="change-date" value="<?php echo remove_junk(ucwords($e_change['date'])); ?>">
        </div>

        <div class="form-group">
              <label for="name" class="control-label">Compra</label>
              <input type="name" class="form-control" name="change-buy" value="<?php echo remove_junk(ucwords($e_change['compra'])); ?>">
        </div>

        <div class="form-group">
              <label for="name" class="control-label">Venta</label>
              <input type="name" class="form-control" name="change-sale" value="<?php echo remove_junk(ucwords($e_change['venta'])); ?>">
        </div>
        <div class="form-group clearfix">
                <button type="submit" name="update" class="btn btn-info">Actualizar</button>
        </div>
    </form>
</div>

<?php include_once('layouts/footer.php'); ?>
