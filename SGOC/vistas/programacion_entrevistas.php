<?php
include('../app/config.php');
$titulo = "Programación de Entrevistas"; // Título específico para esta vista
include(LAYOUT.'/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT .'/sidebar.php');?>

    <style>
        #containerLoader {
            position: fixed; /* Hacer que el contenedor sea fijo */
            top: 0; /* Ocupa toda la pantalla */
            left: 0; /* Ocupa toda la pantalla */
            width: 100%; /* Ocupa toda la pantalla */
            height: 100%; /* Ocupa toda la pantalla */
            display: flex; /* Usar flexbox para centrar el contenido */
            justify-content: center; /* Centrar horizontalmente */
            align-items: center; /* Centrar verticalmente */
            text-align: center; /* Centrar el texto */
            z-index: 9999; /* Asegurar que esté por encima de otros elementos */
        }

        .overlay {
            position: absolute; /* Posicionamiento absoluto para cubrir el fondo */
            top: 0; /* Ocupa toda la pantalla */
            left: 0; /* Ocupa toda la pantalla */
            width: 100%; /* Ocupa toda la pantalla */
            height: 100%; /* Ocupa toda la pantalla */
            background: rgba(255, 255, 255, 0.7); /* Fondo semitransparente */
            backdrop-filter: blur(5px); /* Efecto de desenfoque */
            z-index: 9998; /* Justo debajo del loader */
        }

        .loader {
            border: 16px solid #f3f3f3; /* Color de fondo */
            border-top: 16px solid #3498db; /* Color de la parte superior */
            border-radius: 50%;
            width: 50px; /* Tamaño del loader */
            height: 50px; /* Tamaño del loader */
            animation: spin 2s linear infinite; /* Animación de giro */
            z-index: 9999; /* Asegurar que esté encima de la capa de fondo */
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        #loaderMessage {
            margin-top: 10px; /* Espacio entre el loader y el mensaje */
            font-size: 16px; /* Tamaño del texto */
            color: #333; /* Color del texto */
            z-index: 9999; /* Asegurar que esté encima de la capa de fondo */
        }

    </style>

    <div id="containerLoader" class="d-none">
        <div class="overlay"></div> <!-- Capa para el fondo borroso -->
        <div class="loader"></div>
        <p id="loaderMessage">Cargando...</p>
    </div>

    <div class="main">
        <?php include(LAYOUT .'/navbar.php');?>
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
                                <h5 class="card-title">Crea/Edita/Elimina las Programaciones de Entrevistas</h5>
                            </div>
                            <div class="card-body">
                                <table id="datosTabla" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del candidato</th>
                                        <th>Cargo</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre del candidato</th>
                                        <th>Cargo</th>
                                        <th>Fecha</th>
                                        <th>Hora</th>
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
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nueva Entrevista</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formDatosCrud">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="emp_id" class="form-label">Candidato</label>
                                        <select class="form-select" id="emp_id" name="emp_id" required="">
                                            <option value="">Seleccione un candidato</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="cargo_id" class="form-label">Cargo</label>
                                        <select class="form-select" id="cargo_id" name="cargo_id" required="">
                                            <option value="">Seleccione un cargo</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                    <div class="form-group">
                                        <label for="fechaEntrevista">Correo</label>
                                        <input type="email" class="form-control" id="correo" name="correo" required="">
                                    </div>
                                    </div>
                                        <div class="mb-3">
                                    <div class="form-group">
                                        <label for="fechaEntrevista">Fecha</label>
                                        <input type="date" class="form-control" id="fechaEntrevista" name="fechapro" required="">
                                    </div>
                                        </div>
                                        <div class="mb-3">
                                    <div class="form-group">
                                        <label for="horaEntrevista">Hora</label>
                                        <input type="time" class="form-control" id="horaEntrevista" name="horapro" required="">
                                    </div>
                                        </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="align-middle me-2 fas fa-fw fa-minus"></i>Cancelar</button>
                                        <button type="submit" id="submit" class="btn btn-primary"><i class="align-middle me-2 fas fa-fw fa-save"></i><i class="fa fa-save"></i> Guardar</button>
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

        function llenarSelects() {
            // Llenar el select de empleados
            $.ajax({
                url: '<?= API ?>programacion_entrevistas.php?action=candidatos',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    var empleadoSelect = $('#emp_id');
                    empleadoSelect.empty(); // Limpiar opciones previas

                    // Agregar la opción por defecto
                    empleadoSelect.append('<option value="">Seleccione un candidato</option>');

                    // Llenar el select con los datos de empleados de la API
                    $.each(data.data, function(index, candidato) {
                        empleadoSelect.append('<option value="' + candidato.id + '">' + candidato.nombre_completo + '</option>');
                    });
                },
                error: function() {
                    console.error("Error al cargar los empleados.");
                }
            });
            // Llenar el select de cargos
            $.ajax({
                url: '<?= API ?>programacion_entrevistas.php?action=cargos',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    var cargoSelect = $('#cargo_id');
                    cargoSelect.empty(); // Limpiar opciones previas

                    // Agregar la opción por defecto
                    cargoSelect.append('<option value="">Seleccione un cargo</option>');

                    // Llenar el select con los datos de empleados de la API
                    $.each(data.data, function(index, cargo) {
                        cargoSelect.append('<option value="' + cargo.id + '">' + cargo.nombre + '</option>');
                    });
                },
                error: function() {
                    console.error("Error al cargar los empleados.");
                }
            });
        }

        llenarSelects();

        var table = $('#datosTabla').DataTable({
            "ajax": "<?= API ?>programacion_entrevistas.php?action=fetch",
            "columns": [
                { "data": "idCandidato" },
                { "data": "nombre_completo" },
                { "data": "nombre" },
                { "data": "fechapro" },
                { "data": "horapro" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                        <button class="btn btn-sm btn-success send" data-id="${data.idCandidato}"><i class="align-middle fas fa-fw fa-envelope"></i>Enviar pruebas</button>
                        <button class="btn btn-sm btn-warning edit" data-id="` + data.idCandidato + `"><i class="align-middle  fas fa-fw fa-edit"></i></button>
                        <button class="btn btn-sm btn-danger delete" data-id="` + data.idCandidato + `"><i class="align-middle fas fa-fw fa-trash-alt"></i></button>
                    `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            }
        });

        const containerLoader = document.getElementById('containerLoader');
        const loaderMessage = document.getElementById('loaderMessage');

        const showLoader = () => {
            containerLoader.classList.remove('d-none'); // Muestra el loader
        };

        const hideLoader = () => {
            containerLoader.classList.add('d-none'); // Oculta el loader
        };

        $('#datosTabla tbody').on('click', '.send', function() {
            var idCandidato = $(this).data('id');

            // Mostrar loader spinner
            showLoader();
            loaderMessage.innerText = "Enviando correo..."; // Cambia el mensaje mientras se envía el correo

            $.ajax({
                url: '<?= API ?>enviarCorreoPruebas.php',
                type: 'POST',
                data: { idCandidato: idCandidato },
                success: function(response) {
                    const responseMessage = response.message || "Pruebas enviadas exitosamente al candidato.";
                    $('#loaderMessage').text(responseMessage); // Actualiza el mensaje en el loader
                    $('#containerLoader').removeClass('d-none'); // Asegúrate de que el loader esté visible

                    // También puedes agregar un tiempo de espera para ocultar el loader y mostrar el mensaje
                    setTimeout(function() {
                        hideLoader(); // Oculta el loader después de un tiempo
                    }, 3000); // 3000 ms = 3 segundos

                },
                error: function(xhr, status, error) {
                    hideLoader();
                    console.error('Error al enviar el correo:', error);
                    alert('Ocurrió un error al intentar enviar el correo.');
                }
            });
        });

        // Agregar o editar entrevista
        $('#formDatosCrud').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                url: '<?= API ?>programacion_entrevistas.php?action=save',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $('#modalCRUD').modal('hide');
                    table.ajax.reload();
                }
            });
        });

        $('#addNuevo').on('click', function() {
            $('#modalLabel').text('Nueva Programación de Entrevista');
            $('#submit').text('Guardar');
            $('#emp_id').attr('disabled', false);
            $('#correo').attr('disabled', false);
            $('#cargo_id').attr('disabled', false);
            $('#formDatosCrud')[0].reset();
            $('#id').val('');
        });

        // Editar
        $('#datosTabla tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Programación de Entrevista');
            $('#emp_id').attr('disabled', true);
            $('#correo').attr('disabled', true);
            $('#cargo_id').attr('disabled', true);
            $('#submit').text('Actualizar');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>programacion_entrevistas.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function(entrevista) {
                    // Asignación correcta de valores en el formulario
                    $('#id').val(entrevista.idCandidato); // Asigna el ID de la entrevista
                    $('#emp_id').val(entrevista.candidato_id); // ID del candidato
                    $('#cargo_id').val(entrevista.idCargo); // ID del cargo
                    $('#fechaEntrevista').val(entrevista.fechapro); // Fecha de la entrevista
                    $('#correo').val(entrevista.email_personal); // Fecha de la entrevista
                    $('#horaEntrevista').val(entrevista.horapro); // Hora de la entrevista

                    $('#modalCRUD').modal('show'); // Muestra el modal
                },
                error: function(xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del entrevista.');
                }
            });
        });


        // Eliminar
        $('#datosTabla tbody').on('click', '.delete', function() {
            if (confirm('¿Estás seguro de eliminar este entrevista?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>programacion_entrevistas.php?action=delete&id=' + id,
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
