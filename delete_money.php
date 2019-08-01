<?php
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(1);
?>
<?php
  $delete_id = delete_by_id('money',(int)$_GET['id']);
  if($delete_id){
      $session->msg("s","Moneda eliminado");
      redirect('money.php');
  } else {
      $session->msg("d","Eliminación falló");
      redirect('money.php');
  }
?>
