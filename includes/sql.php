<?php
  require_once('includes/load.php');

/*--------------------------------------------------------------*/
/* Function for find all database table rows by table name
/*--------------------------------------------------------------*/
function find_all($table) {
   global $db;
   if(tableExists($table))
   {
     return find_by_sql("SELECT * FROM ".$db->escape($table)."  ORDER BY id DESC");
   }
}
/*--------------------------------------------------------------*/
/* Function for Perform queries
/*--------------------------------------------------------------*/
function find_by_sql($sql)
{
  global $db;
  $result = $db->query($sql);
  $result_set = $db->while_loop($result);
 return $result_set;
}
/*--------------------------------------------------------------*/
/*  Function for Find data from table by id
/*--------------------------------------------------------------*/
function find_by_id($table,$id)
{
  global $db;
  $id = (int)$id;
    if(tableExists($table)){
          $sql = $db->query("SELECT * FROM {$db->escape($table)} WHERE id='{$db->escape($id)}' LIMIT 1");
          if($result = $db->fetch_assoc($sql))
            return $result;
          else
            return null;
     }
}
/*--------------------------------------------------------------*/
/* Function for Delete data from table by id
/*--------------------------------------------------------------*/
function delete_by_id($table,$id)
{
  global $db;
  if(tableExists($table))
   {
    $sql = "DELETE FROM ".$db->escape($table);
    $sql .= " WHERE id=". $db->escape($id);
    $sql .= " LIMIT 1";
    $db->query($sql);
    return ($db->affected_rows() === 1) ? true : false;
   }
}
/*--------------------------------------------------------------*/
/* Function for Count id  By table name
/*--------------------------------------------------------------*/

