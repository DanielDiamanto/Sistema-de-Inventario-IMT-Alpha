<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Licencias2 extends CI_Controller {

    function __construct()
    {
        parent::__construct();

        $this->load->library('grocery_CRUD');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $this->licenciamiento_crud();
    }

    public function licenciamiento_crud()
    {
        $crud = new grocery_CRUD();
        //$crud->set_theme('imt');
        $crud->set_subject('Licenciamiento');
        $crud->set_table('licencias');
        $crud->set_crud_url_path(site_url('index.php/Software/licencias2/index'));

        $crud->columns(array('id_licencia','id_software','id_tipo_licencia','id_esquema_licenciamiento','fecha_inicio','fecha_fin','mantenimiento','soporte','serial','documento_anexo'));
        $crud->set_relation('id_software','software','{nombre_software}');
        $crud->set_relation('id_tipo_licencia','licencias_tipos','nom_tipo_licencia');
        $crud->set_relation('id_esquema_licenciamiento','licencias_esquema_licenciamiento','nom_esquema_licenciamiento');
        $crud->set_field_upload('documento_anexo','archivos_subidos/software_licenciamiento_doc_anexos');

        $crud->columns('id_software', 'version', 'referencia', 'id_tipo_licencia','id_esquema_licenciamiento','documento_anexo');
        $crud->fields('id_software', 'version', 'referencia', 'id_tipo_licencia','id_esquema_licenciamiento','serial','documento_anexo');


        $crud->field_type('mantenimiento','dropdown', array('Sí' => 'Sí', 'No' => 'No', 'N/A' => 'N/A'));
        $crud->field_type('soporte','dropdown', array('Sí' => 'Sí', 'No' => 'No', 'N/A' => 'N/A'));

        


        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        if ($url != '') {
            
            $crud->callback_add_field('id_software', function () {   
            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY); 
            return '<input type="text" maxlength="50" value="'.$url.'" style="visibility: hidden;" name="id_software readonly">';
            });
            }else{
                //$crud->set_relation('id_software','software','{nombre_software} {version}');
            };

            $state = $crud->getState();
            $state_info = $crud->getStateInfo();
             
            if($state == 'edit' )
            {
            $crud->set_relation('id_software','software','{nombre_software}');
            $crud->field_type('id_software', 'readonly');
            }

        $crud->display_as('id_licencia','Identificador de Licencia');
        $crud->display_as('id_software','Software');
        $crud->display_as('version','Versión');
        $crud->display_as('id_tipo_licencia','Tipo de licencia');
        $crud->display_as('id_esquema_licenciamiento','Esquema de licenciamiento');
        $crud->display_as('mantenimiento','Mantenimiento');
        $crud->display_as('soporte','Soporte');
        
        $tipo_u = $this->session->userdata('tipo_u');
        if ($tipo_u == 5) {
            $crud->unset_add();
            $crud->unset_edit();
            $crud->unset_delete();
        }else{
            $crud->add_action('Ver Contrataciones', base_url('assets/img/list2.png'), '','gen',array($this,'ver_contrataciones'));
            $crud->add_action('Agregar Contratación', base_url('assets/img/contratacion.png'), '','gen',array($this,'agregar_contratacion'));
        };
        
        //$crud->unset_back_to_list();
        //$crud->callback_after_insert(array($this, 'redireccion_licencias'));


        //En la siguiente funcion se configura el msg de exito y se redirecciona
        //$crud->set_lang_string('insert_success_message',
        // 'Informacion almacenada exitosamente.<br/>Será redireccionado al módulo de licencias.
        // <script type="text/javascript">
        //    function redireccionar(){window.location = "'.site_url(strtolower('index.php/Software/licencias').'/'.strtolower('')).'";} 
        //    setTimeout ("redireccionar()", 4000);
        // </script>
        // <div style="display:none">
        // '
        //     );
        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        if ($url != null) {
            //$this->load->helper('cookie');
            //delete_cookie("crud_page_62bea6ac5777a5aff201baf2662649bc");
            //delete_cookie("hidden_ordering_62bea6ac5777a5aff201baf2662649bc");
            
            $this->session->set_tempdata('software', $url, 300);
            
        };

        $crud->where('licencias.id_software', $_SESSION['software']);
        

        
        $crud->required_fields('version','id_tipo_licencia','id_esquema_licenciamiento','serial');

        $output = $crud->render();
        $this->salida_Output($output);
    }

    public function agregar_contratacion($primary_key , $row)
{
    $var = $row->id_licencia;

    return 
        site_url('index.php/Software/contrataciones/index/add').'?'.$row->id_licencia ;
}

public function ver_contrataciones($primary_key , $row)
{
    
    $var = $row->id_licencia;
    return 
        site_url('index.php/Software/contrataciones2/').'?'.$row->id_licencia ;
}


    function redireccion_licencias($post_array,$primary_key)
        {         
        redirect('index.php/Software/licencias','refresh');
        }

    function salida_Output($output = null)
    {
        $this->load->view('general/navbar.php');
        $this->load->view('headers/licencias.php');
        $this->load->view('headers/nombre_software_licencias.php');
        $this->load->view('headers/ajustedisplay.php');
        $this->load->view('crud_template.php',$output); 
    }


}
