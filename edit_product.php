<?php
  $page_title = 'Editar producto';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(2);
?>
<?php
$product = find_by_id('products',(int)$_GET['id']);
$all_categories = find_all('categories');
$all_photo = find_all('media');
$all_products = find_all('products');
$all_type = find_all('typy');
$all_measure = find_all('measure');


if(!$product){
  $session->msg("d","Missing article id.");
  redirect('product.php');
}
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
  <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>Editar producto</span>
         </strong>
        </div>
        <div class="panel-body">
         <div class="col-md-7">


          <form method="post" action="edit_product.php?id=<?php echo (int)$product['id'] ?>"class="clearfix">
                <div class="form-group col-md-8">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-title" placeholder="Descripción" value="<?php echo remove_junk($product['name']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select class="form-control" name="product-categorie">
                             <option value="">Selecciona una categoría</option>
                               <?php  foreach ($all_categories as $cat): ?>
                                 <option value="<?php echo (int)$cat['id']; ?>" <?php if($product['categorie_id'] === $cat['id']): echo "selected"; endif; ?> >
                                   <?php echo (int)$cat['Numbe'] . ' - ' . remove_junk($cat['name']); ?></option>
                               <?php endforeach; ?>
                             </select>
                      </div>
                </div>

                <div class="form-group col-md-4">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>
                        <select class="form-control" name="product-measure">
                          <option value="">Unidad de medida</option>
                              <?php  foreach ($all_measure as $measure): ?>
                                <option value="<?php echo (int)$measure['id'];?>" <?php if($product['id_measure'] === $measure['id']): echo "selected"; endif; ?> >
                                  <?php echo $measure['NameMedida'] ?></option>
                              <?php endforeach; ?>
                        </select>
                      </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-marca" placeholder="Marca" value="<?php echo remove_junk($product['marca']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-modelo" placeholder="Modelo" value="<?php echo remove_junk($product['modelo']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-serie" placeholder="Numero de serie" value="<?php echo remove_junk($product['serie']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-parte" placeholder="Numero de parte" value="<?php echo remove_junk($product['parte']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-color" placeholder="Color" value="<?php echo remove_junk($product['color']);?>">
                  </div>
                </div>

                <div class="form-group col-md-4">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>
                        <select class="form-control" name="product-photo">
                         <option value="">Selecciona una imagen</option>
                          <?php  foreach ($all_photo as $photo): ?>
                          <option value="<?php echo (int)$photo['id']; ?>" <?php if($product['media_id'] === $photo['id']): echo "selected"; endif; ?>>
                          <?php echo $photo['file_name']; ?></option>
                          <?php endforeach; ?>
                        </select>
                      </div>
                </div>               
              
                 <div class="form-group col-md-4">
                  <div class="input-group">
                      <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                      </span>
                      <select class="form-control" name="product-type">
                      <option value="">Tipo</option>
                      <?php  foreach ($all_type as $type): ?>
                          <option value="<?php echo (int)$type['id']; ?>" <?php if($product['tipo'] === $type['id']): echo "selected"; endif; ?> >
                          <?php echo $type['NameType']; ?></option>
                      <?php endforeach; ?>
                    </select>
                  </div>
                 </div>

                 <div class="form-group col-md-4">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                      </span>
                     <input type="text" class="form-control" name="product-codigo" placeholder="Codigo" value="<?php echo remove_junk($product['codigo']);?>">
                  </div>
                 </div>

                 <div class="form-group col-md-3">
                   <div class="input-group">
                     <button type="submit" name="product" class="btn btn-danger">Agregar articulo</button>
                  </div>
                 </div>
          </form>
         </div>
        </div>
      </div>
  </div>

<?php include_once('layouts/footer.php'); ?>
