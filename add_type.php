<?php
  $page_title = 'Agregar tipo';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
?>
<?php
  if(isset($_POST['add'])){

   $req_fields = array('name_type');
   validate_fields($req_fields);

   if(find_by_groupName($_POST['name_type']) === false ){
     $session->msg('d','<b>Error!</b> El nombre de tipo realmente existe en la base de datos');
     redirect('add_type.php', false);
   }
   if(empty($errors)){
           $name = remove_junk($db->escape($_POST['name_type']));

        $query  = "INSERT INTO typy (";
        $query .="NameType";
        $query .=") VALUES (";
        $query .=" '{$name}'";
        $query .=")";
        if($db->query($query)){
          //sucess
          $session->msg('s',"Tipo ha sido creado! ");
          redirect('type.php', false);
        } else {
          //failed
          $session->msg('d','Lamentablemente no se pudo crear el tipo!');
          redirect('add_type.php', false);
        }
   } else {
     $session->msg("d", $errors);
      redirect('add_type.php',false);
   }
 }
?>
<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
       <h3>Agregar nuevo tipo</h3>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="add_type.php" class="clearfix">
        <div class="form-group">
              <label for="name" class="control-label">Nombre del tipo</label>
              <input type="name" class="form-control" name="name_type" required>
        </div>
        <div class="form-group clearfix">
                <button type="submit" name="add" class="btn btn-info">Guardar</button>
        </div>
    </form>
</div>

<?php include_once('layouts/footer.php'); ?>
