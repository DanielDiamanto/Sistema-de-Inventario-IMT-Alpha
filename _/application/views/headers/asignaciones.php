<div class="">
  <div class="jumbotron" style="text-align:  center; margin: 0 0 0 0; padding: 0px 0px 1px 0px;">
    <h1>Asignaciones</h1> 

    <?php
    $tipo_u = $this->session->userdata('tipo_u');
    if ($tipo_u != 5) {

    	echo "
    	    <div class='alert alert-info'>
    		    <b>Atención:</b> Sólo a los usuarios activos se les pueden asignar recursos, para activar o agregar un usuario vaya a <b>ASIGNACIONES > Gestionar Usuarios de Atención</b> en la barra de navegacion
    		</div>
    	";

    };

    ?>
    
</div>