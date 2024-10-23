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

                <?php
                //Aqui se validan los permisos para ver cada menu de acuerdo al perfil que tiene el usuario logueado
                if($_SESSION['perfil']==0 || $_SESSION['perfil']==1){
                ?>
				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Selecciona un estándar
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="<?= BASE_URL .'/vistas/dashboard.php'; ?>">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
            </a>
					</li>

<!--                    inicio del primer menu-->
					<li class="sidebar-item">
						<a data-bs-target="#estandar1" data-bs-toggle="collapse" class="sidebar-link collapsed">
							<i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 1</span>
						</a>
						<ul id="estandar1" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
							<li class="sidebar-item"><a class="sidebar-link" href="#">Settings</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#">Clients <span
										class="sidebar-badge badge bg-primary">Pro</span></a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#">Orders <span
										class="sidebar-badge badge bg-primary">Pro</span></a></li>
						</ul>
					</li>
 <!--                    fin del primer menu-->

                    <!-- estandar 2 = perfil de secretaria-->

                    <li class="sidebar-item">
                        <a data-bs-target="#estandar2" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 2</span>
                        </a>
                        <ul id="estandar2" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>

                    <!-- estandar 3 = perfil de auxiliar-->

                    <li class="sidebar-item">
                        <a data-bs-target="#estandar3" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Estándar 3</span>
                        </a>
                        <ul id="estandar3" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Settings</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Clients <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="#">Orders <span
                                            class="sidebar-badge badge bg-primary">Pro</span></a></li>
                        </ul>
                    </li>
                </ul>
                <?php
                }
                ?>
			</div>
		</nav>