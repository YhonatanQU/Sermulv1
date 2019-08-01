<?php
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
?>
<?php
  $delete_id = delete_by_id('tipo_cambio',(int)$_GET['id']);
  if($delete_id){
      $session->msg("s","tipo de cambio eliminado");
      redirect('type-change.php');
  } else {
      $session->msg("d","Eliminación falló");
      redirect('type-change.php');
  }
?>
