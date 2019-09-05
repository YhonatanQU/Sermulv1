<?php 

//conexion a ala base de datos

require '../config/Conexion.php';

/**
 * 
 */
class Categoria
{
	//constructor	
	public function __construct()
	{
		# code...
	}

	//insertar registros
	public function insertar($nombre,$decripcion){
		$sql="INSERT INTO categoria (nombre, descripcion, condicion) VALUES ('$nombre','$descripcion','1')" ;

		return ejecutarConsulta($sql);
	}
	//editar categoria
	public function editar($idcategoria,$nombre,$descripcion){
		$sql="UPDATE categoria SET nombre='$nombre', descripcion= '$descripcion' WHERE idcategoria='$idcategoria' ";
		return ejecutarConsulta();
	}
	//actualizar categoria
	public function activar($idcategoria){
		$sql="UPDATE categoria SET condicion ='1' WHERE idcategoria= '$idcategoria' ";
		return ejecutarConsulta($sql);
	}
	//desactivar categoria
	public function desactivar(){
		$sql="UPDATE categoria SET condicion ='0' WHERE idcategoria= '$idcategoria' ";
		return ejecutarConsulta($sql);
	}
	//mostrar datos de categoria seleccionado
	public function mostrar($idcategoria){
		$sql="SELECT * FROM categoria WHERE idcategoria ='$idcategoria' ";
		return ejecutarConsultaSimpleFila($sql);
	}
	//listar categoria
	public function listar($idcategoria){
		$sql="SELECT * FROM categoria";
		return ejecutarConsulta($sql);
	}

}

?>