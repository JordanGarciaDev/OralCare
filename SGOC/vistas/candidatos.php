<?php
include('../app/config.php');
include(LAYOUT . '/header.php');
$titulo = "Gestión de Candidatos"; // Título específico para esta vista
?>
<div class="wrapper">
    <?php include(LAYOUT . '/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT . '/navbar.php');?>

        <main class="content">

            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-users"></i><?=$titulo;?></h1>
                    <button class="d-none btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalEmpleado"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina <?=$titulo;?></h5>
                            </div>
                            <div class="card-body">
                                <table id="candidatosTable" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre Completo</th>
                                        <th>Ciudad Residencia</th>
                                        <th>Cargo Aplicado</th>
                                        <th>Oferta Aplicada</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre Completo</th>
                                        <th>Ciudad Residencia</th>
                                        <th>Cargo Aplicado</th>
                                        <th>Oferta Aplicada</th>
                                        <th>Estado</th>
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
                                <h5 class="modal-title" id="modalEmpleadoLabel">Datos del Candidato</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Datos Básicos</h5>
                                        <h6 class="card-subtitle text-muted">Escriba aquí los datos personales del candidato</h6>
                                    </div>
                                    <div class="card-body">
                                        <form id="candidatoForm" enctype="multipart/form-data">
                                            <input type="hidden" id="empleadoId" name="empleadoId">
                                            <div class="row">
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="nombre_completo"><span style="color:red">*</span>Nombre Completo</label>
                                                    <input disabled type="text" class="form-control" id="nombre_completo" name="nombre_completo" placeholder="Escriba el nombre completo del empleado" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="tipo_doc"><span style="color:red">*</span>Tipo de Documento</label>
                                                    <select disabled class="form-select" id="tipo_doc" name="tipo_doc" required>
                                                        <option value="">Seleccione</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="num_doc"><span style="color:red">*</span>Número de Documento</label>
                                                    <input disabled type="number" class="form-control" id="num_doc" name="num_doc" placeholder="Escriba el número de documento" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="lug_exp"><span style="color:red">*</span>Lugar de Expedición</label>
                                                    <select disabled class="form-select" id="lug_exp" name="lug_exp" required>
                                                        <option value="">Seleccione</option>
                                                        <!-- Opciones se llenan desde la base de datos -->
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="fec_nacimiento"><span style="color:red">*</span>Fecha de Nacimiento</label>
                                                    <input disabled type="date" class="form-control" id="fec_nacimiento" name="fec_nacimiento" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="nacionalidad"><span style="color:red">*</span>Nacionalidad</label>
                                                    <select disabled class="form-select" id="nacionalidad" name="nacionalidad" required>
                                                        <option value="">Seleccione</option>
                                                        <option value="CO">Colombiano</option>
                                                        <option value="EX">Extranjero</option>
                                                    </select>
                                                </div>

                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="sexo"><span style="color:red">*</span>Sexo</label>
                                                    <select disabled class="form-select" id="sexo" name="sexo" required>
                                                        <option value="">Seleccione</option>
                                                        <option value="M">Masculino</option>
                                                        <option value="F">Femenino</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="estado_civil"><span style="color:red">*</span>Estado Civil</label>
                                                    <select disabled class="form-select" id="estado_civil" name="estado_civil" required>
                                                        <option value="">Seleccione</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="dir_residencia"><span style="color:red">*</span>Dirección de Residencia</label>
                                                    <input disabled type="text" class="form-control" id="dir_residencia" name="dir_residencia" placeholder="Escriba la dirección" required>
                                                </div>

                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="barrio_residencia"><span style="color:red">*</span>Barrio de Residencia</label>
                                                    <input disabled type="text" class="form-control" id="barrio_residencia" name="barrio_residencia" placeholder="Escriba el barrio" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="ciudad_residencia"><span style="color:red">*</span>Ciudad de Residencia</label>
                                                    <select disabled class="form-select" id="ciudad_residencia" name="ciudad_residencia" required>
                                                        <option value="">Seleccione</option>
                                                        <!-- Opciones se llenan desde la base de datos -->
                                                    </select>
                                                </div>

                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="tel_movil"><span style="color:red">*</span>Teléfono Móvil</label>
                                                    <input disabled type="number" class="form-control" id="tel_movil" name="tel_movil" placeholder="Escriba el teléfono móvil" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="email_personal"><span style="color:red">*</span>Email Personal</label>
                                                    <input disabled type="email" class="form-control" id="email_personal" name="email_personal" placeholder="Escriba el email personal" required>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="cargo_id"><span style="color:red">*</span>Cargo</label>
                                                    <select disabled class="form-select" id="cargo_id" name="cargo_id" required>
                                                        <option value="">Seleccione</option>
                                                        <!-- Opciones se llenan desde la base de datos -->
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="tipo_sangre"><span style="color:red">*</span>Tipo de Sangre</label>
                                                    <select disabled class="form-select" id="tipo_sangre" name="tipo_sangre" required>
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

                                                    <label class="form-label" for="estado"><span style="color:red">*</span>¿Continúa proceso?</label>
                                                    <select class="form-select" id="estado" name="estado" required onchange="mostrarFechaYHora()">
                                                        <option value="" selected="">Seleccione</option>
                                                        <option value="en_proceso">Si</option>
                                                        <option value="no_continua">No</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-4" id="fechaContainer" style="display: none;">
                                                    <label class="form-label" for="fechaEntrevista"><span style="color:red">*</span>Fecha de entrevista</label>
                                                    <input type="date" class="form-control" id="fechaEntrevista" name="fechapro" >
                                                </div>
                                                <div class="mb-3 col-md-4" id="horaContainer" style="display: none;">
                                                    <label class="form-label" for="horaEntrevista"><span style="color:red">*</span>Hora de entrevista</label>
                                                    <input type="time" class="form-control" id="horaEntrevista" name="horapro" >
                                                </div>

                                                <!-- Sección final con archivo -->
                                                <div class="mb-3 col-md-4">
                                                    <div class="mb-3">
                                                        <label class="form-label" for="horaEntrevista">Ver Hoja de Vida</label>
                                                        <a id="hoja_de_vida"></a>
                                                    </div>
                                                </div>
                                                 <div class="mb-3 col-md-12 text-center">
                                                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>  Guardar información</button>
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

                    </div>
                </div>
        </main>
    </div>
</div>
<?php
// Determina si el botón de eliminación debe estar presente
$deleteButton = '';
if ($_SESSION['userId'] == 1) {
    $deleteButton = '<button class="btn btn-sm btn-danger delete" data-id="${data.id}" title="Eliminar Postulación">
                        <i class="align-middle fas fa-fw fa-trash-alt"></i>
                    </button>';
}
?>
    <script>
        $(document).ready(function () {
            function llenarSelectsEmp(tipoIdentificacionID = '', tipoDocID = '', lugarExpID = '', ciudadResidenciaID = '', estadoCivilID = '', cargoID = '') {
                // Llenar tipo de identificación
                $.ajax({
                    url: '<?= API ?>candidatos.php?action=tipo_identificacion',
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
                    url: '<?= API ?>candidatos.php?action=tipo_doc',
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
                    url: '<?= API ?>candidatos.php?action=lugar_exp',
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
                    url: '<?= API ?>candidatos.php?action=estados_civil',
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
            }
            llenarSelectsEmp();

            var table = $('#candidatosTable').DataTable({
                "ajax": "<?= API ?>candidatos.php?action=fetch",
                "columns": [
                    { "data": "id" },
                    { "data": "nombre_completo" },
                    { "data": "ciudad_residencia_nombre" },
                    { "data": "cargo_nombre" },
                    { "data": "titulo_oferta" },
                    { "data": "estado" },
                    {
                        "data": null,
                        "render": function (data, type, row) {
                            return `
                        <button class="btn btn-sm btn-success edit" data-id="${data.id}" title="Ver Postulación"><i class="align-middle fas fa-fw fa-eye"></i></button>
                       <?php echo $deleteButton; ?>
                    `;
                        }
                    }
                ],
                "language": {
                    "url": "<?= API ?>languages/Spanish.json"
                }
            });

            $('#addNuevo').on('click', function () {
                $('#modalLabel').text('Nuevo Candidato');
                $('#candidatoForm')[0].reset();
                $('#id').val('');
            });

            // Agregar o editar tipo de candidatos
            $('#candidatoForm').submit(function(e) {
                e.preventDefault();
                var formData = $(this).serialize();

                $.ajax({
                    url: '<?= API ?>candidatos.php?action=save',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        alert("La Información ha sido actualizada correctamente!");
                        $('#modalEmpleado').modal('hide');
                        table.ajax.reload();
                    }
                });
            });

            $('#candidatosTable tbody').on('click', '.edit', function () {
                $('#modalLabel').text('Editar Candidato');
                var id = $(this).data('id');
                var hojaDeVida = $('#hoja_de_vida');
                hojaDeVida.empty();

                $.ajax({
                    url: '<?= API ?>candidatos.php?action=edit&id=' + id,
                    type: 'GET',
                    dataType: 'json',
                    success: function (empleado) {
                        $('#empleadoId').val(empleado.id);
                        $('#nombre_completo').val(empleado.nombre_completo);
                        $('#num_doc').val(empleado.num_doc);
                        $('#fec_nacimiento').val(empleado.fec_nacimiento);
                        $('#nacionalidad').val(empleado.nacionalidad);
                        $('#sexo').val(empleado.sexo);
                        $('#dir_residencia').val(empleado.dir_residencia);
                        $('#barrio_residencia').val(empleado.barrio_residencia);
                        $('#tel_movil').val(empleado.tel_movil);
                        $('#email_personal').val(empleado.email_personal);
                        $('#tipo_sangre').val(empleado.tipo_sangre);


                        // Comprobación de la URL del CV
                        if (empleado.cv) {
                            hojaDeVida.append(
                                `<a class="form-control" style="border: 1px solid #fdfdfd;" href="${empleado.cv}" target="_blank">
                        <i class="fa fa-file-pdf"></i> Descargar Curriculum
                    </a>`
                            );
                        } else {
                            hojaDeVida.append('<p>No se ha cargado un archivo de hoja de vida.</p>');
                        }

                        llenarSelectsEmp(
                            empleado.tipo_doc,            // ID de tipo de identificación
                            empleado.tipo_doc,            // ID de tipo de documento
                            empleado.lug_exp,             // ID de lugar de expedición
                            empleado.ciudad_residencia,   // ID de ciudad de residencia
                            empleado.estado_civil,        // ID de estado civil
                            empleado.cargo_id,            // ID de cargo
                            empleado.nacionalidad,         // ID de nacionalidad
                        );

                        $('#modalEmpleado').modal('show');
                    },
                    error: function (xhr, status, error) {
                        console.error('Error en la solicitud de edición:', error);
                        alert('Ocurrió un error al intentar cargar los datos del empleado.');
                    }
                });
            });

            $('#candidatosTable tbody').on('click', '.delete', function () {
                if (confirm('¿Estás seguro de eliminar este empleado?')) {
                    var id = $(this).data('id'); // Obtiene el ID del empleado a eliminar

                    $.ajax({
                        url: '<?= API ?>candidatos.php?action=delete&id=' + id,
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

        function mostrarFechaYHora() {
            const estado = $('#estado').val();
            if (estado === 'en_proceso') {
                $('#fechaContainer').show();
                $('#horaContainer').show();
            } else {
                $('#fechaContainer').hide();
                $('#horaContainer').hide();
            }
        }

    </script>
<?php
include(LAYOUT . '/footer.php');
?>