<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_hardware_general extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
$this->load->library('form_validation');
}
 
public function index()
{
$this->soft_registro_crud();
}

public function soft_registro_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Registro de Hardware');
	$crud->set_table('hardware');

	//Relaciones
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	$crud->set_relation('id_prov','proveedor','nombre_empresa');
	$crud->set_relation('id_mod','hardware_modalidad','nombre_mod');
	$crud->set_relation('id_printer_scaner','hardware_printer_scaner','tipo_printer_scaner');
	$crud->set_relation('id_redes','hardware_redes','nombre_tipo');
	$crud->set_relation('id_otros','hardware_otros','nombre_otros');
	$crud->set_relation('id_tipo_pc','hardware_tipo_pc','nombre_tipo');
	$crud->set_relation('id_usuario_b','usuarios_b','{nombres} {ape_paterno} {ape_materno}');


	$crud->display_as('id_coordinacion','Coordinacion');
	$crud->display_as('id_prov','Proveedor');
	$crud->display_as('id_mod','Modalidad de propiedad');
	$crud->display_as('id_printer_scaner','Tipo de Dispositivo');
	$crud->display_as('id_redes','Dispositivo de Red');
	$crud->display_as('id_otros','Dispositivo');
	$crud->display_as('id_tipo_pc','Tipo de Equipo');
	$crud->display_as('id_usuario_b','Usuario Asignado');

	
	
	
	

$output = $crud->render();

$this->salida_Output($output);
}


function salida_Output($output = null)
{
//$this->load->view('general/header.php');   	//en esta linea se carga la seccion del header para todas las vistas que sean generadas usando esta función 
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output);   
}

}
