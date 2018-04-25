<?php 

/**
 * 
 */
 class Layout
 {
 	
	private $instancia;
	private $layout_view;
	private $titulo = '';
	private $body_class = '';
	private $nav_position ='';
	private $header = '';
	private $footer = '';
	private $contenido;
	private $lista_css = array();
	private $lista_js = array();

	public 	function __construct()
	{
		$this->instancia =& get_instance();
		$this->layout_view = 'template/layout';
		$this->body_class = '';
		$this->titulo = 'Desarrollado por Daniel Guzmán';
		$this->header = $this->instancia->load->view('general/header.php', null, TRUE);
		$this->footer = $this->instancia->load->view('general/footer.php', null, TRUE);
		
		if (isset($this->instancia->layout_view)) {
			$this->layout_view = $this->instancia->layout_view;
		}
	}

	function view($view, $data = null, $return = false)
	{
		//MUESTRA VISTA
		$data['contenido'] = $this->instancia->load->view($view, $data, TRUE);
		$data['body_class'] = $this->body_class;
		$data['nav_position'] = $this->nav_position;
		$data['titulo'] = $this->titulo;
		$data['header'] = $this->header;
		$data['footer'] = $this->footer;
		
		//RECURSOS	
		//lista_js obtiene los nombres del controlador y los iguala a $v, en la linea de abajo indica que "%s" se remplaza con el valor de $v
		$data['js'] = '';
		foreach ($this->lista_js as $v) 
			$data['js'].=sprintf('<script type="text/javascript" src='.base_url().'%s></script>
				', $v);

		$data['css'] = '';
		foreach ($this->lista_css as $v) 
			$data['css'].=sprintf('<link rel="stylesheet" href='.base_url().'%s />
				', $v);

		$output = $this->instancia->load->view($this->layout_view, $data, FALSE);

		return $output;

	}

	function add_js($value)
	{
		array_push($this->lista_js, $value);
	}

	function add_css($value)
	{
		array_push($this->lista_css, $value);
	}

	public function getBody_class()
    {
        return $this->body_class;
    }

    public function setBody_class($body_class)
    {
        $this->body_class = $body_class;

        return $this;
    }

    public function getNav_position()
    {
        return $this->nav_position;
    }

    public function setNav_position($nav_position)
    {
        $this->body_class = $nav_position;

        return $this;
    }


    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * Sets the value of titulo.
     *
     * @param mixed $titulo the titulo
     *
     * @return self
     */
    public function setTitulo($titulo)
    {
        $this->titulo = $titulo;

        return $this;
    }

} 


 ?>