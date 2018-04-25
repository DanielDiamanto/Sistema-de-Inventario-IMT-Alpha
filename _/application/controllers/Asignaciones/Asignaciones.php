<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Asignaciones extends CI_Controller {
 
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
            $this->asignaciones_crud();
            break;
        case 2://El de software
            
        case 3://El de hardware
            $this->asignaciones_crud();
            break;
        case 5://El invitado
            $this->asignaciones_crud();
            break;
        case 6://El de asignaciones
            $this->asignaciones_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function asignaciones_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Asignacion');
	$crud->where('activo','Sí');
	$crud->set_table('usuarios_b');
	$crud->set_crud_url_path(site_url('index.php/Asignaciones/asignaciones/index'));
 
	$crud->columns('ape_paterno', 'ape_materno', 'nombres', 'id_coordinacion', 'id_licencia', 'id_hard');
	$crud->fields('ape_paterno', 'ape_materno', 'nombres', 'id_coordinacion', 'id_licencia', 'id_hard'); 
	

	//Relacion para ver la coordinacion del usuario
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	//Relacion para ver las licencias asignadas al usuario
	$crud->set_primary_key('id_licencia','view_licencias_software');
	$crud->set_relation_n_n('id_licencia', 'licencias_usuarios_b_n_n', 'view_licencias_software', 'id_usuario_b', 'id_licencia', 'Licencia N°[{view_licencias_software.id_licencia}] {nombre_software}({version})');
	//Relacion para ver hardware asignado al usuario
	$crud->set_relation_n_n('id_hard', 'usuarios_b_n_n_hardware', 'hardware', 'id_usuario_bnn', 'id_hard', '{no_serie}[{marca} ({modelo})]');

	$crud->callback_edit_field('ape_paterno', function ($value, $primary_key) {
		return '<input type="text" maxlength="50"  value="'.$value.'" name="ape_paterno" style="width:462px;     background-color: transparent; border: 0px solid;height: 20px;width: 160px;" readonly >';
		//return '<div id="field-id_coordinacion" class="readonly_label">'.$value.'</div>';
		});
 	
 	$crud->unset_add();
 	$crud->unset_delete();

 	$tipo_u = $this->session->userdata('tipo_u');
 	if ($tipo_u == 5) {
 	    $crud->unset_edit();
 	    $crud->unset_export();
 	    $crud->unset_print();
 	};

	//$crud->change_field_type('ape_paterno', 'readonly');
	$crud->change_field_type('ape_materno', 'readonly');
	$crud->change_field_type('nombres', 'readonly');
	$crud->change_field_type('id_coordinacion', 'readonly');

	
	$crud->display_as('ape_paterno', 'Apellido Paterno');
	$crud->display_as('ape_materno', 'Apellido Materno');
	$crud->display_as('nombres', 'Nombre de Usuario');
	$crud->display_as('id_coordinacion', 'Coordinación');
	$crud->display_as('id_licencia', 'Licencias Asignadas');
	$crud->display_as('id_hard', 'Hardware Asignado');

$output = $crud->render();

$this->salida_Output($output);


}


function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/asignaciones.php');
$this->load->view('crud_template.php',$output);    
}

}
