<?php
	include('../app/config.php');
    $titulo = "Perfil"; // Título específico para esta vista
    include(LAYOUT.'/header.php');
?>
			<div class="wrapper">
			<?php include(LAYOUT .'/sidebar.php');?>

			<div class="main">
			<?php include(LAYOUT .'/navbar.php');?>
			
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">Perfil</h1>

					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Detalles de perfil</h5>
								</div>
								<div class="card-body text-center">
                                    <img id="perfilFoto" src="<?= ASSET_URL.'/img/avatars/' . $_SESSION['fotousuario'] ?>" alt="<?=$_SESSION['nomusuario'];?>" class="img-fluid rounded-circle mb-2" width="200" height="200" />
									<h5 class="card-title mb-0"><?=$_SESSION['nomusuario'];?></h5>
									<div class="text-muted mb-2"><?=$_SESSION['nomcargo'];?></div>

									<div>
                                        <a class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editUserModal"><span data-feather="message-square"></span> Editar Perfil</a>

                                    </div>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Registrado desde <span class="badge bg-primary me-1 my-1"><?=$_SESSION['fecharegusuario'];?></span></h5>
								</div>
								<hr class="my-0" />
							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">

									<h5 class="card-title mb-0">Actividad</h5>
								</div>
								<div class="card-body h-100">

									<div class="d-flex align-items-start">
										<img src="<?= ASSET_URL.'/img' ?>/avatars/avatar-5.jpg" width="36" height="36" class="rounded-circle me-2" alt="Jaime Borja">
										<div class="flex-grow-1">
											<small class="float-end text-navy">5m ago</small>
											<strong>Jaime Borja</strong> realizó la contratación de <strong><?=$_SESSION['nomusuario'];?></strong><br />
											<small class="text-muted">Hoy 5:51 pm</small><br />

										</div>
									</div>
									<hr />
									<div class="d-grid">
										<a href="#" class="btn btn-primary">Cargar más</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

    <!-- Modal para editar usuario -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Editar Perfil</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" enctype="multipart/form-data">
                        <!-- Campos de texto existentes -->
                        <div class="mb-3">
                            <label for="nombres" class="form-label">Nombres</label>
                            <input type="text" class="form-control" id="nombres" name="nombres">
                        </div>
                        <div class="mb-3">
                            <label for="apellidos" class="form-label">Apellidos</label>
                            <input type="text" class="form-control" id="apellidos" name="apellidos">
                        </div>
                        <div class="mb-3">
                            <label for="usuario" class="form-label">Usuario</label>
                            <input type="text" class="form-control" id="usuario" name="usuario" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="cargo" class="form-label">Cargo</label>
                            <input type="text" class="form-control" id="cargo" name="cargo" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="pass" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="pass" name="pass" placeholder="Nueva contraseña (dejar vacío si no desea cambiarla)">
                        </div>

                        <!-- Campo para cargar la foto de perfil -->
                        <div class="mb-3">
                            <label for="foto" class="form-label">Foto de perfil</label>
                            <input type="file" class="form-control" id="foto" name="foto" accept="image/*">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="actualizarDatosBtn">Actualizar datos</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            // Cargar datos del usuario cuando se abre el modal
            $('#editUserModal').on('show.bs.modal', function (e) {
                $.ajax({
                    url: '<?= API ?>getUsuarios.php',  // Archivo PHP que obtiene los datos del usuario
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.error) {
                            alert(response.error);
                        } else {
                            // Llenar los campos del modal con los datos del usuario
                            $('#nombres').val(response.nombres);
                            $('#apellidos').val(response.apellidos);
                            $('#usuario').val(response.usuario);
                            $('#cargo').val(response.cargo);
                            $('#pass').val('');
                            // Establecer la foto de perfil actual en el modal
                            $('#perfilFotoModal').attr('src', '<?= UPLOAD ?>/perfiles/' + (response.foto || 'default.png'));
                        }
                    },
                    error: function(xhr) {
                        alert("Error al cargar los datos del usuario.");
                    }
                });
            });

            // Actualizar los datos del usuario, incluyendo la foto de perfil
            $('#actualizarDatosBtn').click(function(){
                var formData = new FormData($('#editUserForm')[0]); // Crear un objeto FormData con los datos del formulario

                $.ajax({
                    url: '<?= API ?>actualizarPerfil.php', // Archivo PHP que actualiza los datos
                    type: 'POST',
                    data: formData,
                    contentType: false, // Necesario para enviar archivos
                    processData: false, // Necesario para no procesar los datos del formulario
                    success: function(response) {
                        try {
                            var jsonResponse = JSON.parse(response);
                            if (jsonResponse.message) {
                                alert(jsonResponse.message); // Mostrar mensaje de éxito

                                // Actualizar la imagen de perfil
                                var nuevaFoto = jsonResponse.foto ? jsonResponse.foto : "default.png"; // Si no hay nueva foto, usar la default
                                $('#perfilFoto').attr('src', '<?= UPLOAD ?>/perfiles/' + nuevaFoto + '?' + new Date().getTime()); // Añadir un parámetro para evitar caché
                                // También actualizar la imagen en el modal
                                $('#perfilFotoModal').attr('src', '<?= UPLOAD ?>/perfiles/' + nuevaFoto + '?' + new Date().getTime());
                            } else if (jsonResponse.error) {
                                alert(jsonResponse.error); // Mostrar mensaje de error
                            }
                        } catch (e) {
                            alert("Error en la respuesta del servidor: " + response);
                        }
                        $('#editUserModal').modal('hide');
                    },
                    error: function(xhr) {
                        alert("Error al actualizar los datos.");
                    }
                });
            });

        });
    </script>
<?php
 include(LAYOUT.'/footer.php');
 ?>