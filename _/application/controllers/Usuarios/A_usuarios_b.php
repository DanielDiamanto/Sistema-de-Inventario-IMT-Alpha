<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class A_usuarios_b extends CI_Controller {
 
function __construct()
{
    parent::__construct();
	$this->load->library('grocery_CRUD');
	$this->load->library('form_validation');
}
 
public function index()
{
		    switch ($this->session->userdata('tipo_u')) {
	        case 1://El admin
	            $this->usuarios_b_crud();
	            break;
	        case 3://El de hardware
	            $this->usuarios_b_crud();
	            break;
	        case 5://El invitado
	            $this->usuarios_b_crud();
	            break;
	        case 6://El de asignaciones
	            $this->usuarios_b_crud();
	            break;
	        default:
	            $this->load->view('errors/error403_view');
	            break;
	    }
	
}

public function usuarios_b_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Usuarios de Atención');
	$crud->set_table('usuarios_b');
	$crud->set_crud_url_path(site_url('index.php/Usuarios/a_usuarios_b/index'));
	$crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
	$crud->callback_before_insert(array($this,'upper'));
	$crud->callback_before_update(array($this,'upper'));
	$crud->field_type('activo','enum',array('Sí','No'));

	$crud->display_as('ape_paterno','Apellido Paterno');
	$crud->display_as('ape_materno','Apellido Materno');
	$crud->display_as('nombres','Nombres');
	$crud->display_as('id_coordinacion','Coordinación');
	$crud->display_as('activo','Activo');

	$crud->required_fields('ape_paterno', 'ape_materno', 'nombres', 'activo');

	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
	    $crud->unset_export();
	    $crud->unset_print();
	    $crud->unset_add();
	    $crud->unset_edit();
	    $crud->unset_delete();
	};
	
	
$output = $crud->render();

$this->salida_Output($output);


}


function salida_Output($output = null)
{
//$this->load->view('general/header.php');   	//en esta linea se carga la seccion del header para todas las vistas que sean generadas usando esta función 
$this->load->view('general/navbar.php');
$this->load->view('headers/usuarios_b.php');
$this->load->view('crud_template.php',$output); //Aquí se carga la vista de la carpeta views y se envia adicionalmente la variable que contiene el redenderizado del objeto $crud para meterlo en la vista
//$this->load->view('general/footer.php');  //Aqui cargo el pie de pagina    
}

function upper($post_array) {
$post_array['ape_paterno'] = mb_strtoupper(trim($post_array['ape_paterno']), 'UTF-8');
$post_array['ape_materno'] = mb_strtoupper(trim($post_array['ape_materno']), 'UTF-8');
$post_array['nombres'] = mb_strtoupper(trim($post_array['nombres']), 'UTF-8');

return $post_array;
}        
 


}
