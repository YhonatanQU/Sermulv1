<?php
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(1);
?>
<?php
  $measure = find_by_id('measure',(int)$_GET['id']);
  if(!$measure){
    $session->msg("d","ID de la medida falta.");
    redirect('measure.php');
  }
?>
<?php
  $delete_id = delete_by_id('measure',(int)$measure['id']);
  if($delete_id){
      $session->msg("s","Medida eliminada");
      redirect('measure.php');
  } else {
      $session->msg("d","Eliminación falló");
      redirect('measure.php');
  }
?>
