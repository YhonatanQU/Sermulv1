
function suggetion() {

     $("#sug_input").keyup(function(e) {

         var formData = {
             "product_name" : $('input[name=title]').val()
         };
         if(formData['product_name'].length >= 1){

           // process the form
           $.ajax({
               type        : 'POST',
               url         : 'ajax.php',
               data        : formData,
               dataType    : 'json',
               encode      : true
           })
               .done(function(data) {
                   //console.log(data);
                   $('#result').html(data).fadeIn();
                   $('#result li').click(function() {

                     $('#sug_input').val($(this).text());
                     $('#result').fadeOut(500);

                   });

                   $("#sug_input").blur(function(){
                     $("#result").fadeOut(500);
                   });

               });

         } else {

           $("#result").hide();

         };

         e.preventDefault();
     });

 }


$('#sug-form').submit(function(e) {
      var formData = $(this).serialize();
      // {
      //     'p_name' : $('input[name=title]').val()
      // };
        // process the form
        $.ajax({
            type        : 'POST',
            url         : 'ajax.php',
            data        : formData
        })
            .done(function(data) {
                //console.log(data);
                $('#product_info').html(data).show();
                total();
                $('.datePicker').datepicker('update', new Date());

            }).fail(function() {
                $('#product_info').html(data).show();
            });
      e.preventDefault();
});

function total(){
    $('#product_info input').change(function(e)  {
            var price = +$('input[name=price]').val() || 0;
            var qty   = +$('input[name=quantity]').val() || 0;
            var total = qty * price ;
            $('input[name=total]').val(total.toFixed(2));
    });
}

function registrarPrecio(){

  $('#prices').on("submit", function(e){
    e.preventDefault();
    var frm =$(this).serialize();
    $.ajax({
      url:"prices.php",
      method:"POST",
      data:frm
    }).done(function(info){
      $('#respuesta').html(info);
      $('#respuesta').css("display","none");
      listarPrice();
      $('#prices').trigger('reset');

      });
  });

}

function priceUpdate(){

  $('.update-price').click(function (e){
    e.preventDefault();
    var element=$(this)[0].parentElement.parentElement.parentElement;
    var id=$(element).attr('price-id');
    $.ajax({
      url:"prices.php",
      method:"POST",
      data:{ idprice: id},
      success:function(response) {
        priceForm(response);
        check();
        //$('#prices').trigger('reset');     
        
      }
    });
  });  
}

function priceForm(idPrice){
  var id=idPrice;
  var option="priceForm";

  $.ajax({
    url: "all_data.php",
    method:"POST",
    data:{option: option, id: id},
    success: function (response) {
      UpdatePriceForm();
      var mostrar=JSON.parse(response);
      mostrar.forEach(price=>{
        products ="<option value='" + price.producto_id + "' selected>"+price.codigo + "-" + price.descripcion + "</option>";
        moneys ="<option value='" + price.moneda_id + "' selected>"+price.moneda_simbolo + "-" + price.moneda + "</option>";
        providers ="<option value='" + price.proveedor_id + "' selected>"+price.proveedor + "</option>";
        prices=price.precio;
        fechas=price.fecha;

      });
      $('#product').html(products);
      $('#money').html(moneys);
      $('#provider').html(providers);
      $('#price').val(prices);
      $('#date').val(fechas);
    }
  });
}

function UpdatePriceForm() {
   $('#table-prices').fadeOut(500,function(){
      $('#formNewPrice').fadeIn();     
    });
    
}

function check() {
  $('#money-check').css("display","inline");
  $('#provider-check').css("display","inline");
}

function newPrice() {
    $('#prices').trigger('reset');
    UpdatePriceForm();
    obtenerProductos();
    obtenerMoneda();
    obtenerProveedor();
}

function deletePrice() {
  $('.delete-price').click(function (e){

    var element=$(this)[0].parentElement.parentElement.parentElement;
    var id=$(element).attr('price-id');
    $.ajax({
      url:"prices.php",
      method:"POST",
      data:{ idprice: id, delete: 1},
      success:function(response) {
        obtenerPrecios();
        $('#prices').trigger('reset');     
      }
    });
    e.preventDefault();
  });  
}

function listarPrice() {
    $('#formNewPrice').fadeOut(500,function () {
      $('#table-prices').fadeIn();
       
        obtenerPrecios(); 
    });
}

function obtenerProductos(){
  var products="products";
  $.ajax({
    url:"all_data.php",
    method:"POST",
    data:{option: products},
    success: function(response) {
      // body...
      var mostrar= JSON.parse(response);
      var plantilla='<option value="">Seleccione articulo</option>';
      mostrar.forEach(product => {
      plantilla += `
          <option value="${product.id}">
          ${product.codigo} - ${product.descripcion}
          </option>
        `
      });
      $('#product').html(plantilla);
      
    }
  });
}

