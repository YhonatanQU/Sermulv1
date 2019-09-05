<?php 
	
	$page_title = 'Agregar Precio';
	  require_once('includes/load.php');
	  // Checkin What level user has permission to view this page
	  page_require_level(2);
	  //captura datos enviados por POST ajax
		
	 if (isset($_POST['idprice']) && !empty($_POST['idprice'])) {
		$id_price=$_POST['idprice'];
		if (isset($_POST['delete']) && !empty($_POST['delete'])) {
			update_status_price_id($id_price);
		}
		$bandera=false;

	 }else{
	 	 $product=$_POST['product-name'];
	 	 update_status_price_product($product);
	 	 $bandera=true;
	 }

	 if ($bandera) {
	 	$price=$_POST['product-price'];
		$date=$_POST['product-date'];		
		$money=$_POST['product-money'];
		$provider=$_POST['product-provider'];
		$status=1;

 		 $query  = "INSERT INTO price (";
	     $query .="price, date_price, producto_id, money, Provider, status";
	     $query .=") VALUES (";
	     $query .="'{$price}', '{$date}', '{$product}', '{$money}', '{$provider}', '{$status}'";
	     $query .=")";
	     if($db->query($query)){
	 	 	echo 'Precio agregado satisfactoriamente';
	     } else {
	     	echo("Lo siento, registro falló.");
	     }
	 }else {
	 	echo $id_price;
	 }

 ?>