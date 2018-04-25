<?php
        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        $this->db->select('nombre_software');
        $this->db->from('software');
        $this->db->where('id_software', $url);
        $nombre_software = $this->db->get()->result();
        foreach ($nombre_software as $row)
            {
               $nombre = $row->nombre_software;
               
            };

?>
<!--
<div class="page-header">
  <h1>Agregando Licencia <?php echo $nombre.' '.$version ?></h1>
</div>
-->
<?php
if ($url) {
  echo '
  <div class="alert alert-info" style="font-size: large;">
  Agregando Licencia<strong> 
    '.$nombre.' 
    </strong>
  </div>';
};
?>



