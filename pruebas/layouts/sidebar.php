<?php
session_start();
?>
<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<span class="sidebar-brand-text align-middle">
						Clinícas Oral Care
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
						Selecciona una opción
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Inicio</span>
            </a>
					</li>


                  <!--estandar 1-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar1" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="clock"></i> <span class="align-middle">Comenzar Pruebas</span>
                        </a>
                                <ul id="estandar1" class="sidebar-dropdown list-unstyled collapse">
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/entrevistas.php'; ?>">Entrevistas</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/pruebas_tecnicas.php'; ?>">Pruebas Técnicas</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/pruebas_tecnicas.php'; ?>">Pruebas Psicométrica</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/evaluaciones.php'; ?>">Evaluaciones</a></li>
                                    <li class="sidebar-item"><a class="sidebar-link" href="<?= BASE_URL .'/vistas/documentos.php'; ?>">Documentos</a></li>
                                </ul>
                    </li>

                </ul>

			</div>
		</nav>