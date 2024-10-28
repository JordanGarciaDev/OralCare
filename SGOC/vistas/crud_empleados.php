<main class="content">
    <div class="container-fluid p-0">
    <div class="mb-3">
        <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-users"></i>Gestión de Empleados</h1>
        <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalEmpleado"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Crea/Edita/Elimina Empleados</h5>
                </div>
                <div class="card-body">
                    <table id="empleadosTable" class="table table-striped" style="width:100%">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre Completo</th>
                            <th>Tipo Doc</th>
                            <th>Número Doc</th>
                            <th>Ciudad Residencia</th>
                            <th>Cargo</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Nombre Completo</th>
                            <th>Tipo Doc</th>
                            <th>Número Doc</th>
                            <th>Ciudad Residencia</th>
                            <th>Cargo</th>
                            <th>Acciones</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para agregar/editar -->
    <div class="modal fade" id="modalEmpleado" tabindex="-1" aria-labelledby="modalEmpleadoLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEmpleadoLabel">Datos del Empleado</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Datos Básicos</h5>
                            <h6 class="card-subtitle text-muted">Escriba aquí los datos personales del empleado</h6>
                        </div>
                        <div class="card-body">
                            <form id="empleadoForm">
                                <input type="hidden" id="empleadoId" name="id" value="">
                                <div class="row">
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="nombre_completo">Nombre Completo</label>
                                        <input type="text" class="form-control" id="nombre_completo" name="nombre_completo" required placeholder="Escriba el nombre completo del empleado">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="tipo_doc">Tipo de Documento</label>
                                        <select class="form-select" id="tipo_doc" name="tipo_doc" required>
                                            <option value="">Seleccione</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="num_doc">Número de Documento</label>
                                        <input type="text" class="form-control" id="num_doc" name="num_doc" required placeholder="Escriba el número de documento">
                                    </div>

                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="lug_exp">Lugar de Expedición</label>
                                        <select class="form-select" id="lug_exp" name="lug_exp" required>
                                            <option value="">Seleccione</option>
                                            <!-- Opciones se llenan desde la base de datos -->
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="fec_nacimiento">Fecha de Nacimiento</label>
                                        <input type="date" class="form-control" id="fec_nacimiento" name="fec_nacimiento" required>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="nacionalidad">Nacionalidad</label>
                                        <select class="form-select" id="nacionalidad" name="nacionalidad" required>
                                            <option value="">Seleccione</option>
                                            <option value="CO">Colombiano</option>
                                            <option value="EX">Extranjero</option>
                                        </select>
                                    </div>

                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="sexo">Sexo</label>
                                        <select class="form-select" id="sexo" name="sexo" required>
                                            <option value="">Seleccione</option>
                                            <option value="M">Masculino</option>
                                            <option value="F">Femenino</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="estado_civil">Estado Civil</label>
                                        <select class="form-select" id="estado_civil" name="estado_civil" required>
                                            <option value="">Seleccione</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="dir_residencia">Dirección de Residencia</label>
                                        <input type="text" class="form-control" id="dir_residencia" name="dir_residencia" required placeholder="Escriba la dirección">
                                    </div>

                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="barrio_residencia">Barrio de Residencia</label>
                                        <input type="text" class="form-control" id="barrio_residencia" name="barrio_residencia" required placeholder="Escriba el barrio">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="ciudad_residencia">Ciudad de Residencia</label>
                                        <select class="form-select" id="ciudad_residencia" name="ciudad_residencia" required>
                                            <option value="">Seleccione</option>
                                            <!-- Opciones se llenan desde la base de datos -->
                                        </select>
                                    </div>

                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="tel_movil">Teléfono Móvil</label>
                                        <input type="text" class="form-control" id="tel_movil" name="tel_movil" required placeholder="Escriba el teléfono móvil">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="email_personal">Email Personal</label>
                                        <input type="email" class="form-control" id="email_personal" name="email_personal" required placeholder="Escriba el email personal">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="email_empresarial">Email Empresarial</label>
                                        <input type="email" class="form-control" id="email_empresarial" name="email_empresarial" placeholder="Escriba el email empresarial">
                                    </div>

                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="cargo_id">Cargo</label>
                                        <select class="form-select" id="cargo_id" name="cargo_id" required>
                                            <option value="">Seleccione</option>
                                            <!-- Opciones se llenan desde la base de datos -->
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="salario">Salario</label>
                                        <input type="number" class="form-control" id="salario" name="salario" required placeholder="Escriba el salario">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="fingreso">Fecha de Ingreso</label>
                                        <input type="date" class="form-control" id="fingreso" name="fingreso" required>
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="fretiro">Fecha de Retiro</label>
                                        <input type="date" class="form-control" id="fretiro" name="fretiro">
                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="tipo_de_sangre">Tipo de Sangre</label>
                                        <select class="form-select" id="tipo_de_sangre" name="tipo_de_sangre" required="">
                                            <option value="">Seleccione</option>
                                            <option value="A+">A+</option>
                                            <option value="A-">A-</option>
                                            <option value="B+">B+</option>
                                            <option value="B-">B-</option>
                                            <option value="AB+">AB+</option>
                                            <option value="AB-">AB-</option>
                                            <option value="O+">O+</option>
                                            <option value="O-">O-</option>
                                        </select>

                                    </div>
                                    <div class="mb-3 col-md-4">
                                        <label class="form-label" for="estado">Estado</label>
                                        <select class="form-select" id="estado" name="estado" required>
                                            <option value="">Seleccione</option>
                                            <option value="postulado">Postulado</option>
                                            <option value="activo">Activo</option>
                                            <option value="retirado">Retirado</option>
                                            <option value="en_proceso">En Proceso</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</main>
