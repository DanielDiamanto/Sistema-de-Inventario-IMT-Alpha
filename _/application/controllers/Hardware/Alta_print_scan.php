<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_print_scan extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');// Aqui cargo las librerias para que funcionen correctamente los objetos instanciados 
$this->load->library('form_validation');
}
 
public function index()
{
$this->hard_print_reg_crud();
}

public function hard_print_reg_crud()
{
	$crud = new grocery_CRUD();// Aqui se crea el objeto
	//$crud->set_theme('imt');
	$crud->where('hardware.id_printer_scaner IS NOT', NULL );
	$crud->set_subject('Registro de Impresora, Escáner o Multifuncional');
	$crud->set_table('hardware');// Aqui se referencia la tabla de la base de datos que alimentara al objeto
	$crud->set_crud_url_path(site_url('index.php/Hardware/Alta_print_scan/index'));
	
	//Relaciones
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	$crud->set_relation('id_prov','proveedor','nombre_empresa');
	$crud->set_relation('id_mod','hardware_modalidad','nombre_mod');
	$crud->set_relation('id_printer_scaner','hardware_printer_scaner','tipo_printer_scaner');
	$crud->set_relation('id_usuario_b','usuarios_b','{nombres} {ape_paterno} {ape_materno}');

	$crud->unset_columns('id_tipo_pc', 'id_redes', 'id_otros', 'ram', 'disco_duro');
	$crud->unset_fields('id_tipo_pc', 'id_redes', 'id_otros', 'ram', 'disco_duro');
	

	$crud->display_as('id_coordinacion','Coordinacion');
	$crud->display_as('id_prov','Proveedor');
	$crud->display_as('id_mod','Modalidad de propiedad');
	$crud->display_as('id_printer_scaner','Tipo de Equipo ');
	$crud->display_as('id_usuario_b','Usuario Asignado');
	
	
	

$output = $crud->render();// Aqui se hace uso de el metodo render para crear la vista a partir del modelo (application/models/Grocery_crud_model.php) y se mete el resultado del redenderizado a la variable $output

$this->salida_Output($output);// Aqui se hace uso de la funcion salida_Output para enviar el objeto a la vista con la misma mecanica tradicional de code igniter de enviar objetos y vaiables a las vistas
// ------------------Aqui termina el proceso de creacion de la vista a partir del modelo----------------------------


}


function salida_Output($output = null)
{
//$this->load->view('general/header.php');   	//en esta linea se carga la seccion del header para todas las vistas que sean generadas usando esta función 
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output); //Aquí se carga la vista de la carpeta views y se envia adicionalmente la variable que contiene el redenderizado del objeto $crud para meterlo en la vista
//$this->load->view('general/footer.php');  //Aqui cargo el pie de pagina    
}

}