function obtenerMoneda() {
  var moneda="money";
  $.ajax({
    url:"all_data.php",
    method:"POST",
    data:{option: moneda},
    success: function(response) {
      var mostrar = JSON.parse(response);
      var plantilla='<option value="">Moneda</option>';
      mostrar.forEach(money => {
      plantilla +=`
          <option value="${money.id}">
          ${money.nombre} - ${money.simbolo}
          </option>

        `
      });
      $('#money').html(plantilla);
    }
  });
}

function obtenerProveedor() {
  var proveedor="provider";
  $.ajax({
    url:"all_data.php",
    method:"POST",
    data:{option: proveedor},
    success:function(response) {
      var mostrar =JSON.parse(response);
      var plantilla = '<option value="">Seleccionar proveedor del articulo</option>'
      mostrar.forEach(provider => {
        plantilla +=`
          <option value="${provider.id}">
            ${provider.RazonSocial}
          </option>
        `
      });
      $('#provider').html(plantilla);
    }

  });
}

function obtenerPrecios() {
  var precio = "price";
  var status = 1;
  $.ajax({
    url:"all_data.php",
    method:"POST",
    data:{option: precio, status: status},
    success: function (response) {
      var mostrar =JSON.parse(response);
      var plantilla='';
      mostrar.forEach(price=>{
        plantilla+=`
          <tr codigo-producto="${price.codigo}" price-id="${price.id}">
            <td class="text-center"  ><a class="codigo-producto" >${price.codigo}</a></td>
            <td class="text-left">${price.producto}</td>
            <td class="text-center">${price.simbolo} ${price.precio}</td>
            <td class="text-center">${price.fecha}</td>
            <td class="text-center"><a>${price.proveedor}</a></td>
            <td class="text-center" >
                <div class="btn-group">
                  <a id="update-price" class="update-price btn btn-xs btn-warning " title="Nuevo precio">
                    <span class="glyphicon glyphicon-edit"></span>
                  </a>
                  <a id="delete-price" class="delete-price btn btn-xs btn-danger" title="Eliminar">
                    <span class="glyphicon glyphicon-trash"></span>
                  </a>
                </div>
            </td>
          </tr>
        `
      });
      $('#data-price').html(plantilla);
      //obtener codigo de producto
      productoCodigo();
      //Update prices
      priceUpdate();
      //delete prices
      deletePrice();

      
    }
  });
}
//muestra modal detalle producto
function productoCodigo(){
      $('.codigo-producto').click(function () {
        var option ="codigo";
        var element=$(this)[0].parentElement.parentElement;
        var codigo=$(element).attr('codigo-producto');
  
        $.ajax({
          url:"all_data.php",
          method:"POST",
          data:{option: option, codigo: codigo},
          success:function (response) {
            var plantilla='';
            var mostrar=JSON.parse(response);
            mostrar.forEach(product =>{
              plantilla+=`
              <tr>
                <td colspan="2" class="text-center"> <img src="uploads/products/${product.image}" alt="" width="200px" ></td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Descripcion</strong> </td>
                <td>${product.name}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Codigo</strong> </td>
                <td>${product.codigo}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Marca</strong> </td>
                <td>${product.marca}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Modelo</strong> </td>
                <td>${product.modelo}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Unidad de medida</strong> </td>
                <td>${product.NombreMedida}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Fecha de registro</strong> </td>
                <td>${product.date}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Numero de parte</strong> </td>
                <td>${product.parte}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Numero de serie</strong> </td>
                <td>${product.serie}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Color</strong> </td>
                <td>${product.color}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Tipo de articulo</strong> </td>
                <td>${product.tipo}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Categoria</strong> </td>
                <td>${product.nombre}</td>
              </tr>
              `
            });
            $('#data-product').html(plantilla);
          }
        });
        $('.modal').modal('show');
      });
}

//centro de costos

function mostrar_form_ceco(){
  $('#ceco-add').css("display","none");
  $('.ceco-form').fadeIn();
  $('.ceco-table').fadeOut();
  $('#ceco-list').fadeIn(1500);
  $('#msg-popup').fadeOut(3000);
}

function mostrar_table_ceco(){
  $('#ceco-list').css("display","none");
  $('.ceco-table').fadeIn();
  $('.ceco-form').fadeOut();
  $('#ceco-add').fadeIn(1500);
  $('#msg-popup').fadeIn();
  listarCeco(); 
}

