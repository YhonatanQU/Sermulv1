<?php
  $page_title = 'Editar precio';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(2);
?>
<?php
    
  if ($_GET['id']!=0) {
    $price = find_by_id('price',(int)$_GET['id']);
    $get=1;

        if(!$price){
          $session->msg("d","Missing price id.");
          redirect('price.php');
        }
  }else{
    $price = find_all('price');
    $get=0;
  }
 
    $all_product = find_all('products');
    $all_change = find_all('tipo_cambio');
    $all_money = find_all('money');
    $all_provider = find_all('provider');


?>
<?php
 if(isset($_POST['product'])){
    $req_fields = array('product-title', 'product-codigo', 'product-marca', 'product-modelo', 'product-categorie', 'product-measure', 'product-parte', 'product-serie', 'product-color', 'product-type');
    validate_fields($req_fields);

   if(empty($errors)){
       $p_name  = remove_junk($db->escape($_POST['product-title']));
       $p_codigo  = remove_junk($db->escape($_POST['product-codigo']));
       $p_marca  = remove_junk($db->escape($_POST['product-marca']));
       $p_modelo  = remove_junk($db->escape($_POST['product-modelo']));
       $p_cat   = remove_junk($db->escape($_POST['product-categorie']));
       $p_measure  = remove_junk($db->escape($_POST['product-measure']));
       $p_parte  = remove_junk($db->escape($_POST['product-parte']));     
       $p_serie = remove_junk($db->escape($_POST['product-serie']));
       $p_color   = remove_junk($db->escape($_POST['product-color']));
       $p_type  = remove_junk($db->escape($_POST['product-type']));
       if (is_null($_POST['product-photo']) || $_POST['product-photo'] === "") {
         $media_id = '0';
       } else {
         $media_id = remove_junk($db->escape($_POST['product-photo']));
       }
       $query   = "UPDATE products SET";
       $query  .=" name ='{$p_name}', codigo ='{$p_codigo}', marca='{$p_marca}', modelo='{$p_modelo}', categorie_id='{$p_cat}', media_id='{$media_id}' , ";
       $query  .="id_measure='{$p_measure}', parte='{$p_parte}', serie='{$p_serie}', color='{$p_color}', tipo='{$p_type}' ";
       $query  .=" WHERE id ='{$product['id']}'";
       $result = $db->query($query);
               if($result && $db->affected_rows() === 1){
                 $session->msg('s',"Articulo ha sido actualizado. ");
                 redirect('product.php', false);
               } else {
                 $session->msg('d',' Lo siento, actualización falló.');
                 redirect('edit_product.php?id='.$product['id'], false);
               }

   } else{
       $session->msg("d", $errors);
       redirect('edit_product.php?id='.$product['id'], false);
   }

 }

?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-12">
    <?php echo display_msg($msg); ?>
  </div>
</div>
  <div class="row col-md-8">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span> 
              <?php 
                if ($get!=0){
                  foreach ($all_product as $product){
                    if ($price['producto_id'] === $product['id']) {
                      echo "actualizar precio de ". remove_junk($product['name']);
                    }
                                    
                  }
                }            
                else{
                  echo "registrar precio";
                }
                    
                 
              ?>
            </span>
         </strong>
        </div>
        <div class="panel-body">
         <div class="col-md-12">


          <form method="post" id="prices"  class="clearfix">
                
                <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>
                        
                        <select id="product" class="form-control" name="product-name">
                             <option value="">Selecciona un articulo</option>
                               <?php  foreach ($all_product as $product): ?>
                                 <option value="<?php echo (int)$product['id']; ?>" 
                                    <?php 
                                      if ($get!=0) {
                                        if($price['producto_id'] === $product['id']): echo "selected"; endif;
                                      }                                    
                                    ?> 
                                  >
                                   <?php echo (int)$product['codigo'] . ' - ' . remove_junk($product['name']); ?></option>
                               <?php endforeach; ?>
                             </select>
                       
                      </div>
                </div>
                <div class="form-group col-md-4">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select id="money" class="form-control" name="product-money">
                             <option value="">T. Moneda</option>
                               <?php  foreach ($all_money as $money): ?>
                                 <option value="<?php echo (int)$money['id']; ?>" 
                                    <?php 
                                      if ($get!=0) {
                                        if($price['money'] === $money['id']): echo "selected"; endif;
                                      }                      
                                    ?> 
                                  >
                                   <?php echo remove_junk($money['moneda']) . ' - ' . remove_junk($money['simbolo']); ?></option>
                               <?php endforeach; ?>
                             </select>
                      </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input id="price" type="text" class="form-control" name="product-price" placeholder="Precio" value=" <?php if($get != 0): echo $price['price'] ; endif; ?> ">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input id="date" class="datepicker form-control" name="product-date"  value=" <?php if($get != 0): echo $price['date_price'] ; endif; ?> " placeholder="Fecha de registro">
                  </div>
                </div>

                <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select id="provider" class="form-control" name="product-provider">
                             <option value="">Selecciona proveedor</option>
                               <?php  foreach ($all_provider as $provider): ?>
                                 <option value="<?php echo (int)$provider['id']; ?>" 
                                    <?php 
                                      if ($get!=0) {
                                        if($price['Provider'] === $provider['id']): echo "selected"; endif;
                                      }                      
                                    ?> 
                                  >
                                   <?php echo remove_junk($provider['Ruc']) . ' - ' . remove_junk($provider['RazonSocial']); ?></option>
                               <?php endforeach; ?>
                             </select>
                      </div>
                </div> 

                <div class="form-group col-md-12">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select id="change" class="form-control" name="product-change">
                             <option value="">T. cambio</option>
                               <?php  foreach ($all_change as $change): ?>
                                 <option value="<?php echo (int)$change['id']; ?>" 
                                    <?php 
                                      if ($get!=0) {
                                        if($price['tipo_cambio'] === $change['id']): echo "selected"; endif;
                                      }                      
                                    ?> 
                                  >
                                   <?php echo remove_junk($change['venta']); ?></option>
                               <?php endforeach; ?>
                             </select>
                      </div>
                </div>      
                
                 <div class="form-group col-md-3">
                   <div class="input-group">
                     <input type="number" name="id-price" class="form-control" value="<?php echo (int)$price['id']; ?>">
                  </div>
                 </div>

                 <div class="form-group col-md-3">
                   <div class="input-group">
                     <input type="submit" name="price" class="btn btn-danger" value="Agregar precio">
                  </div>
                 </div>

                 <div class="respuesta" id="respuesta"> <br></div>
          </form>
         </div>

        </div>
      </div>
  </div>

<?php include_once('layouts/footer.php'); ?>
