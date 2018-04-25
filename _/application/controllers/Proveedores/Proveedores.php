<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Proveedores extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');
$this->load->library('form_validation');
}
 
public function index()
{
	    switch ($this->session->userdata('tipo_u')) {
        case 1://El admin
            $this->proveedores_crud();
            break;
        case 2://El de software
            $this->proveedores_crud();
            break;
        case 3://El de hardware
            $this->proveedores_crud();
            break;
        case 5://El invitado
            $this->proveedores_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function proveedores_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Proveedores');
	$crud->set_table('proveedor');
	$crud->set_crud_url_path(site_url('index.php/Proveedores/proveedores/index'));
	$crud->set_relation('id_tipo_proveedor','proveedor_tipos','nom_tipo_proveedor');
	$crud->set_relation('id_estado','estados_federales','nombre_estado');
	$crud->change_field_type('telefono','integer'); 
	$crud->columns('nombre_contacto', 'nombre_empresa', 'id_tipo_proveedor', 'telefono', 'email', 'direccion', 'id_estado', 'codigo_postal', 'pais'); 
	$crud->fields('nombre_contacto', 'nombre_empresa', 'id_tipo_proveedor', 'telefono', 'email', 'direccion', 'id_estado', 'codigo_postal', 'pais'); 

	$crud->display_as('nombre_contacto', 'Nombre de Contacto');
	$crud->display_as('nombre_empresa', 'Nombre de la Empresa');
	$crud->display_as('id_tipo_proveedor', 'Tipo de Proveedor');
	$crud->display_as('telefono', 'Teléfono');
	$crud->display_as('email', 'Correo Electrónico');
	$crud->display_as('direccion', 'Dirección');
	$crud->display_as('id_estado', 'Estado Federal');
	$crud->display_as('codigo_postal', 'Código Postal');
	$crud->display_as('pais', 'País');

	$crud->required_fields('nombre_empresa', 'id_tipo_proveedor', 'telefono', 'email', 'direccion', 'codigo_postal', 'pais');

	$crud->set_rules('telefono','Teléfono','numeric|required');
	$crud->set_rules('email','Correo Electronico','valid_email');

	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
		$crud->unset_add();
	    $crud->unset_edit();
	    $crud->unset_delete();
	    $crud->unset_export();
	    $crud->unset_print();
	};

	
	

$output = $crud->render();

$this->salida_Output($output);


}


function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/proveedores.php');
$this->load->view('crud_template.php',$output);    
}

}
