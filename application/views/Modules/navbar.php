<?php
defined('BASEPATH') or exit('No direct script access allowed');
?>
<div class="navbar navbar-default" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a href="<?= base_url(); ?>">
			<span class="navbar-brand" style="padding-left: 0px; display:flex ;">
				<img src="<?= base_url('Public'); ?>/images/logo/rocket.svg" style="width: 30px; margin-right: 5px;"
					alt="Logo de Cobranza Imagen" />
				Cobranza - Casa Software
			</span>
		</a>
	</div>

	<div class="navbar-collapse collapse" id="navbar-collapse-1" style="height: 1px;">
		<ul id="main-menu" class="nav navbar-nav navbar-right">
			<li class="dropdown hidden-xs">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span>
					<?= $this->session->userdata('Nombre'); ?>&nbsp; <i class="fa fa-caret-down"></i>
				</a>

				<ul class="dropdown-menu">
					<li style="border-bottom:0px solid;">
						<div style="border:none;width:100px;height:100px;text-align:center;margin:0px auto 5px;">
							<?php
							$subdominio = $this->config->item('subdominio');
							$subdominio_folder = $this->config->item('subdominio_folder');
							$foto = dirname(FCPATH) . "/" . $subdominio_folder . "/Public/images/perfiles/" . $this->session->userdata('Usuario') . ".jpg";

							if (file_exists($foto) == FALSE) {
								$foto =  base_url('Public') . "/images/perfiles/user.jpg";
							} else {
								$foto =  base_url('Public') . "/images/perfiles/" . $this->session->userdata('Usuario') . ".jpg";
							}
							?>
							<img src="<?= $foto; ?>" style="width:100%;height:100%;" alt="" />
						</div>
					</li>
					<li class="divider"></li>
					<li style="display: none;"><a
							href="<?= base_url('Mantenimiento/Usuarios/Ver/' . $this->session->userdata('Codigo') . '/'); ?>">Mi
							Cuenta</a></li>
					<li><a
							href="<?= base_url('Mantenimiento/Usuarios/CambiarPass/' . $this->session->userdata('Codigo') . '/'); ?>">Cambio
							de Contraseña</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" class="cerrarSesion" href="<?= base_url('Login/signOut/'); ?>">Cerrar Sesión</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>