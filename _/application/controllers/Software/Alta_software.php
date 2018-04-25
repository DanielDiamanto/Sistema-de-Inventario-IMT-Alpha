<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_software extends CI_Controller {
 
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
		case 2:
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
//	$crud->set_theme('dini');
	$crud->set_subject('Software');
	$crud->set_table('software');
	$crud->set_crud_url_path(site_url('index.php/Software/Alta_software/index'));
	$crud->set_relation('id_categoria','soft_categoria','nom_cat');
	$crud->set_relation('id_fabricante','soft_fabricante','nombre_fabricante');
	
	$this->form_validation->set_rules('nombre_software', 'Nombre Software', 'trim|required|xss_clean');

	$crud->columns('nombre_software', 'id_categoria','id_fabricante');
	$crud->fields('nombre_software', 'descripcion','id_categoria','id_fabricante');

	$crud->required_fields('nombre_software', 'id_categoria','id_fabricante');
	
	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
		$crud->unset_operations();
	}else{
		$crud->add_action('Agregar Licencia', base_url('assets/img/license2.png'), '','gen',array($this,'agregar_licencia'));
		$crud->add_action('Ver Licencias', base_url('assets/img/list2.png'), '','gen',array($this,'ver_licencias'));
	};

	$crud->display_as('nombre_software','Nombre del Software');
	
	$crud->display_as('descripcion','Descripción');
	$crud->display_as('id_categoria','Categoría');
	$crud->display_as('id_fabricante','Fabricante');

	//$crud->add_action('test1', '', 'Software/Licenciamiento/index/add','read-icon');
	
	//$crud->add_action('Agregar Licencia', base_url('assets/img/license2.png'), 'index.php/Software/licencias2/index/add?id_software=','gen');


	

$output = $crud->render();

$this->salida_Output($output);


}

public function agregar_licencia($primary_key , $row)
{
	
	$var = $row->id_software;

	//$this->session->set_flashdata('id_software2', primary_key);
	//$this->session->set_tempdata('id_software', array($primary_key), 300);

	return 
		site_url('index.php/Software/licencias/index/add').'?'.$row->id_software ;


	
	
	//return site_url('index.php/Software/licencias2/index/add/');
	//return site_url('index.php/Software/licencias/index/add');
}
public function ver_licencias($primary_key , $row)
{
	
	$var = $row->id_software;
	return 
		site_url('index.php/Software/licencias2/').'?'.$row->id_software ;
}

function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/inv_software.php');
$this->load->view('crud_template.php',$output); 
}

}
