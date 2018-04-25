
<head>
    <link rel="shortcut icon" type="image/png" href="<?php echo base_url()?>assets/img/IMTLogo.png"/>
    <link type="text/css" rel="stylesheet" href="<?php echo base_url()?>assets/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="<?php echo base_url()?>assets/css/material-kit.css">
    <script type="text/javascript" src=<?php echo base_url()?>assets/js/jquery.min.js></script>
    <script type="text/javascript" src=<?php echo base_url()?>assets/js/material.min.js></script>
    <script type="text/javascript" src=<?php echo base_url()?>assets/js/material-kit.js></script>
    <script type="text/javascript" src=<?php echo base_url()?>assets/js/bootstrap.min.js></script>
    

</head>
	<nav class='navbar navbar-info ' role="navigation" style="font-family:  sans-serif; margin-bottom: 0px; */">
	<div class="container-fluid">
    	<div class="navbar-header">
            
                
            
    		
    		<a class="navbar-brand" href="<?php echo base_url()?>" >
                    <img src="<?php echo base_url()?>assets/img/IMTLogo.png" style="  width: 9%;display: -webkit-inline-box;">
            Sistema de Inventario IMT</a>

    	</div>

    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    		
    			<?php 
			if ($this->session->userdata('logged_in')) {
				

                switch ($this->session->userdata('tipo_u')) {
                    //Menu para Administrador 
                    case 1:
                        echo "
                <ul class='nav navbar-nav'>
                
                    <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios').">Administrar usuarios</a></li>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Software <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Software/Alta_software').">Inventario de software</a></li>
                            <li><a href=".base_url('index.php/Software/Licencias').">Licencias</a></li>
                            <li><a href=".base_url('index.php/Software/Contrataciones').">Contrataciones</a></li>
                            <li class='divider'></li>
                            <li><a href=".base_url('index.php/Software/Alta_fabricante').">Alta fabricante</a></li>
                        </ul>
                    </li>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Hardware <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <!--
                          <li><a class='item' href=".base_url('index.php/Hardware/alta_hardware_general').">Registrar Hardware General</a></li>
                          -->
                          <li><a class='item' href=".base_url('index.php/Hardware/alta_hardware_general2').">Registrar Hardware</a></li>
                          <!--
                            <li class='divider'></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_pc').">PCs/Laptops</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_print_scan').">Impresoras/Escáners</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_red').">Dispositivos de Red</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_otros').">Otros Dispositivos</a></li>
                          <li class='divider'></li>
                          -->
                        </ul>
                    </li>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Consumibles<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Consumibles/Entradas').">Gestionar Consumibles</a></li>
                            <li><a href=".base_url('index.php/Consumibles/Gastar_consumible').">Gastar Consumibles</a></li>
                          <li class='divider'></li>                      
                        </ul>
                    </li>

                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Proveedores<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Proveedores/Proveedores').">Proveedores</a></li>
                          <li class='divider'></li>                    
                        </ul>
                    </li>
                                            
                     <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Asignaciones<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Asignaciones/Asignaciones').">Gestionar Asignaciones</a></li>
                          <li class='divider'></li>                      
                          <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios_b').">Gestionar Usuarios de Atención</a></li> 
                        </ul>
                    </li>                                                            
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a>
                    </li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                        break;
                //Menu para Administrador Software
                case 2:
                        echo "
                <ul class='nav navbar-nav'>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Software <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Software/Alta_software').">Inventario de software</a></li>
                            <li><a href=".base_url('index.php/Software/Licencias').">Licencias</a></li>
                            <li><a href=".base_url('index.php/Software/Contrataciones').">Contrataciones</a></li>
                            <li class='divider'></li>
                            <li><a href=".base_url('index.php/Software/Alta_fabricante').">Alta fabricante</a></li>
                        </ul>
                    </li>  
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Proveedores<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Proveedores/Proveedores').">Proveedores</a></li>
                          <li class='divider'></li>                    
                        </ul>
                    </li>  
                     <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Asignaciones<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Asignaciones/Asignaciones').">Gestionar Asignaciones</a></li>
                          <li class='divider'></li>                      
                          <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios_b').">Gestionar Usuarios de Atención</a></li> 
                        </ul>
                    </li>                                                         
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a></li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                    break;
                //Menu para Administrador Hardware
                case 3:
                        echo "
                <ul class='nav navbar-nav'>
            
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Hardware <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                          <li><a class='item' href=".base_url('index.php/Hardware/alta_hardware_general2').">Registrar Hardware</a></li>
                        </ul>
                    </li>

                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Consumibles<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Consumibles/Entradas').">Gestionar Consumibles</a></li>
                            <li><a href=".base_url('index.php/Consumibles/Gastar_consumible').">Gastar Consumibles</a></li>
                          <li class='divider'></li>                      
                        </ul>
                    </li>
                     
                     <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Asignaciones<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Asignaciones/Asignaciones').">Gestionar Asignaciones</a></li>
                          <li class='divider'></li>                      
                          <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios_b').">Gestionar Usuarios de Atención</a></li> 
                        </ul>
                    </li>                       
                                                                                  
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a></li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                    break;
                //Menu para Administrador Consumibles
                case 4:
                        echo "
                <ul class='nav navbar-nav'>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Consumibles<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Consumibles/Entradas').">Gestionar Consumibles</a></li>
                            <li><a href=".base_url('index.php/Consumibles/Gastar_consumible').">Gastar Consumibles</a></li>
                          <li class='divider'></li>                      
                        </ul>
                    </li>
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a></li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                    break;
                //Menu para Invitado
                case 5:
                        echo "
                <ul class='nav navbar-nav'>
                
                    
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Software <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Software/Alta_software').">Inventario de software</a></li>
                            <li><a href=".base_url('index.php/Software/Licencias').">Licencias</a></li>
                            <li><a href=".base_url('index.php/Software/Contrataciones').">Contrataciones</a></li>
                            <li class='divider'></li>
                            <li><a href=".base_url('index.php/Software/Alta_fabricante').">Alta fabricante</a></li>
                        </ul>
                    </li>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Hardware <b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <!--
                          <li><a class='item' href=".base_url('index.php/Hardware/alta_hardware_general').">Registrar Hardware General</a></li>
                          -->
                          <li><a class='item' href=".base_url('index.php/Hardware/alta_hardware_general2').">Registrar Hardware</a></li>
                          <!--
                            <li class='divider'></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_pc').">PCs/Laptops</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_print_scan').">Impresoras/Escáners</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_red').">Dispositivos de Red</a></li>
                          <li><a class='item' href=".base_url('index.php/Hardware/Alta_hardware_otros').">Otros Dispositivos</a></li>
                          <li class='divider'></li>
                          -->
                        </ul>
                    </li>
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Consumibles<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Consumibles/Entradas').">Gestionar Consumibles</a></li>
                            <li><a href=".base_url('index.php/Consumibles/Gastar_consumible').">Gastar Consumibles</a></li>
                          <li class='divider'></li>                      
                        </ul>
                    </li>

                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Proveedores<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Proveedores/Proveedores').">Proveedores</a></li>
                          <li class='divider'></li>                    
                        </ul>
                    </li>
                                            
                    <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Asignaciones<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Asignaciones/Asignaciones').">Gestionar Asignaciones</a></li>
                          <li class='divider'></li>                      
                          <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios_b').">Gestionar Usuarios de Atención</a></li> 
                        </ul>
                    </li>                                                               
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a></li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                    break;
                //Menu para Administrador Asignaciones
                case 6:
                        echo "
                <ul class='nav navbar-nav'>          
                     <li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown'>Asignaciones<b class='caret'></b></a>
                        <ul class='dropdown-menu'>
                            <li><a href=".base_url('index.php/Asignaciones/Asignaciones').">Gestionar Asignaciones</a></li>
                          <li class='divider'></li>                      
                          <li><a class='item' href=".base_url('index.php/Usuarios/a_usuarios_b').">Gestionar Usuarios de Atención</a></li> 
                        </ul>
                    </li>                                                               
                </ul>
                <ul class='nav navbar-nav navbar-right'>
                    <li><a class='item' href='  '  data-toggle='tooltip' data-placement='bottom' title='".$this->session->userdata('rol')."'>
                        <img src='".base_url()."assets/img/userid.png' style='display: -webkit-inline-box; width: 36px; height: 32px;padding:  0 0 0 0;margin: -20px 0px -16px 0px;'>
                    <b>".$this->session->userdata('username')."</b>
                    </a></li>
                    <li><a class='item' href=".base_url('index.php/home/logout').">Cerrar Sesión</a></li>
                </ul>
                ";
                    break;
                    
                    default:
                        # code...
                        break;
                }
                
			}else{
				echo "
				
				<ul class='nav navbar-nav navbar-right'>
        			<li><a class='item' href=".base_url('index.php/verifylogin').">Iniciar Sesión</a></li>
        		</ul>
				


				";
			}
		 ?>
    	</div>
	</div>
</nav>
    <script>
    $( window ).on( "load", function() {
        $("[value='Guardar']").css("display", "none");
        $("#search_clear").val("Limpiar Búsqueda");
        
        

             
    });
    </script>

<!--
<div class="col-md-12" style="height: 15%;"></div>
-->
