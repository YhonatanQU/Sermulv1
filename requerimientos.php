<?php 
	$page_title = 'Requerimientos';
	  require_once('includes/load.php');
	  // Checkin What level user has permission to view this page
	  page_require_level(2);
	  //captura datos enviados por POST ajax

	  

	if(isset($_POST['rq-ceco'])){
	   $req_fields = array('rq-categorie','rq-priority', 'rq-ceco', 'rq-user', 'rq-begin', 'rq-finish', 'rq-status');
	   validate_fields($req_fields);
	   if(empty($errors)){
	   	  $numero  = make_number_rq();
	      $user=remove_junk($db->escape($_POST['rq-user']));
		  $ceco = remove_junk($db->escape($_POST['rq-ceco']));
		  $categoria = remove_junk($db->escape($_POST['rq-categorie']));
		  $prioridad = remove_junk($db->escape($_POST['rq-priority']));
		  $creacion = read_date($_POST['rq-begin']);
		  $atencion = read_date($_POST['rq-finish']);
		  $estado = remove_junk($_POST['rq-status']);    
	    
	    
	     $query  = "INSERT INTO reuirements (";
	     $query .=" NumberRq, priority, Ceco, User, Categorie, DateCreation, DateAtention, status";
	     $query .=") VALUES (";
	     $query .=" '{$numero}', '{$prioridad}', '{$ceco}', '{$user}', '{$categoria}', '{$creacion}', '{$atencion}', '{$estado}'";
	     $query .=")";
	     if($db->query($query)){
	       // $session->msg('s',"Requerimiento agregado exitosamente. ");
	       // redirect('add_detail.php', false);
	     	$data = {
	     		'categoria':$categoria,
	     		'numero':$numero
	     	};
	     	echo $numero;
	     } else {
	       // $session->msg('d',' Lo siento, registro falló.');
	       // redirect('requirements.php', false);
	     	echo 'No se puedo regitrar el requerimiento';
	     }
	   } else{
	     // $session->msg("d", $errors);
	     // redirect('add_requirements.php',false);
	   	echo 'No se puedo regitrar el requerimiento';
	   }

	 }
 ?>