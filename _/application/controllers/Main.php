<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class Main extends CI_Controller {
 
public function index()
{
 	$this->load->library('Layout');
 	$this->layout->setTitulo('Inicio');
 	$this->layout->setBody_class('landing-page');//Aqui establezco la clase del body
 	//Agregamos CSS y JS	

 	//  -----  Core CSS Files   -->
	$this->layout->add_css('assets/css/bootstrap.min.css');
	$this->layout->add_css('assets/css/material-kit.css');
	


	//  MK -----  Core JS Files   -->
	$this->layout->add_js('assets/js/jquery.min.js');
	$this->layout->add_js('assets/js/bootstrap.min.js');
	$this->layout->add_js('assets/js/material.min.js');
	
	
	$this->layout->add_js('assets/js/material-kit.js');

	

 	$data = array();

 	
 	$this->layout->view('inicio',$data);


}



}
