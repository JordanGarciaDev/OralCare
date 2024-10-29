<?php
include('../app/config.php');
$titulo = "Pruebas Técnicas"; // Título específico para esta vista
?>

<div class="container-fluid p-0">
    <div class="mb-3">
        <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i><?=$titulo;?></h1>
        <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalPruebaTecnica"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Crea/Edita/Elimina las <?=$titulo;?></h5>
                </div>
                <div class="card-body">
                    <table id="datosTablaPruebaTecnica" class="table table-striped" style="width:100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del empleado</th>
                            <th>Pregunta</th>
                            <th>Fecha</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del empleado</th>
                            <th>Pregunta</th>
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
    <div class="modal fade" id="modalPruebaTecnica" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nueva Entrevista</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formPruebaTecnica">
                        <input type="hidden" id="id" name="id">
                        <div class="mb-3">
                            <label for="emp_id" class="form-label">Empleado</label>
                            <select class="form-select" id="emp_id" name="emp_id" required="">
                                <option value="">Seleccione un empleado</option>
                            </select>
                        </div>
                        <span id="tpregunta"></span>
                        <span id="pregunta"></span>

                        <div class="mb-3 col-md-12">
                            <div id="preguntasContainer">
                                <!-- Las preguntas se llenarán aquí -->
                            </div>
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

<script>
    $(document).ready(function() {

        function llenarSelectsPruebaTecnica(tipoPreguntaID = '') {
            // Llenar el select de empleados
            $.ajax({
                url: '<?= API ?>pruebas_tecnicas.php?action=empleados',
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
            // Llenar las preguntas y respuestas
            $.ajax({
                url: '<?= API ?>pruebas_tecnicas.php?action=questions',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    var preguntasContainer = $('#preguntasContainer');
                    preguntasContainer.empty();

                    // Llenar con los datos de la API
                    $.each(data.data, function(index, item) {
                        // Crear el encabezado para el tipo de pregunta
                        var tipoPreguntaInput = '<h5>' + item.tipo + '</h5>';

                        // Mostrar la pregunta como texto y agregar un input oculto para enviarla al servidor
                        var preguntaTexto = '<div class="mb-2"><h4>' + item.pregunta + '</h4></div>';
                        var preguntaInputHidden = '<input type="hidden" id="pregunta' + item.idPreg + '" name="pregunta" value="' + item.idPreg + '">';

                        // Crear el textarea para la respuesta a la pregunta
                        var preguntaTextarea = '<textarea class="form-control mb-3" id="respuesta' + item.idPreg + '" name="respuesta" rows="3" placeholder="Escribe la respuesta aquí"></textarea>';

                        // Agregar los elementos al contenedor
                        preguntasContainer.append(tipoPreguntaInput + preguntaTexto + preguntaInputHidden + preguntaTextarea);
                    });
                },
                error: function() {
                    console.error("Error al cargar los datos de tipo de pregunta.");
                }
            });
        }

        llenarSelectsPruebaTecnica();

        var table = $('#datosTablaPruebaTecnica').DataTable({
            "ajax": "<?= API ?>pruebas_tecnicas.php?action=fetch",
            "columns": [
                { "data": "idPrueba" },
                { "data": "nombre_completo" },
                { "data": "pregunta" },
                { "data": "fechareg" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                        <button class="btn btn-sm btn-warning edit" data-id="` + data.idPrueba + `"><i class="align-middle me-2 fas fa-fw fa-edit"></i>Editar</button>
                        <button class="btn btn-sm btn-danger delete" data-id="` + data.idPrueba + `"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i>Eliminar</button>
                    `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            }
        });

        // Agregar o editar entrevista
        $('#formPruebaTecnica').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?>pruebas_tecnicas.php?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modalPruebaTecnica').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nueva Prueba Técnica');
            $('#formPruebaTecnica')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#datosTablaPruebaTecnica tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Prueba Técnica');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>pruebas_tecnicas.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function(entrevista) {
                    $('#id').val(entrevista.id);
                    $('#nombre').val(entrevista.nombre);
                    $('#modalPruebaTecnica').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del entrevista.');
                }
            });
        });

        // Eliminar
        $('#datosTablaPruebaTecnica tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este entrevista?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>pruebas_tecnicas.php?action=delete&id=' + id,
                    type: 'GET',
                    success: function(response) {
                        table.ajax.reload();
                    }
                });
            }
        });
    });
</script>