function listarCeco() {
  var option = "listar";
  var ceco = "ceco";
  var status=1;
  $.ajax({
    url:"all_ceco.php",
    method:"POST",
    data:{option: option, ceco: ceco, status: status},
    success:function (response) {
      var data_ceco = JSON.parse(response);
      var planilla = '';

      data_ceco.forEach(data => {

        planilla +=`
          <tr ceco-id="${data.id}">
            <td class="text-center">${data.codigo}</td>
            <td class="text-left">${data.ShortName}</td>
            <td class="text-center">${data.DateRegistro}</td>
            <td class="text-left">${data.Region}</td>
            <td class="text-left">${data.Distrito}</td>
            <td class="text-center">${data.rubro}</td>
            <td class="text-center">${data.status}</td>
            <td class="text-center">
                <div class="btn-group">
                  <a id="update-ceco" class="update-ceco btn btn-xs btn-warning " title="Actualizar ceco">
                    <span class="glyphicon glyphicon-edit"></span>
                  </a>
                  <a id="more-ceco" class="more-ceco btn btn-xs btn-info " title="Detalle ceco">
                    <span class="glyphicon glyphicon-plus"></span>
                  </a>
                  <a id="delete-ceco" class="delete-ceco  btn btn-xs btn-danger" title="Eliminar ceco">
                    <span class=" glyphicon glyphicon-trash"></span>
                  </a>
                </div>
            </td>
          </tr>
        `;
      });
      $('#data-ceco').html(planilla);
      eliminarCeco();
      actualizarCeco();
      detalleCeco();

    }
  });
}

function registrarCeco() {
  $('#form-ceco').on('submit', function(e) {
    e.preventDefault();
    var id=$('#cecoId').val();

    ceco_codigo=$('#ceco-codigo').val();
    var form_ceco=$(this).serialize();
    
    $.ajax({
      url:"cecos.php",
      method:"POST",
      data:form_ceco,
      success: function(response) {
        alert(response);
        mostrar_table_ceco();
        listarCeco();
      }
    });
  })
}

function eliminarCeco() {
 $('.delete-ceco').click(function (e) {
  e.preventDefault();
  var element = $(this)[0].parentElement.parentElement.parentElement;
  var id_ceco = $(element).attr('ceco-id');
  var option = "eliminar";

  $.ajax({
    url:"all_ceco.php",
    method:"POST",
    data:{option: option, ceco: id_ceco},
    success:function(response) {
      alert(response);
      listarCeco();
    }
  });

   
 });
}

function actualizarCeco(){
  $('.update-ceco').click(function(e){
    e.preventDefault();
    var element = $(this)[0].parentElement.parentElement.parentElement;
    var id_ceco = $(element).attr('ceco-id');
    var option = "actualizar";

    $.ajax({
      url:"all_ceco.php",
      method:"POST",
      data:{option: option, cecoId: id_ceco},
      success: function (response) {
         mostrar_form_ceco();
         var data_ceco = JSON.parse(response);
          data_ceco.forEach(data => {
          id = data.id
          codigo = data.codigo;
          descripcion = data.Description;
          nombre = data.ShortName;
          registro = '<input class="datepicker form-control" name="ceco-registro"  value="'+ data.DateRegistro +'" placeholder="'+ data.DateRegistro +'" required="required">';
          inicio = '<input class="datepicker form-control" name="ceco-inicio"  value="'+ data.DateInicio +'" placeholder="'+ data.DateInicio +'" required="required">';
          fin = '<input class="datepicker form-control" name="ceco-fin"  value="'+ data.DateFin +'" placeholder="'+ data.DateFin +'" required="required">';
          contrato = data.Contrato;
          region = data.Region;
          distrito = data.Distrito;
          referencia = data.reference;
          rubro = data.rubro;

         });
         $('#ceco-id').val(id);
         $('#ceco-codigo').val(codigo);
         $('#ceco-descripcion').val(descripcion);
         $('#ceco-nombre').val(nombre);
         $('#ceco-registro').html(registro);
         $('#ceco-inicio').html(inicio);
         $('#ceco-fin').html(fin);
         $('#ceco-contrato').val(contrato);
         $('#ceco-region').val(region);
         $('#ceco-distrito').val(distrito);
         $('#ceco-referencia').val(referencia);
         $("#ceco-rubro > option[value='"+ rubro +"']").attr("selected",true);

         listarCeco();
      }
    });
  });
}
function detalleCeco() {
   $('.more-ceco').click(function () {
        var option ="actualizar";
        var element=$(this)[0].parentElement.parentElement.parentElement;
        var cecoId=$(element).attr('ceco-id');
  
        $.ajax({
          url:"all_ceco.php",
          method:"POST",
          data:{option: option, cecoId: cecoId},
          success:function (response) {
            console.log(response);
            var plantilla='';
            var mostrar=JSON.parse(response);
            mostrar.forEach(ceco =>{
              plantilla+=`
              <tr>
                <td class="text-right"> <strong>Codigo</strong> </td>
                <td>${ceco.codigo}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Description</strong> </td>
                <td>${ceco.Description}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Nombre</strong> </td>
                <td>${ceco.ShortName}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Fecha DE registro</strong> </td>
                <td>${ceco.DateRegistro}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Fecha de inicio</strong> </td>
                <td>${ceco.DateInicio}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Fecha de fin</strong> </td>
                <td>${ceco.DateFin}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Contrato</strong> </td>
                <td>${ceco.Contrato}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Region</strong> </td>
                <td>${ceco.Region}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Distrito</strong> </td>
                <td>${ceco.Distrito}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Referencia</strong> </td>
                <td>${ceco.reference}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Rubro</strong> </td>
                <td>${ceco.rubro}</td>
              </tr>
              <tr>
                <td class="text-right"> <strong>Estado</strong> </td>
                <td>${ceco.status}</td>
              </tr>
              
              `
            });
            $('#data-ceco-detalle').html(plantilla);
          }
        });
        $('.modal').modal('show');
      });
}

