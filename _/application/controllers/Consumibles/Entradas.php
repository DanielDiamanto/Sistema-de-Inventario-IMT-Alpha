<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Entradas extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
}
 
public function index()
{
	    switch ($this->session->userdata('tipo_u')) {
        case 1://El admin
            $this->entradas_crud();
            break;
        case 3://El de hardware
            $this->entradas_crud();
            break;
        case 4://El de consumibles 0 kill
            $this->entradas_crud();
            break;
        case 5://El invitado
            $this->entradas_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function entradas_crud()
{

	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Entrada de Consumibles');
	$crud->set_table('consumibles');
	$crud->set_crud_url_path(site_url('index.php/Consumibles/Entradas/index'));

	
	$crud->columns('nombre_consumible',	'marca',	'modelo',	'cantidad',	'codigo_CABM',	'proveedor');
	$crud->fields('nombre_consumible',	'marca',	'modelo',	'cantidad',	'codigo_CABM',	'proveedor');

	$crud->display_as('nombre_consumible','Nombre del Consumible');
	$crud->display_as('marca','Marca');
	$crud->display_as('modelo','Modelo');
	$crud->display_as('cantidad','Cantidad');
	$crud->display_as('codigo_CABM','Código CABM');
	$crud->display_as('descripcion','Descripción');

	$crud->required_fields('nombre_consumible',	'marca',	'modelo',	'cantidad',	'codigo_CABM');
	
	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
	    $crud->unset_operations();
	};
	

	//$crud->set_relation('id_divisa','compras_divisas','nom_divisa');
	//$crud->set_field_upload( 'contrato_corporativo', '/');
	//$crud->set_field_upload( 'documento_anexo', '/');
	

$output = $crud->render();

$this->salida_Output($output);



}

function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/consumibles.php');
$this->load->view('crud_template.php',$output);  
}

}
