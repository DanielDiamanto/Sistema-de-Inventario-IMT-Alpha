<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Licencias extends CI_Controller {

    function __construct()
    {
        parent::__construct();

        $this->load->library('grocery_CRUD');
        $this->load->library('form_validation');


    }

    public function index()
    {
    switch ($this->session->userdata('tipo_u')) {
        case 1:
            $this->licenciamiento_crud();
            break;
        case 2:
            $this->licenciamiento_crud();
            break;
        case 5:
            $this->licenciamiento_crud();
            break;
        default:
            $this->load->view('errors/error403_view');
            break;
    }
        
    }

    public function licenciamiento_crud()
    {
        $crud = new grocery_CRUD();
        //$crud->set_theme('imt');
        $crud->set_subject('Licenciamiento');
        $crud->set_table('licencias');
        $crud->set_crud_url_path(site_url('index.php/Software/licencias/index'));
        
        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        if ($url != null) {
            $crud->field_type('id_software','hidden');
            $crud->callback_add_field('id_software', function () {   
            $url = $_SERVER['REQUEST_URI'];
            $url = parse_url($url, PHP_URL_QUERY); 

            return '<input type="text" maxlength="50" value="'.$url.'" style="visibility: hidden;" name="id_software">';
            });
            }else{
                $crud->set_relation('id_software','software','{nombre_software}');
            };


        //Mostrando el id de cada registro:
        //$crud->columns('id_licencia','id_software','id_tipo_licencia','id_esquema_licenciamiento','documento_anexo');
        //$crud->fields('id_software','id_tipo_licencia','id_esquema_licenciamiento','documento_anexo');
        //Como lo pidieron::
        $crud->columns('id_software', 'version','id_tipo_licencia','id_esquema_licenciamiento', 'referencia', 'documento_anexo');
        $crud->fields('id_software', 'version','id_tipo_licencia','id_esquema_licenciamiento', 'referencia', 'serial','documento_anexo');

        //$crud->set_relation('id_software','software','{nombre_software} {version}');
        $crud->set_relation('id_tipo_licencia','licencias_tipos','nom_tipo_licencia');
        $crud->set_relation('id_esquema_licenciamiento','licencias_esquema_licenciamiento','nom_esquema_licenciamiento');
        


        
        

        $state = $crud->getState();
        $state_info = $crud->getStateInfo();
        if($state == 'edit' )
            {
            //$crud->required_fields('id_software');
            $crud->set_relation('id_software','software','{nombre_software}');
            $crud->field_type('id_software', 'readonly');
            }
        
        
        $crud->field_type('mantenimiento','dropdown', array('Sí' => 'Sí', 'No' => 'No'));
        $crud->field_type('soporte','dropdown', array('Sí' => 'Sí', 'No' => 'No'));
   

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

        $crud->set_field_upload('documento_anexo','archivos_subidos/software_licenciamiento_doc_anexos');
        $crud->required_fields('version','id_tipo_licencia','id_esquema_licenciamiento','serial');
        


        $output = $crud->render();
        $this->salida_Output($output);
    }

    function redireccion_licencias($post_array,$primary_key)
        {         
        redirect('index.php/Software/licencias2','refresh');
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

    function salida_Output($output = null)
    {
        $this->load->view('general/navbar.php');
        $this->load->view('headers/licencias.php');
        $this->load->view('headers/nombre_software.php');
        $this->load->view('headers/ajustedisplay.php');
        $this->load->view('crud_template.php',$output); 
    }


}
