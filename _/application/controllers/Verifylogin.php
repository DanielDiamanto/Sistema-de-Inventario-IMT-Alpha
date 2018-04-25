<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class VerifyLogin extends CI_Controller {

 function __construct()
 {
   parent::__construct();
   $this->load->library('form_validation');
   $this->load->model('user','',TRUE);
 }

 function index()
 {
   //This method will have the credentials validation
   

   $this->form_validation->set_rules('username', 'Username', 'trim|required|xss_clean');
   $this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean|callback_check_database');


   if($this->session->userdata('logged_in'))
   {
     $session_data = $this->session->userdata('logged_in');
     redirect('index.php/Home', 'refresh');
     }

   if($this->form_validation->run() == FALSE)
   {
     //Field validation failed.  User redirected to login page

  $this->load->library('Layout');
  $this->layout->setTitulo('Login');
  $this->layout->setBody_class('signup-page');

  //Agregamos CSS y JS
  //  -----  Core CSS Files   -->
  $this->layout->add_css('assets/css/bootstrap.min.css');
  $this->layout->add_css('assets/css/material-kit.css');
  


  //  MK -----  Core JS Files   -->
  $this->layout->add_js('assets/js/jquery.min.js');
  $this->layout->add_js('assets/js/bootstrap.min.js');
  $this->layout->add_js('assets/js/material.min.js');
  $this->layout->add_js('assets/js/nouislider.min.js');
  $this->layout->add_js('assets/js/bootstrap-datepicker.js');
  $this->layout->add_js('assets/js/material-kit.js');
  $data = array();
  $this->load->library('form_validation', 'session');
  $this->layout->view('log',$data);
   }
   else 
   {
     //Saltar login
     redirect('index.php/Home', 'refresh');
   }

 }

function check_database($password)
 {


   //Field validation succeeded.  Validate against database
   $username = $this->input->post('username');
   //$password=$this->encriptar_password($password);
   //query the database
   try
   {
   $result = $this->user->login($username, $password); 
 }catch(Exception $e){
  echo '';
 }
   

   if($result)
   {
     $sess_array = array();
     foreach($result as $row)
     {
       $sess_array = array(
         'id_usuario' => $row->id_usuario,
         'username' => $row->username,
         'tipo_u' => $row->id_tipo_usuario,
         'rol' => $row->perfil,
       );
       $this->session->set_userdata('logged_in', true);
       $this->session->set_userdata($sess_array);
       
     }
     return TRUE;
   }
   else
   {
     $this->form_validation->set_message('check_database', 'Contrasena o Usuario invalido');
     return false;
   }
 }

}
?>