<?php
include('../app/config.php');
$titulo = "Documentos"; // Título específico para esta vista
$titulo2 = "Documentos"; // Escribir el Título asi tal cual primera letra en mayusculas
$urlAPI = "documentos.php"; // Escribir el Título asi tal cual primera letra en mayusculas
$btnModal = "addDocumento"; // Escribir el Título de la vista Ejemplo: addEmpleado
$LabelModal = "modalLabelDocumento"; // Escribir el Título de la vista Ejemplo: modalLabelDocumentoVista
$preguntasContainer = "preguntasDContainer"; // Escribir las primeras 2 iniciales de la vista en medio de preguntas_Container
?>

<div class="container-fluid p-0">
    <div class="mb-3">
        <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i><?=$titulo;?></h1>
        <button class="btn btn-primary float-end" id="<?=$btnModal;?>" data-bs-toggle="modal" data-bs-target="#modal<?=$titulo2;?>"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Crea/Edita/Elimina los <?=$titulo;?></h5>
                </div>
                <div class="card-body">
                    <table id="datosTabla<?=$titulo2;?>" class="table table-striped" style="width:100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del empleado</th>
                            <th>Documento</th>
                            <th>Fecha</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del empleado</th>
                            <th>Documento</th>
                            <th>Fecha</th>
                            <th>Acciones</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para agregar/editar -->
    <div class="modal fade" id="modal<?=$titulo2;?>" tabindex="-1" aria-labelledby="<?=$LabelModal;?>" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="<?=$LabelModal;?>"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nuevos Documentos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="form<?=$titulo2;?>">
                        <input type="hidden" id="id" name="id">
                        <!--                    AQUI SE AGREGAN TODOS LOS INPUTS, SELECTS, TABLAS, ETC QUE QUEREMOS MOSTRAR AL USUARIO FINAL-->

                        <div class="mb-3">
                            <label for="emp_id" class="form-label">Empleado</label>
                            <select class="form-select" id="emp_id" name="emp_id" required="">
                                <option value="">Seleccione un empleado</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Cargar archivo</label>
                            <input class="form-control" type="file" name="archivo">
                        </div>
                        
                        <!--                    AQUI FINALIZA TODOS LOS INPUTS, SELECTS, TABLAS, ETC QUE QUEREMOS MOSTRAR AL USUARIO FINAL-->
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

<script>
    $(document).ready(function() {

        function llenarSelects<?=$titulo2;?>(tipoPreguntaID = '') {
            // Llenar el select de empleados
            $.ajax({
                url: '<?= API ?><?=$urlAPI;?>?action=empleados',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    var empleadoSelect = $('#emp_id');
                    empleadoSelect.empty(); // Limpiar opciones previas

                    // Agregar la opción por defecto
                    empleadoSelect.append('<option value="">Seleccione un empleado</option>');

                    // Llenar el select con los datos de empleados de la API
                    $.each(data.data, function(index, empleado) {
                        empleadoSelect.append('<option value="' + empleado.id + '">' + empleado.nombre_completo + '</option>');
                    });
                },
                error: function() {
                    console.error("Error al cargar los empleados.");
                }
            });
        }

        llenarSelects<?=$titulo2;?>();

        var table = $('#datosTabla<?=$titulo2;?>').DataTable({
            "ajax": "<?= API ?><?=$urlAPI;?>?action=fetch",
            "columns": [
                { "data": "idPrueba" },
                { "data": "nombre_completo" },
                { "data": "pregunta" },
                { "data": "fechareg" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                        <button class="btn btn-sm btn-success edit" data-id="` + data.idPrueba + `"><i class="align-middle fas fa-fw fa-edit"></i>Editar</button>
                        <button class="btn btn-sm btn-danger delete" data-id="` + data.idPrueba + `"><i class="align-middle fas fa-fw fa-trash-alt"></i></button>
                    `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            }
        });

        // Agregar o editar entrevista
        $('#form<?=$titulo2;?>').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?><?=$urlAPI;?>?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modal<?=$titulo2;?>').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#<?=$btnModal;?>').on('click', function() {
            $('#<?=$LabelModal;?>').text('Nuevos <?=$titulo;?>');
            $('#form<?=$titulo2;?>')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#datosTabla<?=$titulo2;?> tbody').on('click', '.edit', function() {
            $('#<?=$LabelModal;?>').text('Editar <?=$titulo;?>');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?><?=$urlAPI;?>?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function(entrevista) {
                    $('#id').val(entrevista.id);
                    $('#nombre').val(entrevista.nombre);
                    $('#modal<?=$titulo2;?>').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del entrevista.');
                }
            });
        });

        // Eliminar
        $('#datosTabla<?=$titulo2;?> tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este <?=$titulo;?>?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?><?=$urlAPI;?>?action=delete&id=' + id,
                    type: 'GET',
                    success: function(response) {
                        table.ajax.reload();
                    }
                });
            }
        });
    });
</script>