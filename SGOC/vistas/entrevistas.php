<?php
include('../app/config.php');
$titulo = "Entrevistas"; // Título específico para esta vista
include(LAYOUT.'/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT .'/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT .'/navbar.php');?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-cogs"></i>Entrevistas</h1>
                    <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalCRUD"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Crea/Edita/Elimina las Entrevistas</h5>
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
                                <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nueva Entrevista</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formDatosCrud">
                                    <input type="hidden" id="id" name="id">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre del Entrevistado(a)</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Escriba el nombre del entrevistado(a)" required>
                                    </div>
                                        <h3>Preguntas de Entrevista</h3>
                                        <div id="preguntasContainer">


                                            <div class="form-group">
                                                <label for="respuesta0">Háblame de ti</label>
                                                <textarea class="form-control" id="respuesta0" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta1">Hazme un resumen de tu experiencia</label>
                                                <textarea class="form-control" id="respuesta1" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta2">¿Qué sabes de nosotros?</label>
                                                <textarea class="form-control" id="respuesta2" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta3">¿Por qué quieres trabajar con nosotros?</label>
                                                <textarea class="form-control" id="respuesta3" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta4">¿Por qué crees que eres un buen candidato para esta posición?</label>
                                                <textarea class="form-control" id="respuesta4" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta5">¿Cómo te ves en 5 años?</label>
                                                <textarea class="form-control" id="respuesta5" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta6">¿Cuáles son tus principales fortalezas y debilidades?</label>
                                                <textarea class="form-control" id="respuesta6" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta7">¿Por qué deseas cambiar de trabajo?</label>
                                                <textarea class="form-control" id="respuesta7" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta8">Llevas varios meses sin trabajar ¿qué has hecho en este tiempo?</label>
                                                <textarea class="form-control" id="respuesta8" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta9">Describe un proyecto exitoso en el que hayas participado</label>
                                                <textarea class="form-control" id="respuesta9" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta10">¿Cuál ha sido el mayor reto que has enfrentado?</label>
                                                <textarea class="form-control" id="respuesta10" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta11">¿Cuál ha sido el mayor error que has cometido en un trabajo?</label>
                                                <textarea class="form-control" id="respuesta11" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta12">Describe una situación difícil que hayas enfrentado con un cliente.</label>
                                                <textarea class="form-control" id="respuesta12" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta13">Háblame de un proceso de negociación que hayas llevado a cabo</label>
                                                <textarea class="form-control" id="respuesta13" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta14">Describe alguna situación compleja que hayas afrontado con algún supervisor o compañero de trabajo</label>
                                                <textarea class="form-control" id="respuesta14" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta15">¿Tienes las habilidades necesarias para tener éxito en este puesto?</label>
                                                <textarea class="form-control" id="respuesta15" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta16">¿Cuál es tu mayor logro?</label>
                                                <textarea class="form-control" id="respuesta16" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta17">¿Cómo describirían tus compañeros de trabajo tu personalidad?</label>
                                                <textarea class="form-control" id="respuesta17" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta18">¿Cómo te describes a ti mismo?</label>
                                                <textarea class="form-control" id="respuesta18" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta19">Háblame sobre tus habilidades de liderazgo.</label>
                                                <textarea class="form-control" id="respuesta19" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta20">¿Dónde te ves en 5 años?</label>
                                                <textarea class="form-control" id="respuesta20" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta21">¿Tienes alguna pregunta para mí?</label>
                                                <textarea class="form-control" id="respuesta21" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta22">¿Cómo manejas el conflicto con un compañero de trabajo?</label>
                                                <textarea class="form-control" id="respuesta22" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta23">¿Cómo manejas el estrés?</label>
                                                <textarea class="form-control" id="respuesta23" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta24">¿Cuál es tu mayor debilidad?</label>
                                                <textarea class="form-control" id="respuesta24" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta25">¿Qué diría de ti la persona que menos te quiere en el mundo?</label>
                                                <textarea class="form-control" id="respuesta25" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta26">¿Quién es el candidato adecuado para este puesto?</label>
                                                <textarea class="form-control" id="respuesta26" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta27">¿Qué esperas obtener de este trabajo?</label>
                                                <textarea class="form-control" id="respuesta27" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta28">¿Cómo era la cultura corporativa en tu anterior empleo?</label>
                                                <textarea class="form-control" id="respuesta28" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta29">¿Cuál es el lugar de trabajo deseado?</label>
                                                <textarea class="form-control" id="respuesta29" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta30">¿Por qué quieres este trabajo?</label>
                                                <textarea class="form-control" id="respuesta30" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta31">¿Cómo era la relación con tu antiguo jefe?</label>
                                                <textarea class="form-control" id="respuesta31" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta32">¿Por qué quieres abandonar tu posición actual?</label>
                                                <textarea class="form-control" id="respuesta32" rows="3" required=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="respuesta33">¿Cuál es tu salario actual?</label>
                                                <input type="text" class="form-control" id="respuesta33" name="respuesta33" placeholder="Escriba su salario actual" required="">                                            </div>
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
            "ajax": "<?= API ?>entrevista?action=fetch",
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
                url: '<?= API ?>entrevista?action=save',
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
        $('#datosTabla tbody').on('click', '.edit', function() {
            $('#modalLabel').text('Editar Entrevista');
            var id = $(this).data('id');

            $.ajax({
                url: '<?= API ?>entrevista?action=edit&id=' + id,
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
            if (confirm('¿Estás seguro de eliminar este entrevista?')) {
                var id = $(this).data('id');

                $.ajax({
                    url: '<?= API ?>entrevista?action=delete&id=' + id,
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
