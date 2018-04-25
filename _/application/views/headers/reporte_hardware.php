                        <!--
                        <select onchange='this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);'>
                            <option value=''>Genera tu Reporte por Coordinación</option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/1 ')?>>Administración y Finanzas</option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/2 ')?>>Ingeniería Estructural, Formación Posprofesional y Telemática  </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/3 ')?>>Ingeniería Vehicular e Integridad Estructural </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/4 ')?>>Infraestructura </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/5 ')?>>Integracion del Transporte </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/6 ')?>>Normativa para la Infraestructura del Transporte </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/7 ')?>>Economía de los Transportes y Desarrollo Regional  </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/8 ')?>>Seguridad y Operación del Transporte </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/9 ')?>>Ingeniería Portuaria y Sistemas Geoespaciales </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/10')?>>Dirección General </option>
                            <option value=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/11')?>>División de Telemática</option>
                        </select>
                        
                        <div class='col-md-12' style='text-align: right;'>
                            <div class='col-md-9'></div>
                            <div class='col-md-3 dropdown'>
                                <a href='#' class='btn btn-simple dropdown-toggle' data-toggle='dropdown'>
                                    Genera tu Reporte por Coordinación
                                    <b class='caret'></b>
                                </a>
                                <ul class='dropdown-menu'>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/1 ')?>>Administración y Finanzas </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/2 ')?>>Ingeniería Estructural, Formación Posprofesional y Telemática   </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/3 ')?>>Ingeniería Vehicular e Integridad Estructural  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/4 ')?>>Infraestructura  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/5 ')?>>Integración del Transporte  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/6 ')?>>Normativa para la Infraestructura del Transporte  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/7 ')?>>Economía de los Transportes y Desarrollo Regional   </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/8 ')?>>Seguridad y Operación del Transporte  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/9 ')?>>Ingeniería Portuaria y Sistemas Geoespaciales  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/10')?>>Dirección General  </a></li>
                                    <li> <a href=<?php echo base_url('/index.php/Reportes/hardware/generar_excel/11')?>>División de Telemática </a></li>
                                </ul>
                            </div>

                        </div>
                        -->


                        <?php
                                $url = $_SERVER['REQUEST_URI'];
                                $url = parse_url($url, PHP_URL_PATH);
                                if ($url == '/inventario/desarrollo/index.php/Hardware/Alta_hardware_general2/index' || $url == '/inventario/desarrollo/index.php/Hardware/Alta_hardware_general2' || $url == '/inventario/desarrollo/index.php/Hardware/alta_hardware_general2') {
                                    $this->load->view('headers/reporte_hardware2.php');;
                                }
                        ?>
                        
