<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Home extends CI_Controller {

 function __construct()
 {
   parent::__construct();
 }

 function index()
 {
  //Esta condicion verifica la variable de sesión para comprobar si se ha autenticado o no
   if($this->session->userdata('logged_in'))
   {

    
     $session_data = $this->session->userdata('logged_in');
     

      $this->load->library('Layout');
      $this->layout->setTitulo('Home');
      $this->layout->setBody_class('landing-page');
      //$this->layout->setNav_position('navbar-absolute');
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

      
      $data['username'] = $session_data['username'];
      $this->layout->view('home_view',$data);


     //$this->load->view('home_view', $data);
   }
   else
   {
     //Si no existe la sesión redirecciona al login
     redirect('index.php/verifylogin', 'refresh');
   }
 }

 function logout()
 {
   $this->session->unset_userdata('logged_in');
   session_destroy();
   redirect('', 'refresh');
 }

}

?>