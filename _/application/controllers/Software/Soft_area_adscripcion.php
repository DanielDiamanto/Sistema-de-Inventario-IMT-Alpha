<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class soft_area_adscripcion extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
}
 
public function index()
{
$this->adscripcion_crud();
}

public function adscripcion_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Area de Adscripcion');
	$crud->set_table('area_adscripcion');
	//$crud->display_as('nombre_empresa','Empresa');
	
	

$output = $crud->render();

$this->salida_Output($output);


}

function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output);    
}

}
