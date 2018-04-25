<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class A_usuarios extends CI_Controller {
 
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
			$this->usuarios_a_crud();
			break;
		default:
			$this->load->view('errors/error403_view');
			break;
	}
}

public function usuarios_a_crud()
{
	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Usuario del Sistema');
	$crud->set_table('usuarios');
	$crud->set_crud_url_path(site_url('index.php/Usuarios/a_usuarios/index'));
	$crud->set_relation('id_tipo_usuario','usuarios_tipos','perfil');
	
	$crud->display_as('id_tipo_usuario','Rol');
	$crud->display_as('nombre_usuario','Nombre completo del Usuario');
	$crud->display_as('username','Nombre de Usuario (Login)');
	$crud->display_as('password','Contraseña');

	$crud->required_fields('id_tipo_usuario', 'nombre_usuario', 'username','password');
	$crud->unique_fields(array('username'));


$output = $crud->render();

$this->salida_Output($output);


}


function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/a_usuarios.php');
$this->load->view('headers/ajustedisplay_u.php');
$this->load->view('crud_template.php',$output);    
}

}
