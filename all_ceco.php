<?php 
	$page_title = 'Centro de costos';
  	require_once('includes/load.php');
  	// Checkin What level user has permission to view this page
  	page_require_level(2);

  	if (isset($_POST['option']) || empty($_POST['option'])) {
  		$option=$_POST['option'];
  		 switch ($option) {
  		 	case 'listar':
  		 		$ceco = $_POST['ceco'];
  		 		$status = $_POST['status'];
  		 		 $data_ceco = ceco_by_status($status);
  		 		 echo json_encode($data_ceco);
  		 		break;
  		 	case 'eliminar':
  		 		$id_ceco = $_POST['ceco'];
  		 		$table = 'ceco';
  		 		
  		 		if (update_status_ceco_id($id_ceco)) {
  		 			echo 'Centro de costos eliminado.';
  		 		}else{
  		 			echo 'Error al eliminar centor de costos.';
  		 		}
  		 		break;
  		 	case 'actualizar':
  		 		$id_ceco = $_POST['cecoId'];
  		 		$ceco_id = find_ceco_by_id($id_ceco);
  		 		echo $ceco_id;
  		 		break;
  		 	
		}
  	}
  	else{
  		echo 'aqui entamos';
  	}

 ?>