//fin centro de costos

//requerimiento
  //ocultamos formulario cabecera
    function ocultarformularioCabecera() {
      $('#cabecera-requerimiento').fadeOut();
      $('#detalle-requerimiento').fadeIn();
    }
  //fin oculatar formulario cabecera

  function cabeceraRequerimiento (argument) {
    $('#form-requerimiento').on('submit', function(e) {
      e.preventDefault();
      $('#rq-ceco')
      var form_requerimiento = $(this).serialize();
      //console.log(form_requerimiento);
      $.ajax({
        url:"requerimientos.php",
        method:"POST",
        data:form_requerimiento,
        success:function (response) {
          ocultarformularioCabecera();
          detalleRequerimiento(response);
        }
      });
    });
  }

  function detalleRequerimiento(requerimiento) {
    plantilla = "<div>" + requerimiento + "</div>";
    $('#resultado').html(plantilla);
  }

  //Lista de articulos

    function listaArticulo(requerimiento, categoria) {
      var requerimiento =requerimiento;
      var categoria = categoria;
      var option = option;
      $.ajax({
        url:"all_requerimiento.php",
        method:"POST",
        data:{option: option, requerimiento: requerimiento, categoria: categoria},
        success:function (response) {
          alert(response);
        }
      });
    }

  //Fin lista de articulos 

// fin de reuquerimiento


  $(document).ready(function() {

    //tooltip
    $('[data-toggle="tooltip"]').tooltip();

    $('.submenu-toggle').click(function () {
       $(this).parent().children('ul.submenu').toggle(200);
    });
    //suggetion for finding product names
    suggetion();
    // Callculate total ammont
    total();
    //registrar precio a la base de datos
    registrarPrecio();
    //mostrar formulario de ingreso de precio y ocultar tabla de precios
    //newPrice();
    //mostrar tabla de precios y ocultar formulario de registro de precios
    //listarPrice();

    //elimina precio
     // deletePrice();
    //listar precios

    obtenerPrecios();
    $('#listar-price').click(function () {
      listarPrice();
    });
    //Updown select money
    $('#money-check').click(function(){
       obtenerMoneda();
       $('#money-check, .money-check').css("display","none");
 
    });
    //Updown select provider
    $('#provider-check').click(function(){
       obtenerProveedor();
        $('#provider-check, .provider-check').css("display","none");
    });
    //Nuevo precio
    $('#newPrice').click(function () {
       newPrice();
    });
    //ceco

    $('#ceco-add').click(function() {
      mostrar_form_ceco();
    });
    $('#ceco-list').click(function() {
      mostrar_table_ceco();
    });



      //registrar ceco
        registrarCeco();
      //listar ceco
        listarCeco();
      //eliminar ceco
      

    //fin ceco

  //requerimiento

  cabeceraRequerimiento();

  //fin requerimiento

    $('#').cl
    //idioma spanish de datatables
    $('#table-id').DataTable( {
        language: {
                    "sProcessing":     "Procesando...",
                    "sLengthMenu":     "Mostrar _MENU_ registros",
                    "sZeroRecords":    "No se encontraron resultados",
                    "sEmptyTable":     "Ningún dato disponible en esta tabla",
                    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix":    "",
                    "sSearch":         "Buscar:",
                    "sUrl":            "",
                    "sInfoThousands":  ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst":    "Primero",
                        "sLast":     "Último",
                        "sNext":     "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
     } );

    $('.datepicker')
        .datepicker({
            format: 'yyyy-mm-dd',
            todayHighlight: true,
            autoclose: true
    });  
  });
