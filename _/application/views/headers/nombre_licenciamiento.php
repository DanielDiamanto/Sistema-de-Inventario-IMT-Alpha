<?php
        $url = $_SERVER['REQUEST_URI'];
        $url = parse_url($url, PHP_URL_QUERY);
        $this->db->select('id_licencia,, id_software, nombre_software, version, referencia');
        $this->db->from('view_licencias_software');
        $this->db->where('id_licencia', $url);
        $nombre_licencia = $this->db->get()->result();
        foreach ($nombre_licencia as $row)
            {

               $id_licencia = $row->id_licencia;
               $nombre = $row->nombre_software;
               $version =$row->version;
               $referencia =$row->referencia;
            };

?>
<!--
<div class="page-header">
  <h1>Agregando Licencia <?php echo $nombre.' '.$version ?></h1>
</div>
-->
<?php
//if ($url) {
//  echo '
//  <div class="alert alert-info" style="font-size: large; text-align:center;">
//  Agregando Contratación a la <strong> Licencia:  
//    '.$id_licencia.' Software: '.$nombre.' '.$version.'
//    </strong>
//  </div>';
//};
?>

<?php
if ($url) {
  echo '
  <div class="alert alert-info" style="font-size: large; text-align:center;">
   Contratación</br>Nombre del Software: '.$nombre.' </br>Versión: '.$version.'</br>Referencia: '.$referencia.'
    </strong>
  </div>';
};
?>

