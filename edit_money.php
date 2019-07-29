<?php
  $page_title = 'Editar moneda';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>
<?php
  //Display all catgories.
  $money = find_by_id('money',(int)$_GET['id']);
  if(!$money){
    $session->msg("d","Missing money id.");
    redirect('money.php');
  }
?>

<?php
if(isset($_POST['edit_money'])){
  $req_field = array('money-name');
  validate_fields($req_field);
  $money_name = remove_junk($db->escape($_POST['money-name']));
  $money_symbol = remove_junk($db->escape($_POST['money-symbol']));
  if(empty($errors)){
        $sql = "UPDATE money SET moneda='{$money_name}', simbolo='{$money_symbol}'";
       $sql .= " WHERE id='{$money['id']}'";
     $result = $db->query($sql);
     if($result && $db->affected_rows() === 1) {
       $session->msg("s", "moneda actualizada con éxito.");
       redirect('money.php',false);
     } else {
       $session->msg("d", "Lo siento, actualización falló.");
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
   <div class="col-md-5">
     <div class="panel panel-default">
       <div class="panel-heading">
         <strong>
           <span class="glyphicon glyphicon-th"></span>
           <span>Editando <?php echo remove_junk(ucfirst($money['moneda']));?></span>
        </strong>
       </div>
       <div class="panel-body">
         <form method="post" action="edit_money.php?id=<?php echo (int)$money['id'];?>">
           <div class="form-group">
               <input type="text" class="form-control" name="money-name" value="<?php echo remove_junk(ucfirst($money['moneda']));?>">
           </div>
           <div class="form-group">
               <input type="text" class="form-control" name="money-symbol" value="<?php echo remove_junk(ucfirst($money['simbolo']));?>">
           </div>
           
           <button type="submit" name="edit_money" class="btn btn-primary">Actualizar moneda</button>
       </form>
       </div>
     </div>
   </div>
</div>



<?php include_once('layouts/footer.php'); ?>