function count_by_id($table){
  global $db;
  if(tableExists($table))
  {
    $sql    = "SELECT COUNT(id) AS total FROM ".$db->escape($table);
    $result = $db->query($sql);
     return($db->fetch_assoc($result));
  }
}
/*--------------------------------------------------------------*/
/* Determine if database table exists
/*--------------------------------------------------------------*/
function tableExists($table){
  global $db;
  $table_exit = $db->query('SHOW TABLES FROM '.DB_NAME.' LIKE "'.$db->escape($table).'"');
      if($table_exit) {
        if($db->num_rows($table_exit) > 0)
              return true;
         else
              return false;
      }
  }
 /*--------------------------------------------------------------*/
 /* Login with the data provided in $_POST,
 /* coming from the login form.
/*--------------------------------------------------------------*/
  function authenticate($username='', $password='') {
    global $db;
    $username = $db->escape($username);
    $password = $db->escape($password);
    $sql  = sprintf("SELECT id,username,password,user_level FROM users WHERE username ='%s' LIMIT 1", $username);
    $result = $db->query($sql);
    if($db->num_rows($result)){
      $user = $db->fetch_assoc($result);
      $password_request = sha1($password);
      if($password_request === $user['password'] ){
        return $user['id'];
      }
    }
   return false;
  }
  /*--------------------------------------------------------------*/
  /* Login with the data provided in $_POST,
  /* coming from the login_v2.php form.
  /* If you used this method then remove authenticate function.
 /*--------------------------------------------------------------*/
   function authenticate_v2($username='', $password='') {
     global $db;
     $username = $db->escape($username);
     $password = $db->escape($password);
     $sql  = sprintf("SELECT id,username,password,user_level FROM users WHERE username ='%s' LIMIT 1", $username);
     $result = $db->query($sql);
     if($db->num_rows($result)){
       $user = $db->fetch_assoc($result);
       $password_request = sha1($password);
       if($password_request === $user['password'] ){
         return $user;
       }
     }
    return false;
   }


  /*--------------------------------------------------------------*/
  /* Find current log in user by session id
  /*--------------------------------------------------------------*/
  function current_user(){
      static $current_user;
      global $db;
      if(!$current_user){
         if(isset($_SESSION['user_id'])):
             $user_id = intval($_SESSION['user_id']);
             $current_user = find_by_id('users',$user_id);
        endif;
      }
    return $current_user;
  }
  /*--------------------------------------------------------------*/
  /* Find all user by
  /* Joining users table and user gropus table
  /*--------------------------------------------------------------*/
  function find_all_user(){
      global $db;
      $results = array();
      $sql = "SELECT u.id,u.name,u.username,u.user_level,u.status,u.last_login,";
      $sql .="g.group_name ";
      $sql .="FROM users u ";
      $sql .="LEFT JOIN user_groups g ";
      $sql .="ON g.group_level=u.user_level ORDER BY u.name ASC";
      $result = find_by_sql($sql);
      return $result;
  }
  /*--------------------------------------------------------------*/
  /* Find all user by
  /* Joining users table and user persons table
  /*--------------------------------------------------------------*/
  function join_detailrq_and_products($id_requerimiento){
      global $db;
      $id=(int)$id_requerimiento;
      $results = array();
      $sql = "SELECT d.id, d.Quantity, p.name AS name, c.codigo AS codigo FROM detailrq d";
      $sql .=" LEFT JOIN products p ON p.id = d.Products";
      $sql .=" LEFT JOIN products c ON c.id = d.Products";
      $sql .=" WHERE d.RQ = $id ";
      $result = find_by_sql($sql);
      return $result;
  }
  /*--------------------------------------------------------------*/
  /* Find all user by
  /* Joining users table and user persons table
  /*--------------------------------------------------------------*/
  function join_user_and_persons($name){
      global $db;
      $results = array();
      $sql = "SELECT u.name, n.Names AS names, a.Apellidos as apellidos FROM users u";
      $sql .=" LEFT JOIN persons p ON p.id = u.name";
      $sql .=" LEFT JOIN persons n ON n.id = u.name";
      $sql .=" LEFT JOIN persons a ON a.id = u.name";
      $sql .=" WHERE u.name = $name";
      $result = find_by_sql($sql);
      return $result;
  }
  /*--------------------------------------------------------------*/
  /* Function to update the last log in of a user
  /*--------------------------------------------------------------*/

 function updateLastLogIn($user_id)
	{
		global $db;
    $date = make_date();
    $sql = "UPDATE users SET last_login='{$date}' WHERE id ='{$user_id}' LIMIT 1";
    $result = $db->query($sql);
    return ($result && $db->affected_rows() === 1 ? true : false);
	}

  /*--------------------------------------------------------------*/
  /* Find all Group name
  /*--------------------------------------------------------------*/
  function find_by_groupName($val)
  {
    global $db;
    $sql = "SELECT group_name FROM user_groups WHERE group_name = '{$db->escape($val)}' LIMIT 1 ";
    $result = $db->query($sql);
    return($db->num_rows($result) === 0 ? true : false);
  }
  /*--------------------------------------------------------------*/
  /* Find group level
  /*--------------------------------------------------------------*/
  function find_by_groupLevel($level)
  {
    global $db;
    $sql = "SELECT group_level FROM user_groups WHERE group_level = '{$db->escape($level)}' LIMIT 1 ";
    $result = $db->query($sql);
    return($db->num_rows($result) === 0 ? true : false);
  }
  /*--------------------------------------------------------------*/
  /* Function for cheaking which user level has access to page
  /*--------------------------------------------------------------*/
   function page_require_level($require_level){
     global $session;
     $current_user = current_user();
     $login_level = find_by_groupLevel($current_user['user_level']);
     //if user not login
     if (!$session->isUserLoggedIn(true)):
            $session->msg('d','Por favor Iniciar sesión...');
            redirect('index.php', false);
      //if Group status Deactive
     elseif($login_level['group_status'] === '0'):
           $session->msg('d','Este nivel de usaurio esta inactivo!');
           redirect('home.php',false);
      //cheackin log in User level and Require level is Less than or equal to
     elseif($current_user['user_level'] <= (int)$require_level):
              return true;
      else:
            $session->msg("d", "¡Lo siento!  no tienes permiso para ver la página.");
            redirect('home.php', false);
        endif;

     }
   /*--------------------------------------------------------------*/
   /* Function for Finding all ceco
   /* 
   /*--------------------------------------------------------------*/
  function ceco_by_status($status){
    global $db;
    $sql = "SELECT * FROM ceco WHERE status = '{$db->escape($status)}'";    
    return find_by_sql($sql);
   }
   /*--------------------------------------------------------------*/
   /* Function for Finding all product name
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_product_codigo($codigo){
     global $db;
     $sql  =" SELECT p.id,p.name,p.codigo,p.marca,p.modelo,p.date,p.parte,p.serie,p.color,p.tipo,c.ShortName";
    $sql  .=" AS categorie, m.file_name AS image, u.ShortName AS medida, t.NameType AS tipo, n.name AS nombre, l.NameMedida AS NombreMedida";
    $sql  .=" FROM products p";
    $sql  .=" LEFT JOIN categories c ON c.id = p.categorie_id";
    $sql  .=" LEFT JOIN categories n ON n.id = p.categorie_id";
    $sql  .=" LEFT JOIN measure u ON u.id = p.id_measure";    
    $sql  .=" LEFT JOIN measure l ON l.id = p.id_measure";    
    $sql  .=" LEFT JOIN typy t ON t.id = p.tipo";    
    $sql  .=" LEFT JOIN media m ON m.id = p.media_id";
    $sql  .=" WHERE p.codigo = $codigo ORDER BY p.id ASC";
    $result = find_by_sql($sql);
    return json_encode($result);
   }
   /*--------------------------------------------------------------*/
   /* Function for Finding all product name
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_product_categorie($categorie){
     global $db;
     $sql  =" SELECT p.id,p.name,p.codigo,p.marca,p.modelo,p.date,p.parte,p.serie,p.color,p.tipo,p.categorie_id,c.ShortName";
    $sql  .=" AS categorie, m.file_name AS image, u.ShortName AS medida, t.NameType AS tipo, n.name AS nombre, l.NameMedida AS NombreMedida";
    $sql  .=" FROM products p";
    $sql  .=" LEFT JOIN categories c ON c.id = p.categorie_id";
    $sql  .=" LEFT JOIN categories n ON n.id = p.categorie_id";
    $sql  .=" LEFT JOIN measure u ON u.id = p.id_measure";    
    $sql  .=" LEFT JOIN measure l ON l.id = p.id_measure";    
    $sql  .=" LEFT JOIN typy t ON t.id = p.tipo";    
    $sql  .=" LEFT JOIN media m ON m.id = p.media_id";
    $sql  .=" WHERE p.categorie_id = '$categorie' ORDER BY p.id ASC";
    $result = find_by_sql($sql);
    return json_encode($result);
   }

    /*--------------------------------------------------------------*/
   /* Function for Finding all product name
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_product_table(){
     global $db;
     $sql  =" SELECT p.id,p.name,p.codigo,p.marca,p.modelo,p.date,p.parte,p.serie,p.color,p.tipo,c.ShortName";
    $sql  .=" AS categorie, m.file_name AS image, u.ShortName AS medida, t.NameType AS tipo, n.name AS nombre, l.NameMedida AS NombreMedida";
    $sql  .=" FROM products p";
    $sql  .=" LEFT JOIN categories c ON c.id = p.categorie_id";
    $sql  .=" LEFT JOIN categories n ON n.id = p.categorie_id";
    $sql  .=" LEFT JOIN measure u ON u.id = p.id_measure";    
    $sql  .=" LEFT JOIN measure l ON l.id = p.id_measure";    
    $sql  .=" LEFT JOIN typy t ON t.id = p.tipo";    
    $sql  .=" LEFT JOIN media m ON m.id = p.media_id";
    $sql  .=" ORDER BY p.id ASC";
    return find_by_sql($sql);

   }

   /*--------------------------------------------------------------*/
   /* Function for Finding all product price
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_price_table(){
     global $db;
     $sql  =" SELECT p.id,p.price,p.date_price,n.name";
    $sql  .=" AS product, s.simbolo AS money, c.codigo AS codigo, m.RazonSocial AS provider";
    $sql  .=" FROM price p ";
    $sql  .=" LEFT JOIN products n ON n.id = p.producto_id";
    $sql  .=" LEFT JOIN products c ON c.id = p.producto_id";
    $sql  .=" LEFT JOIN money s ON s.id = p.money";
    $sql  .=" LEFT JOIN tipo_cambio f ON f.id = p.tipo_cambio";    
    $sql  .=" LEFT JOIN provider m ON m.id = p.Provider";
    $sql  .=" ORDER BY p.id ASC";
    return find_by_sql($sql);

   }
   /*--------------------------------------------------------------*/
   /* Function for Finding all product price by id
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_price_table_by_id($price_id){
     global $db;
     $sql  =" SELECT p.id,p.price,p.date_price,p.producto_id,p.money,p.Provider,n.name";
    $sql  .=" AS product, s.simbolo AS simbolo, c.codigo AS codigo, o.moneda AS moneda, m.Ruc AS provider";
    $sql  .=" FROM price p ";
    $sql  .=" LEFT JOIN products n ON n.id = p.producto_id";
    $sql  .=" LEFT JOIN products c ON c.id = p.producto_id";
    $sql  .=" LEFT JOIN money s ON s.id = p.money";
    $sql  .=" LEFT JOIN money o ON o.id = p.money";
    $sql  .=" LEFT JOIN tipo_cambio f ON f.id = p.tipo_cambio";    
    $sql  .=" LEFT JOIN provider m ON m.id = p.Provider";
    $sql  .=" WHERE p.id = $price_id";
    return find_by_sql($sql);

   }
   /*--------------------------------------------------------------*/
   /* Function for Finding all stock by categorie
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/
  function join_stock_table_by_categorie($categorie){
     global $db;
     $sql  =" SELECT s.id,s.cantidad,p.codigo, n.name, c.categorie_id";
    $sql  .=" FROM stock s";
    $sql  .=" LEFT JOIN products p ON p.id = s.product";
    $sql  .=" LEFT JOIN products n ON n.id = s.product";
    $sql  .=" LEFT JOIN products c ON c.id = s.product";
    return find_by_sql($sql);

   }

   /*--------------------------------------------------------------*/
   /* Function for Finding all product price staus
   /* JOIN with categorie  and media database table
   /*--------------------------------------------------------------*/   
  function join_price_status_table($idprice){
     global $db;
     $sql  =" SELECT p.id,p.price,p.date_price,p.status,n.name";
    $sql  .=" AS product, s.simbolo AS money, c.codigo AS codigo, m.Ruc AS provider";
    $sql  .=" FROM price p ";
    $sql  .=" LEFT JOIN products n ON n.id = p.producto_id";
    $sql  .=" LEFT JOIN products c ON c.id = p.producto_id";
    $sql  .=" LEFT JOIN money s ON s.id = p.money";
    $sql  .=" LEFT JOIN tipo_cambio f ON f.id = p.tipo_cambio";    
    $sql  .=" LEFT JOIN provider m ON m.id = p.Provider";
    $sql  .=" WHERE p.status = $idprice ORDER BY p.id ASC";
    return find_by_sql($sql);

   }
  /*--------------------------------------------------------------*/
  /* Function for Finding all product name
  /* Request coming from ajax.php for auto suggest
  /*--------------------------------------------------------------*/

   function find_product_by_title($product_name){
     global $db;
     $p_name = remove_junk($db->escape($product_name));
     $sql = "SELECT * FROM products WHERE name like '%$p_name%' LIMIT 5";
     $result = find_by_sql($sql);
     return json_encode($result);
   }
  /*--------------------------------------------------------------*/
  /* Function for Finding all ceco by id
  /* 
  /*--------------------------------------------------------------*/

   function find_ceco_by_id($ceco_id){
     global $db;
     $ceco = remove_junk($db->escape($ceco_id));
     $sql = "SELECT * FROM ceco WHERE id = $ceco";
     $result = find_by_sql($sql);
     return json_encode($result);
   }
  /*--------------------------------------------------------------*/
  /* Function for Finding all product codigo
  /* Request coming from ajax.php for auto suggest
  /*--------------------------------------------------------------*/
   function find_product_by_codigo($producto_codigo){
     global $db;
     $p_codigo = remove_junk($db->escape($producto_codigo));
     $sql = "SELECT * FROM products WHERE codigo like '%$p_codigo%' LIMIT 1";
     $result = find_by_sql($sql);
     return json_encode($result);
   }

  /*--------------------------------------------------------------*/
  /* Function for Finding all product categorie
  /* Request coming from ajax.php for auto suggest
  /*--------------------------------------------------------------*/

   function find_product_by_categorie($producto_categoria){
     global $db;
     $p_categoria = remove_junk($db->escape($producto_categoria));
     $sql = "SELECT * FROM products WHERE categorie_id like '%$p_categoria%'";
     $result = find_by_sql($sql);
     return json_encode($result);
   }
   
  /*--------------------------------------------------------------*/
  /* Funcion que busca producto por id en la tabla price
  /* 
  /*--------------------------------------------------------------*/
   function find_product_by_id_in_price($product_id){
     global $db;
     $codigo = remove_junk($db->escape($product_id));
     $sql = "SELECT * FROM price WHERE producto_id like '%$p_id%' LIMIT 1";
     $result = find_by_sql($sql);
     return $result;
   }
  /*--------------------------------------------------------------*/
  /* Funcion que busca producto por id en la tabla price
  /* 
  /*--------------------------------------------------------------*/
   function find_requirements_by_number($number_requirements){
     global $db;
     $number = remove_junk($db->escape($number_requirements));
     $sql = "SELECT id FROM requirements WHERE NumberRq = '$number'";
     $result = find_by_sql($sql);
     return $result;
   }
   
  /*--------------------------------------------------------------*/
  /* Buscar precio por id
  /* Request coming from ajax.php for auto suggest
  /*--------------------------------------------------------------*/
  function find_price_by_id($price_id){
     global $db;
     $price = remove_junk($db->escape($price_id));
     $sql = "SELECT * FROM price WHERE id = $price ";
     $result = find_by_sql($sql);
     return $result;
   }
 

  /*--------------------------------------------------------------*/
  /* Function for Finding all product info by product title
  /* Request coming from ajax.php
  /*--------------------------------------------------------------*/
  function find_all_product_info_by_title($title){
    global $db;
    $sql  = "SELECT * FROM products ";
    $sql .= " WHERE name ='{$title}'";
    $sql .=" LIMIT 1";
    return find_by_sql($sql);
  }

  /*--------------------------------------------------------------*/
  /* Function for Update product quantity
  /*--------------------------------------------------------------*/
  function update_product_qty($qty,$p_id){
    global $db;
    $qty = (int) $qty;
    $id  = (int)$p_id;
    $sql = "UPDATE products SET quantity=quantity -'{$qty}' WHERE id = '{$id}'";
    $result = $db->query($sql);
    return($db->affected_rows() === 1 ? true : false);

  }
  /*--------------------------------------------------------------*/
  /* Function for Update price status by codigo of product
  /*--------------------------------------------------------------*/
  function update_status_price_product($codigo){
    global $db;
    $codigo  = (int)$codigo;
    $sql = "UPDATE price SET status=0 WHERE producto_id = '{$codigo}'";
    $result = $db->query($sql);
    return ($db->affected_rows() === 1 ? true : false);

  }
  /*--------------------------------------------------------------*/
  /* Function for Update price status by id price
  /*--------------------------------------------------------------*/
  function update_status_price_id($id_price){
    global $db;
    $id_price  = (int)$id_price;
    $sql = "UPDATE price SET status=0 WHERE id = '{$id_price}'";
    $result = $db->query($sql);
    return ($db->affected_rows() === 1 ? true : false);

  }
  /*--------------------------------------------------------------*/
  /* Function for Update CECO status by id ceco
  /*--------------------------------------------------------------*/
  function update_status_ceco_id($id_ceco){
    global $db;
    $id_ceco  = (int)$id_ceco;
    $sql = "UPDATE ceco SET status=0 WHERE id = '{$id_ceco}'";
    $result = $db->query($sql);
    return $result;// ($db->affected_rows() === 1 ? true : false);

  }
  
  /*--------------------------------------------------------------*/
  /* Function for Display Recent product Added
  /*--------------------------------------------------------------*/
 function find_recent_product_added($limit){
   global $db;
   $sql   = " SELECT p.id,p.name,p.sale_price,p.media_id,c.name AS categorie,";
   $sql  .= "m.file_name AS image FROM products p";
   $sql  .= " LEFT JOIN categories c ON c.id = p.categorie_id";
   $sql  .= " LEFT JOIN media m ON m.id = p.media_id";
   $sql  .= " ORDER BY p.id DESC LIMIT ".$db->escape((int)$limit);
   return find_by_sql($sql);
 }
 /*--------------------------------------------------------------*/
 /* Function for Find Highest saleing Product
 /*--------------------------------------------------------------*/
 function find_higest_saleing_product($limit){
   global $db;
   $sql  = "SELECT p.name, COUNT(s.product_id) AS totalSold, SUM(s.qty) AS totalQty";
   $sql .= " FROM sales s";
   $sql .= " LEFT JOIN products p ON p.id = s.product_id ";
   $sql .= " GROUP BY s.product_id";
   $sql .= " ORDER BY SUM(s.qty) DESC LIMIT ".$db->escape((int)$limit);
   return $db->query($sql);
 }
 /*--------------------------------------------------------------*/
 /* Function for find all sales
 /*--------------------------------------------------------------*/
 function find_all_sale(){
   global $db;
   $sql  = "SELECT s.id,s.qty,s.price,s.date,p.name";
   $sql .= " FROM sales s";
   $sql .= " LEFT JOIN products p ON s.product_id = p.id";
   $sql .= " ORDER BY s.date DESC";
   return find_by_sql($sql);
 }
 /*--------------------------------------------------------------*/
 /* Function for Display Recent sale
 /*--------------------------------------------------------------*/
