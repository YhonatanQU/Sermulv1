<?php
  $page_title = 'Editar medida';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>
<?php
  //Display all measures.
  $measure = find_by_id('measure',(int)$_GET['id']);


  if(!$measure){
    $session->msg("d","Missing measure id.");
    redirect('measure.php');
  }
?>

<?php
if(isset($_POST['edit_cat'])){
  $req_field = array('measure-name');
  validate_fields($req_field);
  $cat_name = remove_junk($db->escape($_POST['measure-name']));
  $cat_type = remove_junk($db->escape($_POST['measure-short']));
  if(empty($errors)){
        $sql = "UPDATE measure SET NameMedida='{$cat_name}', ShortName='{$cat_type}'";
       $sql .= " WHERE id='{$measure['id']}'";
     $result = $db->query($sql);
     if($result && $db->affected_rows() === 1) {
       $session->msg("s", "Medida actualizada con éxito.");
       redirect('measure.php',false);
     } else {
       $session->msg("d", "Lo siento, actualización falló.");
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
   <div class="col-md-5">
     <div class="panel panel-default">
       <div class="panel-heading">
         <strong>
           <span class="glyphicon glyphicon-th"></span>
           <span>Editando <?php echo remove_junk(ucfirst($measure['NameMedida']));?></span>
        </strong>
       </div>
       <div class="panel-body">
         <form method="post" action="edit_measure.php?id=<?php echo (int)$measure['id'];?>">
           <div class="form-group">
               <input type="text" class="form-control" name="measure-name" value="<?php echo remove_junk(ucfirst($measure['NameMedida']));?>">
           </div>
           <div class="form-group">
               <input type="text" class="form-control" name="measure-short" value="<?php echo remove_junk(ucfirst($measure['ShortName']));?>">
           </div>
           
           <button type="submit" name="edit_cat" class="btn btn-primary">Actualizar medida</button>
       </form>
       </div>
     </div>
   </div>
</div>



<?php include_once('layouts/footer.php'); ?>
