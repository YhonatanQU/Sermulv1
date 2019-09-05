<?php 

  $page_title = 'Agregar producto';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(2);


  

 if (isset($_POST['option']) || !empty($_POST['option'])) {
 	
 	$option=$_POST['option'];

 	switch ($option) {

 		case "products":
 		 	$list_products=array();
 			$all_products=find_all('products');
 			foreach ($all_products as $products) {
 				$list_products[] =array(
 					"id"=>$products['id'],
 					"codigo"=>$products['codigo'],
 					"descripcion"=>$products['name']
 				);
 			}

 			echo json_encode($list_products);
 			break;

 		case "money":
 			$list_money =array();
 			$all_money =find_all('money');
 			foreach ($all_money as $money) {
 				$list_money[]=array(
 					"id"=>$money['id'],
 					"nombre"=>$money['moneda'],
 					"simbolo"=>$money['simbolo']
 				);	
 			}

 			echo json_encode($list_money);
 			break;

 		case "provider":
 			$list_provider=array();
 			$all_provider=find_all('provider');
 			foreach ($all_provider as $provider) {
 				$list_provider[]=array(
 					"id"=>$provider['id'],
 					"RazonSocial"=>$provider['RazonSocial']
 				);
 			}
 			echo json_encode($list_provider);
 			break;

 		case "price":
 			$status=$_POST['status'];
  			$list_prices=array();
 			$all_prices=join_price_status_table($status);
 			foreach ($all_prices as $prices) {
 				$list_prices[]=array(
 					"id"=>$prices['id'],
 					"codigo"=>$prices['codigo'],
 					"producto"=>$prices['product'],
 					"simbolo"=>$prices['money'],
 					"precio"=>$prices['price'],
 					"fecha"=>$prices['date_price'],
 					"proveedor"=>$prices['provider']
 				);
 			}
 			echo json_encode($list_prices);
 			break;
 		case "codigo":
 			$codigo=$_POST['codigo'];
 			$all_codigos=join_product_codigo($codigo);
 			echo $all_codigos;
 			break;
 		case "priceForm":
 			$id=$_POST['id'];
 			$dataPrice=array();
 			$price_id=join_price_table_by_id($id);
 			foreach ($price_id as $price) {
 				$dataPrice[]=array(
 					"precio"=>$price['price'],
 					"fecha"=>$price['date_price'],
 					"producto_id"=>$price['producto_id'],
 					"descripcion"=>$price['product'],
 					"moneda"=>$price['moneda'],
 					"moneda_id"=>$price['money'],
 					"moneda_simbolo"=>$price['simbolo'],
 					"codigo"=>$price['codigo'],
 					"proveedor_id"=>$price['Provider'],
 					"proveedor"=>$price['provider']
 				);
 			}
 			echo json_encode($dataPrice);
 			break;
 	}
 }

  
  // $all_categories = find_all('categories');
  // $all_photo = find_all('media');
  // $all_measure = find_all('measure');
  // $all_type = find_all('typy');
  
  
?>

