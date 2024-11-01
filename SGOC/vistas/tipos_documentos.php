<?php
include('../app/config.php');
$titulo = "Parametrización de Tipos de Documentos"; // Título específico para esta vista
include(LAYOUT.'/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT .'/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT .'/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-file-alt"></i><?=$titulo;?></h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalTipoDocumento"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina los Tipos de Documentos</h5>
                            </div>
                            <div class="card-body">
                                <table id="tiposDocumentosTable" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para agregar/editar -->
                <div class="modal fade" id="modalTipoDocumento" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-file"></i>Nuevo Tipo de Documento</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formTipoDocumento">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre del Tipo de Documento</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Escriba el nombre del tipo de documento" required>
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
        var table = $('#tiposDocumentosTable').DataTable({
            "ajax": "<?= API ?>tipos_de_documentos.php?action=fetch",
            "columns": [
                { "data": "id" },
                { "data": "nombre" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                            <button class="btn btn-sm btn-success edit" data-id="` + data.id + `"><i class="align-middle fas fa-fw fa-edit"></i>Editar</button>
                            <button class="btn btn-sm btn-danger delete" data-id="` + data.id + `"><i class="align-middle fas fa-fw fa-trash-alt"></i></button>
                        `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            },
            "order": [[ 1, "asc" ]]
        });

        // Agregar o editar tipo de documento
        $('#formTipoDocumento').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?>tipos_de_documentos.php?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modalTipoDocumento').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nuevo Tipo de Documento');
            $('#formTipoDocumento')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#tiposDocumentosTable tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Tipo de Documento');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>tipos_de_documentos.php?action=edit&id=' + id,
                type: 'GET',
                success: function(data) {
                    // Verifica que la respuesta sea válida
                    if (typeof data === 'object') {
                        $('#id').val(data.id);
                        $('#nombre').val(data.nombre);
                        $('#modalTipoDocumento').modal('show');
                    } else {
                        console.error("Respuesta no es un objeto JSON:", data);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", error);
                }
            });
        });

        // Eliminar
        $('#tiposDocumentosTable tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este tipo de documento?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>tipos_de_documentos.php?action=delete&id=' + id,
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
