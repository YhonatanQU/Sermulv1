<?php
  $page_title = 'Editar Grupo';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
?>
<?php
  $e_tipo = find_by_id('typy',(int)$_GET['id']);
  if(!$e_tipo){
    $session->msg("d","Missing tipo id.");
    redirect('type.php');
  }
?>
<?php
  if(isset($_POST['update'])){

   $req_fields = array('type_name');
   validate_fields($req_fields);
   if(empty($errors)){
           $name = remove_junk($db->escape($_POST['type_name']));

        $query  = "UPDATE typy SET ";
        $query .= "NameType='{$name}'";
        $query .= "WHERE ID='{$db->escape($e_tipo['id'])}'";
        $result = $db->query($query);
         if($result && $db->affected_rows() === 1){
          //sucess
          $session->msg('s',"Tipo se ha actualizado! ");
          redirect('type.php?id='.(int)$e_tipo['id'], false);
        } else {
          //failed
          $session->msg('d','Lamentablemente no se ha actualizado el tipo!');
          redirect('edit_type.php?id='.(int)$e_tipo['id'], false);
        }
   } else {
     $session->msg("d", $errors);
    redirect('edit_type.php?id='.(int)$e_tipo['id'], false);
   }
 }
?>
<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
       <h3>Editar tipo</h3>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="edit_type.php?id=<?php echo (int)$e_tipo['id'];?>" class="clearfix">
        <div class="form-group">
              <label for="name" class="control-label">Nombre del tipo</label>
              <input type="name" class="form-control" name="type_name" value="<?php echo remove_junk(ucwords($e_tipo['NameType'])); ?>">
        </div>
        <div class="form-group clearfix">
                <button type="submit" name="update" class="btn btn-info">Actualizar</button>
        </div>
    </form>
</div>

<?php include_once('layouts/footer.php'); ?>
