<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Hardware extends CI_Controller {
	public function __construct(){
		parent::__construct();
	}

	
	public function generar_excel($id_coordinacion=null){
		//Aqui seleccionamos la coordinación para nombrar los titulos y el archivo
		$this->db->select('coordinacion');
		$this->db->from('view_hardware_reportes');
		$this->db->where('id_coordinacion', $id_coordinacion);
		$nombre_coordinacion = $this->db->get()->result();
		foreach ($nombre_coordinacion as $row)
		    {
		       $tituloReporte = $row->coordinacion;
		    };

		$this->db->select('*');
        $this->db->from('view_hardware_reportes');
        $this->db->where('tipo', 'PC');
        $this->db->or_where('tipo', 'Laptop');
        $this->db->having('id_coordinacion ='.$id_coordinacion);

        $querypc = $this->db->get()->result();

        
        if($id_coordinacion > 0){
        	//Cargamos la librería de excel.
        	$this->load->library('excel');
        	// Establecer propiedades}
        	$this->excel->getProperties()
        	        ->setCreator("IMT-Telematica")
        	        ->setLastModifiedBy("IMT")
        	        ->setTitle("Reporte de Hardware")
        	        ->setSubject("Documento Excel")
        	        ->setDescription("Reportes")
        	        ->setKeywords("Excel Office 2007 openxml php")
        	        ->setCategory("Excel");

        	  
			$this->excel->setActiveSheetIndex(0);
	        $this->excel->getActiveSheet()->setTitle('PC - Laptop');

	        //Logo IMT 
	        $this->excel->setActiveSheetIndex(0) ->mergeCells('A1:H4');
	        $objDrawing = new PHPExcel_Worksheet_Drawing();
	        $objDrawing->setPath('b1.jpg'); //ruta
	        $objDrawing->setHeight(80); //altura
	        $objDrawing->setWidth(475);
	        $objDrawing->setCoordinates('A1');
	        $objDrawing->setWorksheet($this->excel->getActiveSheet()); //incluir la imagen



	        //Combinar celdas para el encabezado del reporte
	        $this->excel->setActiveSheetIndex(0)
	                ->mergeCells('I1:M4');    
	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setBold(true);
	        $this->excel->getActiveSheet()->setCellValue('I1', $tituloReporte);   
	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setSize(12);     

	        //Ecabezados de la tabla
	        //Contador de filas
	        $contador = 5;
	        //Definimos los títulos de la cabecera.
	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", 'TIPO');
	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", 'MODALIDAD');
	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", 'MARCA');
	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", 'MODELO');
	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", 'NO_SERIE');
	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", 'NO_INVENTARIO');
	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", 'USUARIO_R');
	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", 'PROVEEDOR');
	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", 'COORDINACION');
	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", 'UBICACION');



	        //Definimos la data del cuerpo.
	        foreach($querypc as $l){
	        	//Incrementamos una fila más, para ir a la siguiente.
	        	$contador++;
	        	//Informacion de las filas de la consulta.
	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->tipo);
	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->modalidad);
	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->marca);
	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->modelo);
	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->no_serie);
	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->no_inventario);
	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->usuario_r);
	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->proveedor);
	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->coordinacion);
	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->ubicacion);

	             }

	        //Tamano de celdas automatico
	        for ($i = 'A'; $i <= 'M'; $i++) {
	            $this->excel->setActiveSheetIndex(0)
	                    ->getColumnDimension($i)->setAutoSize(TRUE);
	        }
	        //Estilos
	        $styleArray = array(
	            //Letra
	            'font' => array(
	                'bold' => true,
	            ),
	            //Alineacion letra
	            'alignment' => array(
	                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	            ),
	            'fill' => array(
	                //Background encabezado
	                'type' => PHPExcel_Style_Fill::FILL_SOLID,
	                'rotation' => 90,
	                'startcolor' => array(
	                    'argb' => 'A5A5A5',
	                ),
	            ),
	        );
	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($styleArray);

	        $borders = array(
	            'borders' => array(
	                'allborders' => array(
	                    'style' => PHPExcel_Style_Border::BORDER_THIN,
	                    'color' => array('argb' => 'FF000000'),
	                )
	            ),
	        );

	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($borders);
	        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        //--------------------------------------------***********SEGUNDA HOJA***********************-----------------------------------------
	        $this->excel->createSheet();


	        		$this->db->select('*');
	                $this->db->from('view_hardware_reportes');
	                $this->db->where('tipo', 'Impresora');
	                $this->db->or_where('tipo', 'Escaner');
	                $this->db->or_where('tipo', 'Multifuncional');
	                $this->db->having('id_coordinacion ='.$id_coordinacion);

	                

	                $queryscan = $this->db->get()->result();


	                	  
	        			$this->excel->setActiveSheetIndex(1);
	        	        $this->excel->getActiveSheet()->setTitle('Impresora - Escáner');

	        	        //Logo IMT 
	        	        $this->excel->setActiveSheetIndex(1) ->mergeCells('A1:H4');
	        	        $objDrawing = new PHPExcel_Worksheet_Drawing();
	        	        $objDrawing->setPath('b1.jpg'); //ruta
	        	        $objDrawing->setHeight(80); //altura
	        	        $objDrawing->setWidth(475);
	        	        $objDrawing->setCoordinates('A1');
	        	        $objDrawing->setWorksheet($this->excel->getActiveSheet()); //incluir la imagen


	        	        //Encabezado de reporte
	        	        
	        	        //Combinar celdas para el encabezado del reporte
	        	        $this->excel->setActiveSheetIndex(1)
	        	                ->mergeCells('I1:M4');    
	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setBold(true);
	        	        $this->excel->getActiveSheet()->setCellValue('I1', $tituloReporte);   
	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setSize(12);     

	        	        //Ecabezados de la tabla
	        	        //Contador de filas
	        	        $contador = 5;
	        	        //Definimos los títulos de la cabecera.
	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", 'TIPO');
	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", 'MODALIDAD');
	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", 'MARCA');
	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", 'MODELO');
	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", 'NO_SERIE');
	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", 'NO_INVENTARIO');
	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", 'USUARIO_R');
	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", 'PROVEEDOR');
	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", 'COORDINACION');
	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", 'UBICACION');



	        	        //Definimos la data del cuerpo.
	        	        foreach($queryscan as $l){
	        	        	//Incrementamos una fila más, para ir a la siguiente.
	        	        	$contador++;
	        	        	//Informacion de las filas de la consulta.
	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->tipo);
	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->modalidad);
	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->marca);
	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->modelo);
	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->no_serie);
	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->no_inventario);
	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->usuario_r);
	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->proveedor);
	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->coordinacion);
	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->ubicacion);

	        	             }

	        	        //Tamano de celdas automatico
	        	        for ($i = 'A'; $i <= 'M'; $i++) {
	        	            $this->excel->setActiveSheetIndex(1)
	        	                    ->getColumnDimension($i)->setAutoSize(TRUE);
	        	        }
	        	        //Estilos
	        	        $styleArray = array(
	        	            //Letra
	        	            'font' => array(
	        	                'bold' => true,
	        	            ),
	        	            //Alineacion letra
	        	            'alignment' => array(
	        	                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        	            ),
	        	            'fill' => array(
	        	                //Background encabezado
	        	                'type' => PHPExcel_Style_Fill::FILL_SOLID,
	        	                'rotation' => 90,
	        	                'startcolor' => array(
	        	                    'argb' => 'A5A5A5',
	        	                ),
	        	            ),
	        	        );
	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($styleArray);

	        	        $borders = array(
	        	            'borders' => array(
	        	                'allborders' => array(
	        	                    'style' => PHPExcel_Style_Border::BORDER_THIN,
	        	                    'color' => array('argb' => 'FF000000'),
	        	                )
	        	            ),
	        	        );

	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($borders);

	        	        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        	        	        	        	        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        	        	        	        	        //--------------------------------------------***********TERCER HOJA***********************-----------------------------------------
	        	        	        	        	        $this->excel->createSheet();


	        	        	        	        	        		$this->db->select('*');
	        	        	        	        	                $this->db->from('view_hardware_reportes');
	        	        	        	        	                $this->db->where('tipo', 'Conmutador');
	        	        	        	        	                $this->db->or_where('tipo', 'Firewall');
	        	        	        	        	                $this->db->or_where('tipo', 'Router');
	        	        	        	        	                $this->db->or_where('tipo', 'Router Inalambrico');
	        	        	        	        	                $this->db->or_where('tipo', 'Servidor');
	        	        	        	        	                $this->db->or_where('tipo', 'Switch');
	        	        	        	        	                $this->db->having('id_coordinacion ='.$id_coordinacion);

	        	        	        	        	                $queryredes = $this->db->get()->result();


	        	        	        	        	                	  
	        	        	        	        	        			$this->excel->setActiveSheetIndex(2);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setTitle('Redes');

	        	        	        	        	        	        //Logo IMT 
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(2) ->mergeCells('A1:H4');
	        	        	        	        	        	        $objDrawing = new PHPExcel_Worksheet_Drawing();
	        	        	        	        	        	        $objDrawing->setPath('b1.jpg'); //ruta
	        	        	        	        	        	        $objDrawing->setHeight(80); //altura
	        	        	        	        	        	        $objDrawing->setWidth(475);
	        	        	        	        	        	        $objDrawing->setCoordinates('A1');
	        	        	        	        	        	        $objDrawing->setWorksheet($this->excel->getActiveSheet()); //incluir la imagen


	        	        	        	        	        	        //Encabezado de reporte
	        	        	        	        	        	        
	        	        	        	        	        	        //Combinar celdas para el encabezado del reporte
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(2)
	        	        	        	        	        	                ->mergeCells('I1:M4');    
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setBold(true);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue('I1', $tituloReporte);   
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setSize(12);     

	        	        	        	        	        	        //Ecabezados de la tabla
	        	        	        	        	        	        //Contador de filas
	        	        	        	        	        	        $contador = 5;
	        	        	        	        	        	        //Definimos los títulos de la cabecera.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", 'TIPO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", 'MODALIDAD');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", 'MARCA');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", 'MODELO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", 'NO_SERIE');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", 'NO_INVENTARIO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", 'USUARIO_R');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", 'PROVEEDOR');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", 'COORDINACION');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", 'UBICACION');



	        	        	        	        	        	        //Definimos la data del cuerpo.
	        	        	        	        	        	        foreach($queryredes as $l){
	        	        	        	        	        	        	//Incrementamos una fila más, para ir a la siguiente.
	        	        	        	        	        	        	$contador++;
	        	        	        	        	        	        	//Informacion de las filas de la consulta.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->tipo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->modalidad);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->marca);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->modelo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->no_serie);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->no_inventario);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->usuario_r);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->proveedor);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->coordinacion);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->ubicacion);

	        	        	        	        	        	             }

	        	        	        	        	        	        //Tamano de celdas automatico
	        	        	        	        	        	        for ($i = 'A'; $i <= 'M'; $i++) {
	        	        	        	        	        	            $this->excel->setActiveSheetIndex(2)
	        	        	        	        	        	                    ->getColumnDimension($i)->setAutoSize(TRUE);
	        	        	        	        	        	        }
	        	        	        	        	        	        //Estilos
	        	        	        	        	        	        $styleArray = array(
	        	        	        	        	        	            //Letra
	        	        	        	        	        	            'font' => array(
	        	        	        	        	        	                'bold' => true,
	        	        	        	        	        	            ),
	        	        	        	        	        	            //Alineacion letra
	        	        	        	        	        	            'alignment' => array(
	        	        	        	        	        	                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        	        	        	        	        	            ),
	        	        	        	        	        	            'fill' => array(
	        	        	        	        	        	                //Background encabezado
	        	        	        	        	        	                'type' => PHPExcel_Style_Fill::FILL_SOLID,
	        	        	        	        	        	                'rotation' => 90,
	        	        	        	        	        	                'startcolor' => array(
	        	        	        	        	        	                    'argb' => 'A5A5A5',
	        	        	        	        	        	                ),
	        	        	        	        	        	            ),
	        	        	        	        	        	        );
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($styleArray);

	        	        	        	        	        	        $borders = array(
	        	        	        	        	        	            'borders' => array(
	        	        	        	        	        	                'allborders' => array(
	        	        	        	        	        	                    'style' => PHPExcel_Style_Border::BORDER_THIN,
	        	        	        	        	        	                    'color' => array('argb' => 'FF000000'),
	        	        	        	        	        	                )
	        	        	        	        	        	            ),
	        	        	        	        	        	        );

	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($borders);
	        	        	        	        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        	        	        	        	        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        	        	        	        	        //--------------------------------------------***********CUARTA HOJA***********************-----------------------------------------
	        	        	        	        	        $this->excel->createSheet();


	        	        	        	        	        		$this->db->select('*');
	        	        	        	        	                $this->db->from('view_hardware_reportes');
	        	        	        	        	                $this->db->where('tipo', 'UPS');
	        	        	        	        	                $this->db->having('id_coordinacion ='.$id_coordinacion);



	        	        	        	        	                $queryredes = $this->db->get()->result();


	        	        	        	        	                	  
	        	        	        	        	        			$this->excel->setActiveSheetIndex(3);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setTitle('UPS');

	        	        	        	        	        	        //Logo IMT 
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(3) ->mergeCells('A1:H4');
	        	        	        	        	        	        $objDrawing = new PHPExcel_Worksheet_Drawing();
	        	        	        	        	        	        $objDrawing->setPath('b1.jpg'); //ruta
	        	        	        	        	        	        $objDrawing->setHeight(80); //altura
	        	        	        	        	        	        $objDrawing->setWidth(475);
	        	        	        	        	        	        $objDrawing->setCoordinates('A1');
	        	        	        	        	        	        $objDrawing->setWorksheet($this->excel->getActiveSheet()); //incluir la imagen


	        	        	        	        	        	        //Encabezado de reporte
	        	        	        	        	        	        
	        	        	        	        	        	        //Combinar celdas para el encabezado del reporte
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(3)
	        	        	        	        	        	                ->mergeCells('I1:M4');    
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setBold(true);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue('I1', $tituloReporte);   
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setSize(12);     

	        	        	        	        	        	        //Ecabezados de la tabla
	        	        	        	        	        	        //Contador de filas
	        	        	        	        	        	        $contador = 5;
	        	        	        	        	        	        //Definimos los títulos de la cabecera.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", 'TIPO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", 'MODALIDAD');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", 'MARCA');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", 'MODELO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", 'NO_SERIE');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", 'NO_INVENTARIO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", 'USUARIO_R');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", 'PROVEEDOR');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", 'COORDINACION');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", 'UBICACION');



	        	        	        	        	        	        //Definimos la data del cuerpo.
	        	        	        	        	        	        foreach($queryredes as $l){
	        	        	        	        	        	        	//Incrementamos una fila más, para ir a la siguiente.
	        	        	        	        	        	        	$contador++;
	        	        	        	        	        	        	//Informacion de las filas de la consulta.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->tipo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->modalidad);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->marca);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->modelo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->no_serie);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->no_inventario);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->usuario_r);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->proveedor);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->coordinacion);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->ubicacion);

	        	        	        	        	        	             }

	        	        	        	        	        	        //Tamano de celdas automatico
	        	        	        	        	        	        for ($i = 'A'; $i <= 'M'; $i++) {
	        	        	        	        	        	            $this->excel->setActiveSheetIndex(3)
	        	        	        	        	        	                    ->getColumnDimension($i)->setAutoSize(TRUE);
	        	        	        	        	        	        }
	        	        	        	        	        	        //Estilos
	        	        	        	        	        	        $styleArray = array(
	        	        	        	        	        	            //Letra
	        	        	        	        	        	            'font' => array(
	        	        	        	        	        	                'bold' => true,
	        	        	        	        	        	            ),
	        	        	        	        	        	            //Alineacion letra
	        	        	        	        	        	            'alignment' => array(
	        	        	        	        	        	                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        	        	        	        	        	            ),
	        	        	        	        	        	            'fill' => array(
	        	        	        	        	        	                //Background encabezado
	        	        	        	        	        	                'type' => PHPExcel_Style_Fill::FILL_SOLID,
	        	        	        	        	        	                'rotation' => 90,
	        	        	        	        	        	                'startcolor' => array(
	        	        	        	        	        	                    'argb' => 'A5A5A5',
	        	        	        	        	        	                ),
	        	        	        	        	        	            ),
	        	        	        	        	        	        );
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($styleArray);

	        	        	        	        	        	        $borders = array(
	        	        	        	        	        	            'borders' => array(
	        	        	        	        	        	                'allborders' => array(
	        	        	        	        	        	                    'style' => PHPExcel_Style_Border::BORDER_THIN,
	        	        	        	        	        	                    'color' => array('argb' => 'FF000000'),
	        	        	        	        	        	                )
	        	        	        	        	        	            ),
	        	        	        	        	        	        );

	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($borders);
	        	        	        	        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        	        	        	        	        //--------------------------------------------***********QUINTA HOJA***********************-----------------------------------------
	        	        	        	        	        $this->excel->createSheet();


	        	        	        	        	        		$this->db->select('*');
	        	        	        	        	                $this->db->from('view_hardware_reportes');
	        	        	        	        	                $this->db->where('tipo', 'Proyector');
	        	        	        	        	                $this->db->or_where('tipo', 'Equipo de vídeo conferencia');
	        	        	        	        	                $this->db->having('id_coordinacion ='.$id_coordinacion);



	        	        	        	        	                $queryredes = $this->db->get()->result();


	        	        	        	        	                	  
	        	        	        	        	        			$this->excel->setActiveSheetIndex(4);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setTitle('Proyector - Vídeo');

	        	        	        	        	        	        //Logo IMT 
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(4) ->mergeCells('A1:H4');
	        	        	        	        	        	        $objDrawing = new PHPExcel_Worksheet_Drawing();
	        	        	        	        	        	        $objDrawing->setPath('b1.jpg'); //ruta
	        	        	        	        	        	        $objDrawing->setHeight(80); //altura
	        	        	        	        	        	        $objDrawing->setWidth(475);
	        	        	        	        	        	        $objDrawing->setCoordinates('A1');
	        	        	        	        	        	        $objDrawing->setWorksheet($this->excel->getActiveSheet()); //incluir la imagen


	        	        	        	        	        	        //Encabezado de reporte
	        	        	        	        	        	        
	        	        	        	        	        	        //Combinar celdas para el encabezado del reporte
	        	        	        	        	        	        $this->excel->setActiveSheetIndex(4)
	        	        	        	        	        	                ->mergeCells('I1:M4');    
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setBold(true);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue('I1', $tituloReporte);   
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle("I1:M4")->getFont()->setSize(12);     

	        	        	        	        	        	        //Ecabezados de la tabla
	        	        	        	        	        	        //Contador de filas
	        	        	        	        	        	        $contador = 5;
	        	        	        	        	        	        //Definimos los títulos de la cabecera.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", 'TIPO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", 'MODALIDAD');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", 'MARCA');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", 'MODELO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", 'NO_SERIE');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", 'NO_INVENTARIO');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", 'USUARIO_R');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", 'PROVEEDOR');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", 'COORDINACION');
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", 'UBICACION');



	        	        	        	        	        	        //Definimos la data del cuerpo.
	        	        	        	        	        	        foreach($queryredes as $l){
	        	        	        	        	        	        	//Incrementamos una fila más, para ir a la siguiente.
	        	        	        	        	        	        	$contador++;
	        	        	        	        	        	        	//Informacion de las filas de la consulta.
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("A{$contador}", $l->tipo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("B{$contador}", $l->modalidad);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("C{$contador}", $l->marca);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("D{$contador}", $l->modelo);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("E{$contador}", $l->no_serie);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("F{$contador}", $l->no_inventario);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("G{$contador}", $l->usuario_r);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("H{$contador}", $l->proveedor);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("I{$contador}", $l->coordinacion);
	        	        	        	        	        	        $this->excel->getActiveSheet()->setCellValue("J{$contador}", $l->ubicacion);

	        	        	        	        	        	             }

	        	        	        	        	        	        //Tamano de celdas automatico
	        	        	        	        	        	        for ($i = 'A'; $i <= 'M'; $i++) {
	        	        	        	        	        	            $this->excel->setActiveSheetIndex(4)
	        	        	        	        	        	                    ->getColumnDimension($i)->setAutoSize(TRUE);
	        	        	        	        	        	        }
	        	        	        	        	        	        //Estilos
	        	        	        	        	        	        $styleArray = array(
	        	        	        	        	        	            //Letra
	        	        	        	        	        	            'font' => array(
	        	        	        	        	        	                'bold' => true,
	        	        	        	        	        	            ),
	        	        	        	        	        	            //Alineacion letra
	        	        	        	        	        	            'alignment' => array(
	        	        	        	        	        	                'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        	        	        	        	        	            ),
	        	        	        	        	        	            'fill' => array(
	        	        	        	        	        	                //Background encabezado
	        	        	        	        	        	                'type' => PHPExcel_Style_Fill::FILL_SOLID,
	        	        	        	        	        	                'rotation' => 90,
	        	        	        	        	        	                'startcolor' => array(
	        	        	        	        	        	                    'argb' => 'A5A5A5',
	        	        	        	        	        	                ),
	        	        	        	        	        	            ),
	        	        	        	        	        	        );
	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($styleArray);

	        	        	        	        	        	        $borders = array(
	        	        	        	        	        	            'borders' => array(
	        	        	        	        	        	                'allborders' => array(
	        	        	        	        	        	                    'style' => PHPExcel_Style_Border::BORDER_THIN,
	        	        	        	        	        	                    'color' => array('argb' => 'FF000000'),
	        	        	        	        	        	                )
	        	        	        	        	        	            ),
	        	        	        	        	        	        );

	        	        	        	        	        	        $this->excel->getActiveSheet()->getStyle('A5:M5')->applyFromArray($borders);
	        	        	        	        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	        
	        //Le ponemos un nombre al archivo que se va a generar.
			$this->excel->setActiveSheetIndex(0);
	        $archivo = "Reporte Hardware Coordinación {$tituloReporte}.xls";
	        header('Content-Type: application/vnd.ms-excel');
	        header('Content-Disposition: attachment;filename="'.$archivo.'"');
	        header('Cache-Control: max-age=0');
	        $objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5'); 
	        //Hacemos una salida al navegador con el archivo Excel.
	        $objWriter->save('php://output');
        }else{
        	echo 'No existen datos suficientes para generar el reporte';
        	exit;
        }
	}
}