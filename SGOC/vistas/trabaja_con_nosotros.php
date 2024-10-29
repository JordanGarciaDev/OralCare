<?php
include('../app/config.php');
$titulo = "Entrevistas"; // Título específico para esta vista
include(LAYOUT . '/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT . '/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT . '/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i><?=$titulo;?></h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalCRUD"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina las <?=$titulo;?></h5>
                            </div>
                            <div class="card-body">
                                <table id="datosTablaEntrevistas" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del empleado</th>
                                        <th>Fecha</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del empleado</th>
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
                <div class="modal fade" id="modalCRUD" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="modalEmpleadoLabel">Datos del Empleado</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Datos Básicos</h5>
                <h6 class="card-subtitle text-muted">Complete los datos personales del empleado</h6>
            </div>
            <div class="card-body">
                <form id="empleadoForm">
                    <input type="hidden" id="empleadoId" name="empleadoId">

                    <!-- Sección 1 -->
                    <div class="form-section">
                        <div class="mb-3">
                            <label class="form-label">Nombre Completo</label>
                            <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipo de Documento</label>
                            <select class="form-select" id="tipo_doc" name="tipo_doc" required>
                                <!-- Opciones del select -->
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Número de Documento</label>
                            <input type="text" class="form-control" id="num_doc" name="num_doc" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Lugar de Expedición</label>
                            <select class="form-select" id="lug_exp" name="lug_exp" required>
                                <!-- Opciones del select -->
                            </select>
                        </div>
                    </div>

                    <!-- Sección 2 -->
                    <div class="form-section" style="display:none;">
                        <div class="mb-3">
                            <label class="form-label">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fec_nacimiento" name="fec_nacimiento" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nacionalidad</label>
                            <select class="form-select" id="nacionalidad" name="nacionalidad" required>
                                <option value="CO">Colombiano</option>
                                <option value="EX">Extranjero</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Sexo</label>
                            <select class="form-select" id="sexo" name="sexo" required>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Estado Civil</label>
                            <select class="form-select" id="estado_civil" name="estado_civil" required>
                                <!-- Opciones del select -->
                            </select>
                        </div>
                    </div>

                    <!-- Más secciones aquí de la misma manera -->

                    <!-- Sección final con archivo -->
                    <div class="form-section" style="display:none;">
                        <div class="mb-3">
                            <label class="form-label">Cargar Hoja de Vida</label>
                            <input type="file" class="form-control" id="hoja_vida" name="hoja_vida">
                        </div>
                    </div>

                    <!-- Navegación -->
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary" id="prevBtn" style="display:none;">Anterior</button>
                        <button type="button" class="btn btn-primary" id="nextBtn">Siguiente</button>
                        <button type="submit" class="btn btn-success" id="submitBtn" style="display:none;">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    let currentSection = 0;
    const sections = document.querySelectorAll(".form-section");
    const nextBtn = document.getElementById("nextBtn");
    const prevBtn = document.getElementById("prevBtn");
    const submitBtn = document.getElementById("submitBtn");

    function showSection(index) {
        sections.forEach((section, i) => section.style.display = i === index ? "block" : "none");
        prevBtn.style.display = index > 0 ? "inline-block" : "none";
        nextBtn.style.display = index < sections.length - 1 ? "inline-block" : "none";
        submitBtn.style.display = index === sections.length - 1 ? "inline-block" : "none";
    }

    nextBtn.addEventListener("click", () => {
        if (currentSection < sections.length - 1) {
            currentSection++;
            showSection(currentSection);
        }
    });

    prevBtn.addEventListener("click", () => {
        if (currentSection > 0) {
            currentSection--;
            showSection(currentSection);
        }
    });

    showSection(currentSection);
});
</script>

					</div>
                </div>
                <!-- Fin del modal -->
            </div>
        </main>
    </div>
</div>
    <script>
        $(document).ready(function() {

            function llenarSelects(tipoPreguntaID = '') {
                // Llenar el select de empleados
                $.ajax({
                    url: '<?= API ?>entrevistas.php?action=empleados',
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
                    url: '<?= API ?>entrevistas.php?action=questions',
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        var preguntasEContainer = $('#preguntasEContainer');
                        preguntasEContainer.empty();

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
                            preguntasEContainer.append(tipoPreguntaInput + preguntaTexto + preguntaInputHidden + preguntaTextarea);
                        });
                    },
                    error: function() {
                        console.error("Error al cargar los datos de tipo de pregunta.");
                    }
                });
            }

            llenarSelects();

            var table = $('#datosTablaEntrevistas').DataTable({
                "ajax": "<?= API ?>entrevistas.php?action=fetch",
                "columns": [
                    { "data": "idEntrevista" },
                    { "data": "nombre_completo" },
                    { "data": "fechareg" },
                    {
                        "data": null,
                        "render": function (data, type, row) {
                            return `
                        <button class="btn btn-sm btn-warning edit" data-id="` + data.idEntrevista + `"><i class="align-middle me-2 fas fa-fw fa-edit"></i>Editar</button>
                        <button class="btn btn-sm btn-danger delete" data-id="` + data.idEntrevista + `"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i>Eliminar</button>
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
                    url: '<?= API ?>entrevistas.php?action=save',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        $('#modalCRUD').modal('hide');
                        table.ajax.reload();
                    }
                });
            });

            $('#addNuevo').on('click', function() {
                $('#modalLabel').text('Nueva Entrevista');
                $('#formDatosCrud')[0].reset();
                $('#id').val('');
            });

            // Editar
            $('#datosTablaEntrevistas tbody').on('click', '.edit', function() {
                $('#modalLabel').text('Editar Entrevista');
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>entrevistas.php?action=edit&id=' + id,
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
            $('#datosTablaEntrevistas tbody').on('click', '.delete', function() {
                if (confirm('¿Estás seguro de eliminar este entrevista?')) {
                    var id = $(this).data('id');

                    $.ajax({
                        url: '<?= API ?>entrevistas.php?action=delete&id=' + id,
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