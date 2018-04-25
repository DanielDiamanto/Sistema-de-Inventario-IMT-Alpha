<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Compras extends CI_Controller {
 
function __construct()
{
        parent::__construct();
 
$this->load->database();
$this->load->library('grocery_CRUD');// Aqui cargo las librerias para que funcionen correctamente los objetos instanciados 
}
 
public function index()
{
$this->soft_compras_crud();
}

public function soft_compras_crud()
{

	$crud = new grocery_CRUD();// Aqui se crea el objeto
	//$crud->set_theme('imt');
	$crud->set_subject('Contratación');
	$crud->set_table('compras');// Aqui se referencia la tabla de la base de datos que alimentara al objeto
	//$crud->display_as('nombre_empresa','Empresa');
	//$crud->display_as('nombre_contacto','Contacto');
	$crud->set_crud_url_path(site_url('index.php/Software/Compras/index'));
	$crud->set_relation('id_proveedor','proveedor','nombre_empresa');
	$crud->set_relation('id_divisa','compras_divisas','nom_divisa');
	$crud->set_field_upload( 'contrato_corporativo', 'archivos_subidos/compras_contratos_corporativos/');
	$crud->set_field_upload( 'documento_anexo', 'archivos_subidos/compras_documentos_anexos/');
	//$crud->field_type('mantenimiento','dropdown', array('Sí' => 'Sí', 'No' => 'No'));
    //$crud->field_type('soporte','dropdown', array('Sí' => 'Sí', 'No' => 'No'));
	//$crud->set_relation_n_n('Usuarios', 'compras_coordinacion_n_n', 'usuarios_b', 'id_compra', 'id_usuario_b', '{nombres} {ape_paterno} {ape_materno}');
    //$crud->set_relation_n_n('Coordinación', 'compras_coordinacion_n_n', 'coordinacion', 'id_compra', 'id_coordinacion', 'nombre_coordinacion');

    $crud->columns('id_compra', 'id_licencia', 'descripcion', 'fecha_compra', 'id_proveedor', 'monto', 'id_divisa', 'contrato_corporativo', 'documento_anexo');
    $crud->fields('id_licencia', 'descripcion', 'fecha_compra', 'id_proveedor', 'monto', 'id_divisa', 'contrato_corporativo', 'documento_anexo');

    $crud->set_relation('id_licencia','licencias','id_licencia');

        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        if ($url != '') {
            $crud->callback_add_field('id_licencia', function () {   
            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY); 
            return '<input type="text" maxlength="50" value="'.$url.'" style="visibility: ;" name="id_licencia" readonly> ';
            });
            }else{
                $crud->set_relation('id_licencia','licencias','id_licencia');
            };

        $crud->display_as('id_compra','Identificador de Compra');
        $crud->display_as('id_licencia','Licencia Asociada');
        $crud->display_as('descripcion','Descripción');
        $crud->display_as('fecha_compra','Fecha de Compra');
        $crud->display_as('id_proveedor','Proveedor');
        $crud->display_as('id_divisa','Divisa');




	$output = $crud->render();

	$this->salida_Output($output);



}


function salida_Output($output = null)
{
$this->load->view('general/navbar.php');
$this->load->view('crud_template.php',$output);   
}

}
