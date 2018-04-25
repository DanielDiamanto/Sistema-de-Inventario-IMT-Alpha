<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_hardware_general2 extends CI_Controller {
 
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
        case 1:
            $this->soft_registro_crud();
            break;
        case 3:
            $this->soft_registro_crud();
            break;
        case 5:
            $this->soft_registro_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function soft_registro_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Registro de Hardware');
	$crud->set_table('hardware');
	$crud->set_crud_url_path(site_url('index.php/Hardware/Alta_hardware_general2/index'));

	
	$crud->fields('id_tipo_hardware', 'marca', 'modelo', 'no_serie', 'no_inventario', 'ubicacion', 'id_coordinacion', 'proveedor', 'id_mod', 'id_usuario_b', 'usuario_asignado');
	$crud->columns('id_tipo_hardware','marca','modelo','no_serie','id_coordinacion','id_usuario_b');
	$crud->required_fields('id_tipo_hardware', 'ubicacion','marca','modelo','no_serie','id_coordinacion','id_usuario_b');



	$crud->set_relation('id_tipo_hardware','hardware_tipos_hardware','nombre_tipo');



	$state = $crud->getState();
        $state_info = $crud->getStateInfo();
        if($state == 'read')
            {
            $crud->fields('id_tipo_hardware', 'marca', 'modelo', 'no_serie', 'no_inventario', 'ubicacion', 'id_coordinacion', 'proveedor', 'id_mod', 'id_usuario_b', 'usuario_asignado', 'id_licencia');
            $crud->set_primary_key('id_licencia','view_hardware_licencias');
            $crud->set_relation_n_n('id_licencia', 'licencias_usuarios_b_n_n', 'view_hardware_licencias', 'id_hard', 'id_licencia', 'Licencia N°[{view_hardware_licencias.id_licencia}] {nombre_software}({version})');
            $crud->display_as('id_licencia','Licencias');
            $crud->change_field_type('id_licencia', 'readonly');
            }


    	
	
	
	
	
	
	

	$crud->unset_columns(array('id_prov'));
	$crud->unset_fields('id_prov');

	//Relaciones
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	//$crud->set_relation('id_prov','proveedor','nombre_empresa');
	$crud->set_relation('id_mod','hardware_modalidad','nombre_mod');
	$crud->set_relation('id_usuario_b','usuarios_b','{nombres} {ape_paterno} {ape_materno}');
	////Renombramiento
	$crud->display_as('id_tipo_hardware','Hardware');
	$crud->display_as('no_serie','N° Serie');
	$crud->display_as('no_inventario','N° Inventario');
	$crud->display_as('ubicacion','Ubicación');
	$crud->display_as('id_coordinacion','Coordinación');
	$crud->display_as('id_mod','Modalidad de propiedad');
	$crud->display_as('id_usuario_b','Usuario Responsable');
	$crud->display_as('usuario_asignado','Usuario Alterno');

	$crud->unset_print();

	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
		$crud->unset_add();
        $crud->unset_edit();
        $crud->unset_delete();
        $crud->unset_export();
	   
	};

	
	
	
	

$output = $crud->render();

$this->salida_Output($output);
}


function salida_Output($output = null)
{
//$this->load->view('general/header.php');   	//en esta linea se carga la seccion del header para todas las vistas que sean generadas usando esta función 
$this->load->view('general/navbar.php');
$this->load->view('headers/Hardware.php');
$this->load->view('headers/reporte_hardware.php');

$this->load->view('crud_template.php',$output);   
}

}
