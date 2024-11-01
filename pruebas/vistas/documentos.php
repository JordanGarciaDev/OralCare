<?php
include('../app/config.php');
$titulo = "Cargar Documentación"; // Título específico para esta vista
$titulo2 = "Documentos"; // Escribir el Título asi tal cual primera letra en mayusculas
$urlAPI = "documentos.php"; // Escribir el Título asi tal cual primera letra en mayusculas
$btnModal = "addDocumentos"; // Escribir el Título de la vista Ejemplo: addEmpleado
$LabelModal = "modalLabelDocumentos"; // Escribir el Título de la vista Ejemplo: modalLabelVista
$preguntasContainer = "preguntasDOContainer"; // Escribir las primeras 2 iniciales de la vista en medio de preguntas_Container

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
                    <button class="btn btn-primary float-end" id="<?=$btnModal;?>" data-bs-toggle="modal" data-bs-target="#modal<?=$titulo2;?>"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Cargar Nuevo</button>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Cargar mi documentación para la contratación</h5>
                            </div>
                            <div class="card-body">
                                <table id="datosTabla<?=$titulo2;?>" class="table table-striped" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tipo de documento</th>
                                        <th>Documento</th>
                                        <th>Fecha</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tipo de documento</th>
                                        <th>Documento</th>
                                        <th>Fecha</th>
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
                                   <input type="hidden" id="id" name="id" value="<?=$_SESSION['userId'];?>">
									<input type="hidden" class="form-control form-control-sm" id="emp_id" name="emp_id" value="<?=$_SESSION['userId'];?>">

                                    <div class="mb-3">
                                        <label for="doc_id" class="form-label">Tipo de documento</label>
                                        <select class="form-select" id="doc_id" name="doc_id" required="">
                                            <option value="">Seleccione un tipo de documento</option>
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
        </main>
    </div>
</div>
    <script>
        $(document).ready(function() {

        function llenarSelects<?=$titulo2;?>() {
    // Llenar el select de tipos_documentos
    $.ajax({
        url: '<?= API ?><?=$urlAPI;?>?action=tipos_documentos',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var tiposdocumentoSelect = $('#doc_id');
            tiposdocumentoSelect.empty(); // Limpiar opciones previas

            // Agregar la opción por defecto
            tiposdocumentoSelect.append('<option value="">Seleccione un tipo de documento</option>');

            // Verificar que data tiene la estructura esperada
            if (Array.isArray(data)) { // Ajusta según estructura real
                // Llenar el select con los datos de tipos_documentos de la API
                $.each(data, function(index, tiposdocumentos) {
                    tiposdocumentoSelect.append('<option value="' + tiposdocumentos.id + '">' + tiposdocumentos.nombre + '</option>');
                });
            } else {
                console.error("La estructura de datos no es la esperada:", data);
            }
        },
        error: function() {
            console.error("Error al cargar los tipos documentos.");
        }
    });
}


            llenarSelects<?=$titulo2;?>();

            var table = $('#datosTabla<?=$titulo2;?>').DataTable({
                "ajax": "<?= API ?><?=$urlAPI;?>?action=fetch",
                "columns": [
                    { "data": "idDoc" },
                    { "data": "nombre_completo" },
                    { "data": "fechareg" },
                    {
                        "data": null,
                        "render": function (data, type, row) {
                            return ``;
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


        });
    </script>
<?php
include(LAYOUT . '/footer.php');
?>