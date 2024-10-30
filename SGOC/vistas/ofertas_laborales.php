<?php
include('../app/config.php');
$titulo = "Ofertas Laborales"; // Título específico para esta vista
include(LAYOUT . '/header.php');
?>
    <div class="wrapper">
        <?php include(LAYOUT . '/sidebar.php');?>

        <div class="main">
            <?php include(LAYOUT . '/navbar.php');?>

            <main class="content">
                <div class="container-fluid p-0">
                    <div class="mb-3">
                        <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-briefcase"></i><?=$titulo;?></h1>
                        <button class="btn btn-primary float-end" id="addNuevo" data-bs-toggle="modal" data-bs-target="#modalCRUD"><i class="align-middle me-2 fas fa-fw fa-plus"></i>Agregar Nuevo</button>
                    </div>

                    <div class="row" id="ofertasContainer">
                        <!-- Las tarjetas de ofertas se agregarán aquí dinámicamente -->
                    </div>

                    <!-- Modal para agregar/editar -->
                    <div class="modal fade" id="modalCRUD" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel"><i class="align-middle me-2 far fa-fw fa-folder"></i>Nueva Oferta Laboral</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="formDatosCrud" enctype="multipart/form-data">
                                        <input type="hidden" id="id" name="id">
                                            <div class="mb-3">
                                                <label for="titulo">Título de la Oferta</label>
                                                <input type="text" placeholder="Escriba el Título de la Oferta" class="form-control" id="titulo" name="titulo" required="">
                                            </div>
                                            <div class="mb-3">
                                                <label for="beneficios">Beneficios</label>
                                                <textarea class="form-control" placeholder="Escriba los Beneficios de la Oferta" id="beneficios" name="beneficios" rows="3" required=""></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="condiciones">Condiciones de Trabajo</label>
                                                <textarea class="form-control" placeholder="Escriba las Condiciones de la Oferta " id="condiciones" name="condiciones" rows="3" required=""></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="cargo_id" class="form-label">Departamento</label>
                                                <select class="form-select" id="depto_id" name="depto_id" required="">
                                                    <option value="">Seleccione un departamento</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="cargo_id" class="form-label">Tipo de contrato</label>
                                                <select class="form-select" id="tipo_contrato_id" name="tipo_contrato_id" required="">
                                                    <option value="">Seleccione un Tipo de contrato</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="salario">Salario</label>
                                                <input type="number" placeholder="Escriba el Salario de la Oferta" class="form-control" id="salario" name="salario" required="">
                                            </div>
                                            <div class="mb-3">
                                                <label for="documento">Cargar Documentos</label>
                                                <input type="file" class="form-control" id="documento" name="documento">
                                            </div>
                                        <div class="mb-3">
                                            <label for="cargo_id" class="form-label">Estado</label>
                                            <select class="form-select" id="estado" name="estado" required="">
                                                <option value="1" selected>Vigente</option>
                                                <option value="0">Finalizada</option>
                                            </select>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="align-middle me-2 fas fa-fw fa-minus"></i>Cancelar</button>
                                            <button type="submit" class="btn btn-primary" id="guardarOferta"><i class="align-middle me-2 fas fa-fw fa-save"></i>Guardar</button>
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

                // Llenar el select de departamentos
                $.ajax({
                    url: '<?= API ?>ofertas_laborales.php?action=departamentos',
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        var deptoSelect = $('#depto_id');
                        deptoSelect.empty(); // Limpiar opciones previas

                        // Agregar la opción por defecto
                        deptoSelect.append('<option value="">Seleccione un departamento</option>');

                        // Llenar el select con los datos de departamentos de la API
                        $.each(data.data, function(index, depto) {
                            deptoSelect.append('<option value="' + depto.id + '">' + depto.nombre + '</option>');
                        });
                    },
                    error: function() {
                        console.error("Error al cargar los departamentos.");
                    }
                });

                // Llenar el select de tipos de contratos
                $.ajax({
                    url: '<?= API ?>ofertas_laborales.php?action=tipos_contratos',
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        var tcontratoSelect = $('#tipo_contrato_id');
                        tcontratoSelect.empty(); // Limpiar opciones previas

                        // Agregar la opción por defecto
                        tcontratoSelect.append('<option value="">Seleccione un tipo de contrato</option>');

                        // Llenar el select con los datos de tipos de contratos de la API
                        $.each(data.data, function(index, tcontrato) {
                            tcontratoSelect.append('<option value="' + tcontrato.id + '">' + tcontrato.nombre + '</option>');
                        });
                    },
                    error: function() {
                        console.error("Error al cargar los tipos de contratos.");
                    }
                });

                // Función para cargar las ofertas y otros selects
                $.ajax({
                    url: '<?= API ?>ofertas_laborales.php?action=fetch',
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.data && response.data.length > 0) {
                            $('#ofertasContainer').empty(); // Limpiar contenedor antes de agregar nuevas ofertas

                            response.data.forEach(function(oferta) {
                                // Ajustar el estado a "Activo" o "Terminado"
                                oferta.estado = oferta.estado === "1" ? "Activo" : "Terminado";

                                let salarioFormateado = oferta.salario ? parseInt(oferta.salario).toLocaleString('es-CO') : 'Sin salario';
                                let color = (oferta.estado === "Activo") ? 'bg-success' : 'bg-danger';
                                let adjunto = (oferta.documento === "") ? '' :
                                '<div class="card-body px-4 pt-2">' +
                                '<a href="<?= $_SERVER['DOCUMENT_ROOT'].'/OralCare/SGOC/uploads/OfertasLaborales/'?>'+ oferta.documento + '" target="_blank"><i class="fa fa-file-pdf"></i> Archivo Adjunto</a>' +
                                '</div>';
console.log('URL del archivo: ', '<?= $_SERVER['DOCUMENT_ROOT'].'/OralCare/SGOC/uploads/OfertasLaborales/'?>' + oferta.documento);

                                // Crear el HTML para cada tarjeta de oferta
                                const ofertaCard = `
                            <div class="col-12 col-md-6 col-lg-3">
                                <div class="card">
                                    <div class="card-header px-4 pt-4">
                                        <div class="card-actions float-end">
                                            <div class="dropdown position-relative">
                                                <a href="#" data-bs-toggle="dropdown" data-bs-display="static">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal align-middle">
                                                        <circle cx="12" cy="12" r="1"></circle>
                                                        <circle cx="19" cy="12" r="1"></circle>
                                                        <circle cx="5" cy="12" r="1"></circle>
                                                    </svg>
                                                </a>
                                                <input type="hidden" id="id" name="id" value="${oferta.idOferta}">
                                                <div class="dropdown-menu dropdown-menu-end">
                                                    <a class="dropdown-item edit" data-id="${oferta.idOferta}"><i class="align-middle me-2 fas fa-fw fa-edit"></i>Editar</a>
                                                    <a class="dropdown-item delete" data-id="${oferta.idOferta}"><i class="align-middle me-2 fas fa-fw fa-trash-alt"></i>Eliminar</a>
                                                </div>
                                            </div>
                                        </div>
                                        <h5 class="card-title mb-0">${oferta.titulo_oferta || 'Sin título'}</h5>
                                        <div class="badge ${color} my-2">${oferta.estado}</div>
                                    </div>
                                    <div class="card-body px-4 pt-2">
                                        <p>${oferta.beneficios_oferta || 'Sin beneficios'}</p>
                                        <p>${oferta.condiciones_oferta || 'Sin condiciones'}</p>
                                        <p>${oferta.nombre || 'Sin contrato'}</p>
                                        <strong>$ ${salarioFormateado || 'Sin salario'}</strong>
                                        <img id="perfilFoto" class="rounded-circle me-1" width="28" height="28" src="<?= ASSET_URL.'/img/avatars/' . $_SESSION['fotousuario'] ?>" alt="<?=$_SESSION['nomusuario'];?>">
                                    </div>
                                    ${adjunto}
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-4 pb-4">
                                            <p class="mb-2 font-weight-bold">Progreso <span class="float-end">75%</span></p>
                                            <div class="progress progress-sm">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>`;

                                // Agregar cada tarjeta al contenedor
                                $('#ofertasContainer').append(ofertaCard);
                            });

                            // Agregar los manejadores de eventos de edición y eliminación después de agregar las ofertas
                            $('.edit').on('click', function() {
                                const id = $(this).data('id');
                                $.ajax({
                                    url: '<?= API ?>ofertas_laborales.php?action=edit&id=' + id,
                                    type: 'GET',
                                    dataType: 'json',
                                    success: function(oferta) {
                                        $('#id').val(oferta.idOferta);
                                        $('#titulo').val(oferta.titulo_oferta);
                                        $('#beneficios').val(oferta.beneficios_oferta);
                                        $('#condiciones').val(oferta.condiciones_oferta);
                                        $('#depto_id').val(oferta.depto_id);
                                        $('#tipo_contrato_id').val(oferta.tipo_contrato);
                                        $('#salario').val(oferta.salario);
                                        $('#estado').val(oferta.estado);
                                        $('#modalLabel').text('Editar Oferta Laboral');
                                        $('#modalCRUD').modal('show'); // Muestra el modal
                                    },
                                    error: function(xhr, status, error) {
                                        console.error('Error en la solicitud de edición:', error);
                                        alert('Ocurrió un error al intentar cargar los datos de la oferta.');
                                    }
                                });
                            });

                            $('.delete').on('click', function() {
                                const id = $(this).data('id');
                                if (confirm('¿Está seguro de que desea eliminar esta oferta?')) {
                                    $.ajax({
                                        url: '<?= API ?>ofertas_laborales.php?action=delete&id=' + id,
                                        type: 'DELETE',
                                        success: function(response) {
                                            alert('Oferta eliminada exitosamente');
                                            llenarSelects(); // Volver a cargar las ofertas
                                        },
                                        error: function(xhr, status, error) {
                                            console.error('Error en la solicitud de eliminación:', error);
                                            alert('Ocurrió un error al intentar eliminar la oferta.');
                                        }
                                    });
                                }
                            });
                        } else {
                            console.warn("No se recibieron datos de ofertas laborales.");
                            $('#ofertasContainer').html('<p>No se encontraron ofertas.</p>');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error en la solicitud de ofertas:', error);
                        alert('Ocurrió un error al intentar cargar las ofertas laborales.');
                    }
                });

            }

            llenarSelects();

            // Agregar o editar Oferta
            $('#formDatosCrud').submit(function(e) {
                e.preventDefault();
                var formData = new FormData($('#formDatosCrud')[0]);

                $.ajax({
                    url: '<?= API ?>ofertas_laborales.php?action=save',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        alert('Oferta guardada exitosamente');
                        $('#modalCRUD').modal('hide');
                        llenarSelects(); // Recargar ofertas
                    }
                });
            });

            $('#addNuevo').on('click', function() {
                $('#modalLabel').text('Nueva Oferta Laboral');
                $('#formDatosCrud')[0].reset(); // Reiniciar el formulario
            });

        });
    </script>
<?php
include(LAYOUT . '/footer.php');
?>