<script>
    $(document).ready(function () {
        function llenarSelects(tipoIdentificacionID = '', tipoDocID = '', lugarExpID = '', ciudadResidenciaID = '', estadoCivilID = '', cargoID = '') {
            // Llenar tipo de identificación
            $.ajax({
                url: '<?= API ?>empleados.php?action=tipo_identificacion',
                type: 'GET',
                success: function(data) {
                    var selectTipoID = $('#tipo_doc');
                    selectTipoID.empty();
                    selectTipoID.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectTipoID.append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (tipoIdentificacionID) {
                        selectTipoID.val(tipoIdentificacionID);
                    }
                }
            });

            // Llenar tipo de documento
            $.ajax({
                url: '<?= API ?>empleados.php?action=tipo_doc',
                type: 'GET',
                success: function(data) {
                    var selectTipoDoc = $('#tipo_doc');
                    selectTipoDoc.empty();
                    selectTipoDoc.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectTipoDoc.append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (tipoDocID) {
                        selectTipoDoc.val(tipoDocID);
                    }
                }
            });

            // Llenar lugar de expedición y municipios
            $.ajax({
                url: '<?= API ?>empleados.php?action=lugar_exp',
                type: 'GET',
                success: function(data) {
                    var selectLugExp = $('#lug_exp');
                    var selectCiudad = $('#ciudad_residencia');
                    // Llena el select de Ciudades
                    selectCiudad.empty();
                    selectCiudad.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectCiudad.append('<option value="' + item.id_municipio + '">' + item.municipio + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (ciudadResidenciaID) {
                        selectCiudad.val(ciudadResidenciaID);
                    }

                    // Llena el select de Lugar de expedición
                    selectLugExp.empty();
                    selectLugExp.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectLugExp.append('<option value="' + item.id_municipio + '">' + item.municipio + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (lugarExpID) {
                        selectLugExp.val(lugarExpID);
                    }
                }
            });

            // Llenar estado civil
            $.ajax({
                url: '<?= API ?>empleados.php?action=estados_civil',
                type: 'GET',
                success: function(data) {
                    var selectEstadoCivil = $('#estado_civil');
                    selectEstadoCivil.empty();
                    selectEstadoCivil.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectEstadoCivil.append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (estadoCivilID) {
                        selectEstadoCivil.val(estadoCivilID);
                    }
                }
            });

            // Llenar cargo
            $.ajax({
                url: '<?= API ?>empleados.php?action=cargos',
                type: 'GET',
                success: function(data) {
                    var selectCargo = $('#cargo_id');
                    selectCargo.empty();
                    selectCargo.append('<option value="">Seleccione</option>');
                    $.each(data, function(index, item) {
                        selectCargo.append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    // Establece el valor seleccionado
                    if (cargoID) {
                        selectCargo.val(cargoID);
                    }
                }
            });
        }
        llenarSelects();
        var table = $('#empleadosTable').DataTable({
            "ajax": "<?= API ?>empleados.php?action=fetch",
            "columns": [
                { "data": "id" },
                { "data": "nombre_completo" },
                { "data": "tipo_doc_nombre" },
                { "data": "num_doc" },
                { "data": "ciudad_residencia_nombre" },
                { "data": "cargo_nombre" },
                {
                    "data": null,
                    "render": function (data, type, row) {
                        return `
                        <button class="btn btn-sm btn-warning edit" data-id="${data.id}"><i class="align-middle me-2 fas fa-fw fa-edit"></i>Editar</button>
                        <button class="btn btn-sm btn-danger delete" data-id="${data.id}"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i>Eliminar</button>
                    `;
                    }
                }
            ],
            "language": {
                "url": "<?= API ?>languages/Spanish.json"
            }
        });

        $('#addNuevo').on('click', function () {
            $('#modalLabel').text('Nuevo Empleado');
            $('#formEmpleado')[0].reset();
            $('#id').val('');
            $('#modalEmpleado').modal('show');

        });

        $('#formEmpleado').submit(function (e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                url: '<?= API ?>empleados.php?action=save',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    $('#modalEmpleado').modal('hide'); // Oculta el modal
                    table.ajax.reload(); // Recarga la tabla con los datos actualizados
                },
                error: function (xhr, status, error) {
                    console.error('Error al guardar el empleado:', error);
                    alert('Ocurrió un error al intentar guardar los datos del empleado.');
                }
            });
        });

        $('#empleadosTable tbody').on('click', '.edit', function () {
            $('#modalLabel').text('Editar Empleado');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>empleados.php?action=edit&id=' + id,
                type: 'GET',
                dataType: 'json',
                success: function (empleado) {
                    $('#id').val(empleado.id);
                    $('#nombre_completo').val(empleado.nombre_completo);
                    $('#num_doc').val(empleado.num_doc);
                    $('#fec_nacimiento').val(empleado.fec_nacimiento);
                    $('#nacionalidad').val(empleado.nacionalidad);
                    $('#sexo').val(empleado.sexo);
                    $('#dir_residencia').val(empleado.dir_residencia);
                    $('#barrio_residencia').val(empleado.barrio_residencia);
                    $('#tel_movil').val(empleado.tel_movil);
                    $('#email_personal').val(empleado.email_personal);
                    $('#email_empresarial').val(empleado.email_empresarial);
                    $('#salario').val(empleado.salario);
                    $('#fingreso').val(empleado.fingreso);
                    $('#fretiro').val(empleado.fretiro);
                    $('#tipo_de_sangre').val(empleado.tipo_de_sangre);
                    $('#estado').val(empleado.estado);

                    // Llama a la función para llenar los selects con valores preseleccionados
                    llenarSelects(
                        empleado.tipo_doc,            // ID de tipo de identificación
                        empleado.tipo_doc,            // ID de tipo de documento
                        empleado.lug_exp,             // ID de lugar de expedición
                        empleado.ciudad_residencia,   // ID de ciudad de residencia
                        empleado.estado_civil,        // ID de estado civil
                        empleado.cargo_id,            // ID de cargo
                        empleado.nacionalidad         // ID de nacionalidad
                    );

                    $('#modalEmpleado').modal('show');
                },
                error: function (xhr, status, error) {
                    console.error('Error en la solicitud de edición:', error);
                    alert('Ocurrió un error al intentar cargar los datos del empleado.');
                }
            });
        });

        $('#empleadosTable tbody').on('click', '.delete', function () {
            if (confirm('¿Estás seguro de eliminar este empleado?')) {
                var id = $(this).data('id'); // Obtiene el ID del empleado a eliminar

                $.ajax({
                    url: '<?= API ?>empleados.php?action=delete&id=' + id,
                    type: 'GET',
                    success: function (response) {
                        table.ajax.reload(); // Recarga la tabla después de eliminar
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al eliminar el empleado:', error);
                        alert('Ocurrió un error al intentar eliminar el empleado.');
                    }
                });
            }
        });
    });
</script>
