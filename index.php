<?php
  ob_start();
  require_once('includes/load.php');
  if($session->isUserLoggedIn(true)) { redirect('home.php', false);}

  $all_ceco = find_all('ceco');
?>
<?php include_once('layouts/header.php'); ?>
<div class="login-page">
    <div class="text-center">
       <h1>Bienvenido</h1>
       <p>Iniciar sesión </p>
     </div>
     <?php echo display_msg($msg); ?>
      <form method="post" action="auth.php" class="clearfix">
        <div class="form-group">
              <label for="username" class="control-label">Centro de costos</label>
               <select class="form-control" name="ceco">
                 <option value="">Proyecto</option>
                  <?php  foreach ($all_ceco as $ceco): ?>
                 <option value="<?php echo (int)$ceco['id'] ?>">
                  <?php echo $ceco['Description'];?>
                 </option>
                  <?php endforeach; ?>
               </select>
        </div>
        <div class="form-group">
              <label for="username" class="control-label">Usario</label>
              <input type="name" class="form-control" name="username" placeholder="Usario">
        </div>
        <div class="form-group">
            <label for="Password" class="control-label">Contraseña</label>
            <input type="password" name= "password" class="form-control" placeholder="Contraseña">
        </div>
        <div class="form-group">
                <button type="submit" class="btn btn-info  pull-right">Entrar</button>
        </div>
    </form>
</div>
<?php include_once('layouts/footer.php'); ?>
