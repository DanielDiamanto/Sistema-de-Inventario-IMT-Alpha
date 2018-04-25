<head>
	<link rel="shortcut icon" type="image/png" href="<?php echo base_url()?>assets/img/IMTLogo.png"/>

</head>
<header>
    <meta charset="utf-8" />
 
<?php 
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

</header>
<body style="background-image: url('<?php echo base_url()?>assets/img/IMTFondo3.png');">
    <div>

<?php 
if ($this->session->userdata('logged_in'))
echo $output; 
else 
	redirect('index.php/verifylogin', 'refresh');
?>
 
    </div>
