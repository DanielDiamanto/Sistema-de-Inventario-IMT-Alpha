<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class soft_provedores extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
}
 
public function index()
{
$this->provedores_crud();
}

public function provedores_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Proveedores de Software');
	$crud->set_table('proveedor_soft');
	

	$crud->display_as('nombre_empresa','Empresa');
	$crud->display_as('nombre_contacto','Contacto');
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
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output);  
}

}
