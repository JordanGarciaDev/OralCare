<?php
session_start();
?>
<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<span class="sidebar-brand-text align-middle">
						AdminKit
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
							<img src="<?= ASSET_URL?>/img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" />
						</div>
						<div class="flex-grow-1 ps-2">
							<a class="sidebar-user-title dropdown-toggle" href="#" data-bs-toggle="dropdown">
								Charles Hall
							</a>
							<div class="dropdown-menu dropdown-menu-start">
								<a class="dropdown-item" href="<?= BASE_URL .'/vistas/profile.php'; ?>"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="pages-settings.html"><i class="align-middle me-1" data-feather="settings"></i> Settings &
									Privacy</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?= BASE_URL .'/vistas/cerrar_sesion.php'; ?>">Log out</a>
							</div>

							<div class="sidebar-user-subtitle">Designer</div>
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
                    //Aqui se validan los permisos para ver cada estandar al perfil que tiene el usuario logueado
                    if($_SESSION['perfil']==15 || $_SESSION['perfil']==1){
                    ?>

                  <!--estandar 1-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar1" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 1</span>
                        </a>
                        <ul id="estandar1" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Precontratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Contratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Empleados</a></li>
                        </ul>
                    </li>

                     <?php
                    }
                    ?>

                    <!--estandar 2-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar2" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 2</span>
                        </a>
                        <ul id="estandar2" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Precontratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Contratación</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Empleados</a></li>
                        </ul>
                    </li>

                    <!--  estandar4-->
                    <li class="sidebar-item">
                        <a data-bs-target="#estandar4" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 4</span>
                        </a>
                        <ul id="estandar4" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-settings.html">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-clients.html">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="pages-orders.html">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
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
                        </ul>
                    </li>
                </ul>

			</div>
		</nav>