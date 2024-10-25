<?php
include('../app/config.php');
$titulo = "Usuarios"; // Título específico para esta vista
include(LAYOUT . '/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT . '/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT . '/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-users"></i>Gestión de Usuarios</h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalUsuario"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina Usuarios</h5>
                            </div>
                            <div class="card-body">
                                <table id="usuariosTable" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Usuario</th>
                                        <th>Cargo</th>
                                        <th>Foto</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Usuario</th>
                                        <th>Cargo</th>
                                        <th>Foto</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar/editar -->
                <div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nuevo Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formUsuario" enctype="multipart/form-data">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="nombres" class="form-label">Nombres</label>
                                        <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Escriba los nombres" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="apellidos" class="form-label">Apellidos</label>
                                        <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Escriba los apellidos" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="usuario" class="form-label">Usuario</label>
                                        <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Escriba el nombre de usuario" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="pass" class="form-label">Contraseña</label>
                                        <input type="password" class="form-control" id="pass" name="pass" placeholder="Escriba la contraseña">
                                    </div>
                                    <div class="mb-3">
                                        <label for="cargo_id" class="form-label">Cargo</label>
                                        <select class="form-select" id="cargo_id" name="cargo_id" required>
                                            <!-- Cargar los cargos desde la base de datos -->
                                            <?php
                                            $query = "SELECT id, nombre FROM cargos";
                                            $result = $conn->query($query);
                                            while ($row = $result->fetch_assoc()) {
                                                echo '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="foto" class="form-label">Foto</label>
                                        <input type="file" class="form-control" id="foto" name="foto" accept="image/*">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="align-middle me-2 fas fa-fw fa-minus"></i>Cancelar</button>
                                        <button type="submit" class="btn btn-primary"><i class="align-middle me-2 fas fa-fw fa-save"></i>Guardar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fin del modal -->
            </div>
        </main>
    </div>
</div>

<script>
    $(document).ready(function() {
        var table = $('#usuariosTable').DataTable({
            "ajax": "<?= API ?>usuarios.php?action=fetch",
            "columns": [
                { "data": "id" },
                { "data": "nombres" },
                { "data": "apellidos" },
                { "data": "usuario" },
                { "data": "cargo_nombre" },
                {
                    "data": "foto",
                    "render": function(data) {
                        return data ? `<img src='<?= ASSET_URL ?>/img/avatars/${data}' alt='Foto' width='50'>` : 'Sin foto';
                    }
                },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                            <button class="btn btn-sm btn-warning edit" data-id="` + data.id + `"><i class="align-middle me-2 fas fa-fw fa-edit"></i>Editar</button>
                            <button class="btn btn-sm btn-danger delete" data-id="` + data.id + `"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i>Eliminar</button>
                        `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            }
        });

        // Abrir el modal para agregar nuevo
        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nuevo Usuario');
            $('#formUsuario')[0].reset();
            $('#id').val('');
        });

        // Agregar o editar usuario
        $('#formUsuario').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                url: '<?= API ?>usuarios.php?action=save',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    $('#modalUsuario').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        // Editar
        $('#usuariosTable tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Usuario');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>usuarios.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function(usuario) {
                    $('#id').val(usuario.id);
                    $('#nombres').val(usuario.nombres);
                    $('#apellidos').val(usuario.apellidos);
                    $('#usuario').val(usuario.usuario);
                    $('#cargo_id').val(usuario.cargo_id); // Asigna el cargo
                    $('#modalUsuario').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del usuario.');
                }
            });
        });

        // Eliminar
        $('#usuariosTable tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este usuario?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>usuarios.php?action=delete&id=' + id,
                    type: 'GET',
                    success: function(response) {
                        table.ajax.reload();
                    }
                });
            }
        });
    });
</script>

<?php
include(LAYOUT . '/footer.php');
?>
