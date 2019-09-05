<?php 

	$page_title = 'Centro de costos';
  	require_once('includes/load.php');
  	// Checkin What level user has permission to view this page
  	page_require_level(2);

		$codigo=$_POST['ceco-codigo'];
		$descripcion=$_POST['ceco-descripcion'];
		$nombre=$_POST['ceco-nombre'];
		$rubro=$_POST['ceco-rubro'];
		$contrato=$_POST['ceco-contrato'];
		$region=$_POST['ceco-region'];
		$distrito=$_POST['ceco-distrito'];
		$referencia=$_POST['ceco-referencia'];
		$registro=$_POST['ceco-registro'];
		$inicio=$_POST['ceco-inicio'];
		$fin=$_POST['ceco-fin'];
		$status = 1;
	
	if (isset($_POST['cecoId']) && empty($_POST['cecoId'])) {
		

		 $query  = "INSERT INTO ceco (";
	     $query .="codigo, Description, ShortName, DateRegistro, DateInicio, DateFin, Contrato, Region, Distrito, reference, rubro, status";
	     $query .=") VALUES (";
	     $query .="'{$codigo}', '{$descripcion}', '{$nombre}', '{$registro}', '{$inicio}', '{$fin}', '{$contrato}', '{$region}', '{$distrito}', '{$referencia}', '{$rubro}', '{$status}'";
	     $query .=")";
	     if($db->query($query)){
	 	 	echo 'Centro de costos agregado satisfactoriamente';
	     } else {
	     	echo("Lo siento, registro falló.");
	     }		


	}else{
		 $cecoId=$_POST['cecoId'];
		 $query  = "UPDATE ceco SET ";
	     $query .="codigo='{$codigo}', Description='{$descripcion}', ShortName='{$nombre}', DateRegistro='{$registro}', DateInicio='{$inicio}', DateFin='{$fin}', Contrato='{$contrato}', Region='{$region}', Distrito='{$distrito}', reference='{$referencia}', rubro='{$rubro}'";
	     $query .=" WHERE id = '{$cecoId}'";
	     if($db->query($query)){
	 	 	echo 'Centro de costos actualizado satisfactoriamente';
	     } else {
	     	echo("Lo siento, registro falló.");
	     }		
		//echo $cecoId . " Registro fallo por que no se neviaron datos correctamente.";
	}
 ?>