function find_recent_sale_added($limit){
  global $db;
  $sql  = "SELECT s.id,s.qty,s.price,s.date,p.name";
  $sql .= " FROM sales s";
  $sql .= " LEFT JOIN products p ON s.product_id = p.id";
  $sql .= " ORDER BY s.date DESC LIMIT ".$db->escape((int)$limit);
  return find_by_sql($sql);
}
/*--------------------------------------------------------------*/
/* Function for Generate sales report by two dates
/*--------------------------------------------------------------*/
function find_sale_by_dates($start_date,$end_date){
  global $db;
  $start_date  = date("Y-m-d", strtotime($start_date));
  $end_date    = date("Y-m-d", strtotime($end_date));
  $sql  = "SELECT s.date, p.name,p.sale_price,p.buy_price,";
  $sql .= "COUNT(s.product_id) AS total_records,";
  $sql .= "SUM(s.qty) AS total_sales,";
  $sql .= "SUM(p.sale_price * s.qty) AS total_saleing_price,";
  $sql .= "SUM(p.buy_price * s.qty) AS total_buying_price ";
  $sql .= "FROM sales s ";
  $sql .= "LEFT JOIN products p ON s.product_id = p.id";
  $sql .= " WHERE s.date BETWEEN '{$start_date}' AND '{$end_date}'";
  $sql .= " GROUP BY DATE(s.date),p.name";
  $sql .= " ORDER BY DATE(s.date) DESC";
  return $db->query($sql);
}
/*--------------------------------------------------------------*/
/* Function for Generate Daily sales report
/*--------------------------------------------------------------*/
function  dailySales($year,$month){
  global $db;
  $sql  = "SELECT s.qty,";
  $sql .= " DATE_FORMAT(s.date, '%Y-%m-%e') AS date,p.name,";
  $sql .= "SUM(p.sale_price * s.qty) AS total_saleing_price";
  $sql .= " FROM sales s";
  $sql .= " LEFT JOIN products p ON s.product_id = p.id";
  $sql .= " WHERE DATE_FORMAT(s.date, '%Y-%m' ) = '{$year}-{$month}'";
  $sql .= " GROUP BY DATE_FORMAT( s.date,  '%e' ),s.product_id";
  return find_by_sql($sql);
}
/*--------------------------------------------------------------*/
/* Function for Generate Monthly sales report
/*--------------------------------------------------------------*/
function  monthlySales($year){
  global $db;
  $sql  = "SELECT s.qty,";
  $sql .= " DATE_FORMAT(s.date, '%Y-%m-%e') AS date,p.name,";
  $sql .= "SUM(p.sale_price * s.qty) AS total_saleing_price";
  $sql .= " FROM sales s";
  $sql .= " LEFT JOIN products p ON s.product_id = p.id";
  $sql .= " WHERE DATE_FORMAT(s.date, '%Y' ) = '{$year}'";
  $sql .= " GROUP BY DATE_FORMAT( s.date,  '%c' ),s.product_id";
  $sql .= " ORDER BY date_format(s.date, '%c' ) ASC";
  return find_by_sql($sql);
}

?>
