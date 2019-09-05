<?php
  $page_title = 'Agregar producto';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
  page_require_level(2);
  $all_categories = find_all('categories');
  $all_photo = find_all('media');
  $all_measure = find_all('measure');
  $all_rq = find_all('reuirements');
  
  
?>
<?php
 if(isset($_POST['add_product'])){
   $req_fields = array('product-title','product-categorie','product-codigo','product-photo' );
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
     $p_date    = make_date();
     $query  = "INSERT INTO products (";
     $query .=" name,codigo,marca,modelo,categorie_id,media_id,id_measure,date,parte,serie,color,tipo";
     $query .=") VALUES (";
     $query .=" '{$p_name}', '{$p_codigo}', '{$p_marca}', '{$p_modelo}', '{$p_cat}', '{$media_id}', '{$p_measure}', '{$p_date}', '{$p_parte}', '{$p_serie}', '{$p_color}', '{$p_type}'";
     $query .=")";
     $query .=" ON DUPLICATE KEY UPDATE name='{$p_name}'";
     if($db->query($query)){
       $session->msg('s',"Producto agregado exitosamente. ");
       redirect('add_product.php', false);
     } else {
       $session->msg('d',' Lo siento, registro falló.');
       redirect('product.php', false);
     }

   } else{
     $session->msg("d", $errors);
     redirect('add_product.php',false);
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
  <div class="col-md-9">
      <div class="panel panel-default">
        <div class="panel-heading">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>detalles</span>
         </strong>
        </div>
        <div class="panel-body">
         <div class="col-md-12">
          <form method="post" action="add_product.php" class="clearfix">

                <div class="form-group col-md-4">
                      <div class="input-group">
                        <span class="input-group-addon">
                         <i class="glyphicon glyphicon-th-large"></i>
                        </span>

                        <select class="form-control" name="product-rq">
                           <option value="">Requeriemiento</option>
                            <?php  foreach ($all_rq as $rq): ?>
                            <?php  if ($rq['status'] == ""): ?>
                              <option value="<?php echo (int)$rq['id'] ?>">
                                <?php echo $rq['NumberRq'];?>
                              </option>
                            <?php endif; ?>   
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
                          <option value="<?php echo (int)$measure['id'] ?>">
                              <?php echo $measure['NameMedida'] ?>                    
                          </option>
                          <?php endforeach; ?>
                        </select>
                      </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-marca" placeholder="Marca">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-modelo" placeholder="Modelo">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-serie" placeholder="Numero de serie">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-parte" placeholder="Numero de parte">
                  </div>
                </div>

                <div class="form-group col-md-4">
                  <div class="input-group">
                    <span class="input-group-addon">
                     <i class="glyphicon glyphicon-th-large"></i>
                    </span>
                    <input type="text" class="form-control" name="product-color" placeholder="Color">
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
                        <option value="<?php echo (int)$photo['id'] ?>">
                          <?php echo $photo['file_name'] ?></option>
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
                          <option value="<?php echo (int)$type['id'] ?>">
                          <?php echo $type['NameType'] ?></option>
                        <?php endforeach; ?>
                    </select>
                  </div>
                 </div>

                 <div class="form-group col-md-4">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <i class="glyphicon glyphicon-th-large"></i>
                      </span>
                     <input type="text" class="form-control" name="product-codigo" placeholder="Codigo">
                  </div>
                 </div>

                 <div class="form-group col-md-3">
                   <div class="input-group">
                     <button type="submit" name="add_product" class="btn btn-danger">Agregar articulo</button>
                  </div>
                 </div>

                 <div class="form-group col-md-4">
                   <div class="input-group">
                     <a href="media.php" name="add_photo" class="btn btn-success">Agregar foto de articulo</a>
                  </div>
                 </div> 
                 
              
          </form>
         </div>
        </div>
      </div>
    </div>
  </div>

<?php include_once('layouts/footer.php'); ?>
