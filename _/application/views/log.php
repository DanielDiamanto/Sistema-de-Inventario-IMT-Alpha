


<div class="wrapper">
		<div class="header header-filter" style="background-image: url('<?php base_url()?>../assets//img/IMTFondo.png'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<?php echo form_open('index.php/verifylogin'); ?>
								<!--<div class="header header-primary text-center" style="background: linear-gradient(60deg, #9f7cd6, #0c2c86);">-->
								<div class="header header-primary text-center" style="background: linear-gradient(180deg, cornflowerblue, darkslateblue);">
								
									<img src='<?php base_url()?>../assets//img/IMTLogo4.png' >
									<h3 style="margin-top:  0;">Iniciar Sesión</h3>
								</div>
								<div class="content">
									<div class="content" style="text-align:center; color:red;">
										<?php echo validation_errors(); ?>
									</div>
									
									
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">face</i>
										</span>
										<div class="form-group is-empty"><input type="text" class="form-control" id="username" name="username" placeholder="Nombre de usuario..." required><span class="material-input"></span></div>
									</div>
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">lock_outline</i>
										</span>
										<div class="form-group is-empty"><input type="password" id="passowrd" name="password" placeholder="Contraseña..." class="form-control" required><span class="material-input"></span></div>
									</div>
								</div>
								<div class="footer text-center">
									<a href="" class="btn btn-primary btn-wd btn-lg">
										<input type="submit" value="Iniciar" class="btn btn-info btn-wd btn-lg">
									</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			

		</div>

    </div>
	