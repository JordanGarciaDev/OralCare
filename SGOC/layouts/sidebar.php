<?php
session_start();
?>
<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<span class="sidebar-brand-text align-middle">
						..:: S.G.O.C.
						<sup><small class="badge bg-primary text-uppercase">Pro</small></sup>
					</span>
					<svg class="sidebar-brand-icon align-middle" width="32px" height="32px" viewBox="0 0 24 24" fill="none" stroke="#FFFFFF" stroke-width="1.5"
						stroke-linecap="square" stroke-linejoin="miter" color="#FFFFFF" style="margin-left: -3px">
						<path d="M12 4L20 8.00004L12 12L4 8.00004L12 4Z"></path>
						<path d="M20 12L12 16L4 12"></path>
						<path d="M20 16L12 20L4 16"></path>
					</svg>
				</a>
				<div class="sidebar-user">
					<div class="d-flex justify-content-center">
						<div class="flex-shrink-0">
							<img src="<?= ASSET_URL.'/img/avatars/' . $_SESSION['fotousuario'] ?>" alt="<?=$_SESSION['nomusuario'];?>" class="avatar img-fluid rounded me-1" />
						</div>
						<div class="flex-grow-1 ps-2">
							<a class="sidebar-user-title dropdown-toggle" href="#" data-bs-toggle="dropdown">
                                <?=$_SESSION['nomusuario'];?>
							</a>
							<div class="dropdown-menu dropdown-menu-start">
								<a class="dropdown-item" href="<?= BASE_URL .'/vistas/profile.php'; ?>"><i class="align-middle me-1" data-feather="user"></i> Perfil</a>
                                <a class="dropdown-item" href="<?= BASE_URL .'/vistas/cerrar_sesion.php'; ?>">Cerrar sesión</a>
							</div>

							<div class="sidebar-user-subtitle"><?=$_SESSION['nomcargo'];?></div>
						</div>
					</div>
				</div>


				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Selecciona un estándar
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Inicio</span>
            </a>
					</li>

                    <?php
                    // Aquí se validan los permisos para ver cada estándar al perfil que tiene el usuario logueado
                    $perfil_estandar1 = [15,17,2];
                    $perfil_estandar2 = [15,17,2];
                    $perfil_estandar3 = [15,17,2];
                    $perfil_estandar4 = [15,17,2];
                    $perfil_estandar5 = [15,17,2];
                    $perfil_estandar6 = [15,17,2];
                    $perfil_estandar7 = [15,17,2];
                    $perfil_admin = [15, 17, 2];

                    if (in_array($_SESSION['cargo'], $perfil_estandar1)) {
                        ?>

                  <!--estandar 1-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar1" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="briefcase"></i> <span class="align-middle">Estándar 1</span>
                        </a>
                        <ul id="estandar1" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a data-bs-target="#precontratacion" data-bs-toggle="collapse" class="sidebar-link collapsed">
                                    <i class="align-middle" data-feather="briefcase"></i> <span class="align-middle">Precontratación</span>
                                </a>
                                <ul id="precontratacion" class="sidebar-dropdown list-unstyled collapse">
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/empleados.php'; ?>">Datos Del Aspirante</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Entrevista</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Pruebas Técnicas</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Pruebas Psicométrica</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Evaluaciones</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Documentación</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Ofertas de Trabajo</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Contratación</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Contratos Laborales</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Proceso de Inducción</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Aprobaciones</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">Firma Electrónica</a></li>
                                </ul>
                            </li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Contratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Empleados</a></li>
                        </ul>
                    </li>
                     <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar2)) {
                    ?>
                    <!--estandar 2-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar2" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="folder"></i> <span class="align-middle">Estándar 2</span>
                        </a>
                        <ul id="estandar2" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Precontratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Contratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Empleados</a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar3)) {
                    ?>
                    <!--estandar 3-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar3" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="package"></i> <span class="align-middle">Estándar 3</span>
                        </a>
                        <ul id="estandar3" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Precontratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Contratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Empleados</a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar4)) {
                    ?>
                    <!--  estandar4-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar4" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="navigation"></i> <span class="align-middle">Estándar 4</span>
                        </a>
                        <ul id="estandar4" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar5)) {
                    ?>
                    <!--  estandar5-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar5" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 5</span>
                        </a>
                        <ul id="estandar5" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar6)) {
                    ?>
                    <!--  estandar6-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar6" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 6</span>
                        </a>
                        <ul id="estandar6" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_estandar7)) {
                        ?>
                    <!--  estandar7-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar7" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 7</span>
                        </a>
                        <ul id="estandar7" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
                    <?php  } ?>

                    <?php
                    if (in_array($_SESSION['cargo'], $perfil_admin)) {
                        ?>
                        <!--admin-->
                    <li class="sidebar-item">
                    <a data-bs-target="#administrativo" data-bs-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="settings"></i> <span class="align-middle">Administración</span>
                    </a>
                    <ul id="administrativo" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/cargos.php'; ?>">Cargos</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/tipos_identificaciones.php'; ?>">Tipos Identificación</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/tipos_documentos.php'; ?>">Tipos Documentos</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/tiposContratos.php'; ?>">Tipos Contratos</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/preguntas_entrevistas.php'; ?>">Preguntas Entrevistas</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/usuarios.php'; ?>">Usuarios</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/departamentos.php'; ?>">Departamentos</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="#" onclick="realizarRespaldo()">Respaldo BD</a></li>
                    </ul>
                     </li>
                        <?php } ?>
                </ul>

			</div>
		</nav>
<script>
    function realizarRespaldo() {
        if (confirm('¿Estás seguro de que deseas realizar un respaldo de la base de datos?')) {
            fetch('<?= API . 'respaldo_bd.php'; ?>')
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        alert(data.message);  // Mensaje de éxito
                    } else {
                        alert('Error: ' + data.message);  // Mensaje de error
                    }
                })
                .catch(error => {
                    alert('Error al realizar el respaldo: ' + error);
                });
        }
    }
</script>