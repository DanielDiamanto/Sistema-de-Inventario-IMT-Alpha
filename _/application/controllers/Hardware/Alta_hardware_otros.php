<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_hardware_otros extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
$this->load->library('form_validation');
}
 
public function index()
{
$this->hardware_otros_reg_crud_();
}

public function hardware_otros_reg_crud_()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->where('hardware.id_otros IS NOT', NULL );
	$crud->set_subject('Registro de Hardware (Otro)');
	$crud->set_table('hardware');
	$crud->set_crud_url_path(site_url('index.php/Hardware/Alta_hardware_otros/index'));

	//Relaciones
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	$crud->set_relation('id_prov','proveedor','nombre_empresa');
	$crud->set_relation('id_mod','hardware_modalidad','nombre_mod');
	$crud->set_relation('id_usuario_b','usuarios_b','{nombres} {ape_paterno} {ape_materno}');
	
	$crud->set_relation('id_otros','hardware_otros','nombre_otros');

	$crud->unset_columns('id_printer_scaner', 'id_redes','id_tipo_pc','ram', 'disco_duro');
	$crud->unset_fields('id_printer_scaner', 'id_redes','id_tipo_pc', 'ram', 'disco_duro');

	$crud->display_as('id_coordinacion','Coordinacion');
	$crud->display_as('id_prov','Proveedor');
	$crud->display_as('id_mod','Modalidad de propiedad');
	$crud->display_as('id_tipo_pc','Tipo de Equipo');
	$crud->display_as('id_usuario_b','Usuario Asignado');
	$crud->display_as('id_otros','Dispositivo');

	
	
	
	
	

$output = $crud->render();

$this->salida_Output($output);


}


function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output);  
}

}
