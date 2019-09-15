<?php
  $page_title = 'Lista de productos';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(2);
  $products = join_product_table();
?>
<?php include_once('layouts/header.php'); ?>
  <div class="row">
     <div class="col-md-12">
       <?php echo display_msg($msg); ?>
     </div>
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
         <div class="pull-right">
           <a href="add_product.php" class="btn btn-primary">Agragar articulo</a>
         </div>
        </div>
        <div class="panel-body">
          <table class="display" id="table-id">
            <thead>
              <tr>
                <th class="text-center" >#</th>
                <th class="text-center" > Codigo </th>
                <th class="text-center" > Descripcion </th>
                <th class="text-center" > Categoría </th>
                <th class="text-center" > UM </th>
                <th class="text-center" > Tipo </th>
                <th class="text-center" > Marca </th>
                <th class="text-center" style="width: 10%;"> F.Entrada </th>
                
                <th class="text-center" style="width: 10%;"> Acciones </th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product):?>
              <tr>
                <td class="text-center"><?php echo count_id();?></td>
                <!-- <td>
                  <?php //if($product['media_id'] === '0'): ?>
                    <img class="img-avatar img-circle" src="uploads/products/no_image.jpg" alt="">
                  <?php //else: ?>
                  <img class="img-avatar img-circle" src="uploads/products/<?php // echo $product['image']; ?>" alt="">
                <?php // endif; ?>
                </td> -->
                <td> <?php echo remove_junk($product['codigo']); ?></td>
                <td class="text-left"> <?php echo remove_junk($product['name']); ?></td>
                <td class="text-center"> <?php echo remove_junk($product['categorie']); ?></td>
                <td class="text-center"> <?php echo remove_junk($product['medida']); ?></td>
                <td class="text-center"> <?php echo remove_junk($product['tipo']); ?></td>
                <td class="text-center"> <?php echo remove_junk($product['marca']); ?></td>
                <td class="text-center"> <?php echo read_date($product['date']); ?></td>
                <td class="text-center">
                  <div class="btn-group">
                    <a href="detail_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-warning btn-xs"  title="Detalles" data-toggle="tooltip">
                      <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    <a href="edit_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-info btn-xs"  title="Editar" data-toggle="tooltip">
                      <span class="glyphicon glyphicon-edit"></span>
                    </a>
                     <a href="delete_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-danger btn-xs"  title="Eliminar" data-toggle="tooltip">
                      <span class="glyphicon glyphicon-trash"></span>
                    </a>
                  </div>
                </td>
              </tr>
             <?php endforeach; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php include_once('layouts/footer.php'); ?>
