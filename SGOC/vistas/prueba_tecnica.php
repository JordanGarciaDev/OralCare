<?php
include('../app/config.php');
$titulo = "Prueba Técnica"; // Título específico para esta vista
include(LAYOUT.'/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT .'/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT .'/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i>Prueba Técnica</h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalCRUD"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina las Prueba Técnica</h5>
                            </div>
                            <div class="card-body">
                                <table id="datosTabla" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del empleado</th>
                                        <th>Resultado</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del empleado</th>
                                        <th>Resultado</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar/editar -->
                <div class="modal fade" id="modalCRUD" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nueva Prueba</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formDatosCrud">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre del Entrevistado(a)</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Escriba el nombre del entrevistado(a)" required>
                                    </div>
                                        <h3>Preguntas de Prueba</h3>
                                        <div id="preguntasContainer">
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
        var table = $('#datosTabla').DataTable({
            "ajax": "<?= API ?>prueba_tecnica.php?action=fetch",
            "columns": [
                { "data": "id" },
                { "data": "nombre" },
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

        // Agregar o editar entrevista
        $('#formDatosCrud').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?>prueba_tecnica.php?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modalCRUD').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nueva Prueba');
            $('#formDatosCrud')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#datosTabla tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Prueba');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>prueba_tecnica.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function(entrevista) {
                    $('#id').val(entrevista.id);
                    $('#nombre').val(entrevista.nombre);
                    $('#modalCRUD').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del entrevista.');
                }
            });
        });

        // Eliminar
        $('#datosTabla tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar esta prueba tecnica?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>prueba_tecnica.php?action=delete&id=' + id,
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