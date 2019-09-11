<?php 
	
	  $page_title = 'Requerimiento';
	  require_once('includes/load.php');
	  // Checkin What level user has permission to view this page
	  page_require_level(2);
	  //captura datos enviados por POST ajax

	   if (isset($_POST['option']) || !empty($_POST['option'])) {
 	
 			$option=$_POST['option'];

 			switch ($option) {
 				case 'lista':
 					$table = $_POST['table'];
 					$list_requiremnets=array();
 					$all_requirements  = find_all("requirements");
		 			foreach ($all_requirements as $requirements) {
		 				$list_requiremnets[] =array(
		 					"numero"=>$requirements['NumberRq'],
		 					"ceco"=>$requirements['Ceco'],
		 					"categoria"=>$requirements['Categorie'],
		 					"creacion"=>$requirements['DateCreation'],
		 					"atencion"=>$requirements['DateAtention'],
		 					"estado"=>$requirements['status'],
		 					"usuario"=>$requirements['User']
		 				);
		 			}
 					echo json_encode($list_requiremnets);
 					break;
 				case 'listar':
 					$categoria = $_POST['categoria'];
 					$data = join_product_categorie($categoria);
 					echo $data;
 					break;
 				
 				default:
 					// code...
 					break;
 			}
 		}

 ?>