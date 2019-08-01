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
    <div class="col-md-6">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
         <div class="pull-right">
           <a href="add_product.php" class="btn btn-primary" title="Ingresar articulo" data-toggle="tooltip">
             <span class="glyphicon glyphicon-plus"></span>
           </a>
         </div>
         <div class="btn-group">
            <a href="edit_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-warning"  title="Editar" data-toggle="tooltip">
              <span class="glyphicon glyphicon-edit"></span>
            </a>
            <a href="delete_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-success"  title="Imprimir" data-toggle="tooltip">
              <span class="glyphicon glyphicon-print"></span>
            </a>
             <a href="delete_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-danger"  title="Eliminar" data-toggle="tooltip">
              <span class="glyphicon glyphicon-trash"></span>
            </a>
         </div>
        </div>
        <div class="panel-body">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th class="text-left" colspan="2">DETALLE DE ARTICULO

                  <?php 
                    foreach ($products as $product ) {
                      //echo remove_junk($product['name']); 
                    }
                  ?>
                    
                </th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan="2"> <img src="uploads/products/<?php echo remove_junk($product['image']); ?>" alt=""></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Descripcion</strong> </td>
                <td> <?php echo remove_junk($product['name']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Codigo</strong> </td>
                <td> <?php echo remove_junk($product['codigo']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Marca</strong> </td>
                <td> <?php echo remove_junk($product['marca']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Modelo</strong> </td>
                <td> <?php echo remove_junk($product['modelo']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Unidad de medida</strong> </td>
                <td> <?php echo remove_junk($product['NombreMedida']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Fecha de registro</strong> </td>
                <td> <?php echo remove_junk($product['date']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Numero de parte</strong> </td>
                <td> <?php echo remove_junk($product['parte']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Numero de serie</strong> </td>
                <td> <?php echo remove_junk($product['serie']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Color</strong> </td>
                <td> <?php echo remove_junk($product['color']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Tipo de articulo</strong> </td>
                <td> <?php echo remove_junk($product['tipo']); ?></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Categoria</strong> </td>
                <td> <?php echo remove_junk($product['nombre']); ?></td>
              </tr>
             
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php include_once('layouts/footer.php'); ?>
