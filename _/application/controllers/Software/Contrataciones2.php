<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Contrataciones2 extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');// Aqui cargo las librerias para que funcionen correctamente los objetos instanciados 
}
 
public function index()
{
    switch ($this->session->userdata('tipo_u')) {
        case 1:
            $this->soft_compras_crud();
            break;
        case 2:
            $this->soft_compras_crud();
            break;
        case 5:
            $this->soft_compras_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }

}

public function soft_compras_crud()
{

	$crud = new grocery_CRUD();// Aqui se crea el objeto
	//$crud->set_theme('imt');
	$crud->set_subject('Contratación');
	$crud->set_table('compras');



	$crud->set_crud_url_path(site_url('index.php/Software/Contrataciones2/index'));
	$crud->set_relation('id_proveedor','proveedor','nombre_empresa');
	$crud->set_relation('id_divisa','compras_divisas','nom_divisa');

    $crud->field_type('mantenimiento','dropdown', array('Sí' => 'Sí', 'No' => 'No', 'N/A' => 'N/A'));
    $crud->field_type('soporte','dropdown', array('Sí' => 'Sí', 'No' => 'No', 'N/A' => 'N/A'));
    

    //$crud->set_relation('id_licencia','licencias','id_licencia');
        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        if ($url != '') {
            $crud->callback_add_field('id_licencia', function () {   
            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY); 

            $this->session->set_tempdata('lic', $url, 300);
            $crud->where('ja9a0dd49.id_licencia', $_SESSION['lic']);

            return '<input type="text" maxlength="50" value="'.$url.'" style="visibility: hidden;" name="id_licencia" readonly> ';
            });
            }else{
                //$crud->set_relation('id_licencia','licencias','{id_licencia}');
                $crud->where('ja9a0dd49.id_licencia', $_SESSION['lic']);
            };

            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY);
            if ($url != null) {
                //$this->load->helper('cookie');
                //delete_cookie("crud_page_62bea6ac5777a5aff201baf2662649bc");
                //delete_cookie("hidden_ordering_62bea6ac5777a5aff201baf2662649bc");
                
                $this->session->set_tempdata('lic', $url, 300);
                $crud->where('ja9a0dd49.id_licencia', $_SESSION['lic']);
            };

            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY);
            if ($url != null) {
                //$this->load->helper('cookie');
                //delete_cookie("crud_page_62bea6ac5777a5aff201baf2662649bc");
                //delete_cookie("hidden_ordering_62bea6ac5777a5aff201baf2662649bc");
                
                $this->session->set_tempdata('software', $url, 300);
                
            };

            $crud->where('ja9a0dd49.id_licencia', $_SESSION['lic']);


            $state = $crud->getState();
            $state_info = $crud->getStateInfo();
             
            if($state == 'edit' || $state == 'add' || $state == 'read')
            {
            $crud->set_primary_key('id_licencia','view_licencias_software');
            $crud->set_relation('id_licencia','view_licencias_software','Referencia: [{view_licencias_software.referencia}] {nombre_software}({version})');
            $crud->field_type('id_licencia','readonly');
            }


            $tipo_u = $this->session->userdata('tipo_u');
            if ($tipo_u == 5) {
                $crud->unset_add();
                $crud->unset_edit();
                $crud->unset_delete();
            };
            $crud->set_primary_key('id_licencia','view_licencias_software');
            $crud->set_relation('id_licencia','view_licencias_software','[{referencia}] {nombre_software}({version})');

            
            

        $crud->display_as('id_compra','Identificador de Compra');
        $crud->display_as('id_licencia','Licencia Asociada');
        $crud->display_as('descripcion','Descripción');
        $crud->display_as('fecha_compra','Fecha de Compra');
        $crud->display_as('id_proveedor','Proveedor');
        $crud->display_as('id_divisa','Divisa');

    $crud->set_field_upload( 'contrato_corporativo', 'archivos_subidos/compras_contratos_corporativos/');
    $crud->set_field_upload( 'documento_anexo', 'archivos_subidos/compras_documentos_anexos/');


    $crud->columns('id_licencia','descripcion', 'fecha_compra', 'monto', 'id_divisa','documento_anexo', 'Coordinación');
    $crud->fields('id_licencia','descripcion', 'fecha_compra', 'id_proveedor', 'fecha_inicio','fecha_fin','mantenimiento','soporte', 'monto', 'id_divisa', 'contrato_corporativo', 'documento_anexo', 'Coordinación');
    $crud->required_fields('descripcion', 'fecha_compra', 'id_proveedor', 'fecha_inicio','mantenimiento','soporte', 'monto', 'id_divisa');

    $crud->set_relation_n_n('Coordinación', 'compras_coordinacion_n_n', 'coordinacion', 'id_compra', 'id_coordinacion', 'nombre_coordinacion');




    $crud->where('ja9a0dd49.id_licencia', $_SESSION['lic']);
	$output = $crud->render();

	$this->salida_Output($output);



}


function salida_Output($output = null)
{

$this->load->view('general/navbar.php');
$this->load->view('headers/contrataciones.php');
$this->load->view('headers/ajustedisplay_c.php');
$this->load->view('headers/nombre_licenciamiento.php');
$this->load->view('crud_template.php',$output);   
}

}
