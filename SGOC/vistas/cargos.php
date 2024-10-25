<?php
include('../app/config.php');
$titulo = "Parametrización de Cargos"; // Título específico para esta vista
include(LAYOUT.'/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT .'/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT .'/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i>Parametrización de Cargos</h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalCargo"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina los Cargos</h5>
                            </div>
                            <div class="card-body">
                                <table id="cargosTable" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Departamento</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Departamento</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar/editar -->
                <div class="modal fade" id="modalCargo" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nuevo Cargo</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formCargo">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre del Cargo</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Escriba el nombre del cargo" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="depto_id" class="form-label">Departamento</label>
                                        <select class="form-select" id="depto_id" name="depto_id" required>
                                            <option value="">Seleccione un departamento</option>
                                            <?php
                                            // Obtener los departamentos de la tabla dep_contratacion
                                            $query = "SELECT id, nombre FROM dep_contratacion";
                                            $result = mysqli_query($conn, $query);
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                echo '<option value="'.$row['id'].'">'.$row['nombre'].'</option>';
                                            }
                                            ?>
                                        </select>
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
        var table = $('#cargosTable').DataTable({
            "ajax": "<?= API ?>cargos.php?action=fetch",
            "columns": [
                { "data": "id" },
                { "data": "nombre" },
                { "data": "depto_nombre" }, // Asegúrate de que el backend devuelva el nombre del departamento
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

        // Agregar o editar cargo
        $('#formCargo').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?>cargos.php?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modalCargo').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nuevo Cargo');
            $('#formCargo')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#cargosTable tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Cargo');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>cargos.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json', // Asegúrate de especificar el tipo de datos
                success: function(cargo) {
                    $('#id').val(cargo.id);
                    $('#nombre').val(cargo.nombre);
                    $('#depto_id').val(cargo.depto_id); // Asegúrate de que esto coincida con el campo del objeto
                    $('#modalCargo').modal('show'); // Muestra el modal
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del cargo.');
                }
            });
        });

        // Eliminar
        $('#cargosTable tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este cargo?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>cargos.php?action=delete&id=' + id,
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
include(LAYOUT.'/footer.php');
?>
