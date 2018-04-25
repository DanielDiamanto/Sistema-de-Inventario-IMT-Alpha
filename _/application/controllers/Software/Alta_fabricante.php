<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Alta_fabricante extends CI_Controller {
 
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
            $this->soft_fabricante_crud();
            break;
        case 2:
            $this->soft_fabricante_crud();
            break;
        case 5:
            $this->soft_fabricante_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function soft_fabricante_crud()
{
	$crud = new grocery_CRUD();
//	$crud->set_theme('dini');
	$crud->set_subject('Fabricante de Software');
	$crud->set_table('soft_fabricante');
	$crud->set_crud_url_path(site_url('index.php/Software/Alta_fabricante/index'));

	$crud->required_fields('nombre_fabricante');
	
	$this->form_validation->set_rules('nombre_fabricante', 'Nombre Fabricante', 'trim|required|xss_clean|alpha_numeric');

	
	

	$crud->display_as('nombre_fabricante', 'Nombre Fabricante');
    $tipo_u = $this->session->userdata('tipo_u');
    if ($tipo_u == 5) {
        $crud->unset_operations();
    };

$output = $crud->render();

$this->salida_Output($output);


}

function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/alta_fab.php');
$this->load->view('crud_template.php',$output); 
}

}
