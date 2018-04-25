<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Gastar_consumible extends CI_Controller {
 
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
            $this->gastar_consumible_crud();
            break;
        case 3://El de hardware
            $this->gastar_consumible_crud();
            break;
        case 4://El de consumibles 0 kill
            $this->gastar_consumible_crud();
            break;
        case 5://El invitado
            $this->gastar_consumible_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }


}

public function gastar_consumible_crud()
{

	$crud = new grocery_CRUD();
	//$crud->set_theme('imt');
	$crud->set_subject('Gasto de Consumible');
	$crud->set_table('movimientos_consumibles');
	$crud->set_crud_url_path(site_url('index.php/Consumibles/Gastar_consumible/index'));
	$crud->set_relation('id_consumible','consumibles','{nombre_consumible} ({marca})');
    $crud->set_relation('id_coordinacion','coordinacion','nombre_coordinacion');
		
	$crud->callback_before_insert(array($this,'verificar_cantidad'));


	$crud->display_as('id_consumible','Nombre del Consumible');
	$crud->display_as('cantidad','Cantidad');
	$crud->display_as('descripcion','Descripción');
    $crud->display_as('id_coordinacion','Coordinación');
    $crud->display_as('documento_anexo','Documento Anexo');

	$crud->required_fields('id_consumible', 'cantidad', 'descripcion');
    $crud->set_field_upload('documento_anexo','archivos_subidos/gasto_consumibles');
	
	$tipo_u = $this->session->userdata('tipo_u');
	if ($tipo_u == 5) {
	    $crud->unset_operations();
	};
	
	

	
	$output = $crud->render();
	$this->salida_Output($output);
}

function verificar_cantidad($post_array) {
$this->db->select('cantidad');
$this->db->from('consumibles');
$this->db->where('id_consumible', $post_array['id_consumible']);
$filas = $this->db->get()->result();
foreach ($filas as $row)
    {
       $cantidad_actual = $row->cantidad;
    };

    if ($cantidad_actual >= $post_array['cantidad']) {
    	
    	return $post_array;
    }else{
    	return false;
    	echo 'ssssssss';
    }

} 

 

function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('headers/gastar_consumible.php');
$this->load->view('crud_template.php',$output);  
}

}
