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
 					$list_requirementes=array();
 					$all_requirements  = find_all("requirements");
		 			foreach ($all_requirements as $requirements) {
		 				$list_requirementes[] =array(
		 					"numero"=>$requirements['NumberRq'],
		 					"ceco"=>$requirements['Ceco'],
		 					"categoria"=>$requirements['Categorie'],
		 					"creacion"=>$requirements['DateCreation'],
		 					"atencion"=>$requirements['DateAtention'],
		 					"estado"=>$requirements['status'],
		 					"usuario"=>$requirements['User']
		 				);
		 			}
 					echo json_encode($list_requirementes);
 					break;
 				case 'listar':
 					$categoria = $_POST['categoria'];
 					$data = join_product_categorie($categoria);
 					echo $data;
 					break;
 				case 'requerimiento':
 					$numero_requerimiento = $_POST['requirements'];
 					$list_requirementes=array();
 					$all_requirements  = find_requirements_by_number($numero_requerimiento);
		 			foreach ($all_requirements as $requirements) {
		 				$list_requirementes[] =array(
		 					"id"=>$requirements['id']
		 				);
		 			}
		 			echo json_encode($list_requirementes);
 					break;
 				case 'detalle':
 					$articulo = $_POST['articulo'];
 					$requerimiento = $_POST['requerimiento'];
 					$cantidad = $_POST['cantidad'];

 					 $query  = "INSERT INTO detailrq (";
				     $query .="RQ, Products, Quantity";
				     $query .=") VALUES (";
				     $query .=" '{$requerimiento}', '{$articulo}', '{$cantidad}'";
				     $query .=")";
				     $data =array();
				     if($db->query($query)){
				       	echo 'Registro exitoso.';
				     } else {
				       // $session->msg('d',' Lo siento, registro falló.');
				       // redirect('requirements.php', false);
				     	echo 'No se puedo regitrar el pedido';
				     }
 					break;
 				case 'pedido':
 					$requerimiento = (int)$_POST['requerimiento'];
 					$list = array();
 					$data = join_detailrq_and_products((int)$requerimiento);

 					foreach ($data as $Product) {
 						$list[] = array(
 							"id" => $Product['id'],
 							"nombre" => $Product['name'],
 							"codigo" => $Product['codigo'],
 							"cantidad" => $Product['Quantity']
 						);
 					}
 					echo json_encode($list);
 					break;
 				case 'eliminar':
 					$pedido = $_POST['pedido'];
 					$table = $_POST['table'];
 					if (delete_by_id($table,$pedido)) {
 						echo "El articulo fue quitado del pedido";
 					}else{
 						echo "Error al quitar el articulo del pedido";

 					}
 					
 					break;
 				default:
 					// code...
 					break;
 			}
 		}

 ?>