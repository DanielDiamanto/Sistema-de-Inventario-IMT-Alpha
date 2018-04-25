<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<link rel="shortcut icon" type="image/png" href="<?php echo base_url()?>assets/img/IMTLogo.png"/>
		
			<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
	
		<title><?php echo $titulo ?></title>
		<?php echo $css ?>
		
		
	</head>
	<body class='<?php echo $body_class ?>'>
			<?php echo $header ?>			
			<?php echo $contenido ?>
			<?php echo $footer ?>
		</body>
		<?php echo $js ?>
	</html>