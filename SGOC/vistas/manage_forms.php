<div class="row">
    <div class="col-lg-12">
        <div class="card text-white">
            <div class="card-body">
                <h3><b><?php echo isset($_GET['code']) ? "Editar" : "Crear Nuevo" ?> Formulario</b></h3>
            </div>
        </div>
    </div>
</div>
<hr class="border-dark">
<div class="container" id="form-field">
    <form id="form-data">
        <div class="mb-3">
            <label for="emp_id" class="form-label">¿Para que cargo está dirigida esta entrevista?</label>
            <select class="form-select" id="cargo_id" name="cargo_id" required="">
                <option value="1">Seleccione un cargo</option>
            </select>
        </div>
        <div class="row">
            <div class="card col-md-12 border border-primary">
                <div class="card-body">
                    <h3 contenteditable="true" class="text-center" id="form-title"></h3>
                    <hr class="border-primary">
                    <p contenteditable="true" id="form-description" class="form-description text-center">Ingresa tu respuesta aquí</p>
                </div>
            </div>
        </div>
        <div>
            <div id="question-field" class='row ml-2 mr-2'>
                <div class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="0">
                    <span class="item-move"><i class="fa fa-braille"></i></span>
                    <div class="card-body">
                        <div class="row align-items-center d-flex">
                            <div class="col-sm-8">
                                <p class="question-text m-0" id="form-question" contenteditable="true">Escribe tu pregunta aquí</p>
                            </div>
                            <div class="col-sm-4">
                                <select name="choice" class='form-control choice-option'>
                                    <option value="p">Párrafo</option>
                                    <option value="checkbox">Multiples Opciones y Respuestas</option>
                                    <option value="radio">Multiples Opciones 1 Respuesta</option>
                                    <option value="file">Subir archivo</option>
                                </select>
                            </div>
                        </div>
                        <hr class="border-dark">
                        <div class="row ">
                            <div class="form-group choice-field col-md-12">
                                <textarea name="q[0]" class="form-control col-sm-12" cols="30" rows="5" placeholder="Escriba aqui su respuesta"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="w-100 d-flex justify-content-between align-items-center">
                            <div class="form-check">
                                <input class="form-check-input req-item" type="checkbox" value="" >
                                <label class="form-check-label req-chk">
                                    <span style="color: red;">*</span>Campo obligatorio
                                </label>
                            </div>
                            <button class="btn btn-danger border rem-q-item" type="button"><i class="fa fa-trash"></i></button>
                        </div>
                    </div><br>
                </div>
            </div>
        </div>
        <div class="d-flex w-100 justify-content-center" id="form-buidler-action">
            <button class="btn btn-warning border mr-1" type="button" id="add_q-item"><i class="fa fa-plus"></i> Agregar Campo</button>
            <button class="btn btn-success border ml-1" type="button" id="save_form"><i class="fa fa-save"></i> Guardar Formulario</button>
        </div>
    </form>
</div>
<div class=" d-none" id = "q-item-clone">
<br class="card mt-3 mb-3 col-md-12 question-item ui-state-default" data-item="0">
    <span class="item-move"><i class="fa fa-braille"></i></span>
    <div class="card-body">

        <div class="row align-items-center d-flex">
            <div class="col-sm-8">
                <p class="question-text m-0" contenteditable="true">Escribe tu pregunta aquí</p>
            </div>
            <div class="col-sm-4">
                <select title="question choice type" name="choice" class='form-control choice-option'>
                    <option value="p">Párrafo</option>
                    <option value="checkbox">Multiples Opciones y Respuestas</option>
                    <option value="radio">Multiples Opciones 1 Respuesta</option>
                    <option value="file">Subir archivo</option>
                </select>
            </div>
        </div>
        <hr class="border-dark">
        <div class="row ">
            <div class="form-group choice-field col-md-12">
                <textarea name="q[]" class="form-control col-sm-12" cols="30" rows="5" placeholder="Escribe tu respuesta aquí"></textarea>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <div class="w-100 d-flex justify-content-between align-items-center">
            <div class="form-check">
                <input class="form-check-input req-item" id="form-check" type="checkbox" value="">
                <label class="form-check-label req-chk" for="">
                    *Requerido
                </label>
            </div>
            <button class="btn btn-danger border rem-q-item" type="button"><i class="fa fa-trash"></i></button>
        </div>
    </div>
</div>

<script>
    $.ajax({
        url: '<?= API ?>candidatos.php?action=cargos',
        type: 'GET',
        success: function(data) {
            var selectCargo = $('#cargo_id');
            selectCargo.empty();
            selectCargo.append('<option value="" selected>Seleccione</option>');
            $.each(data, function(index, item) {
                selectCargo.append('<option value="' + item.id + '">' + item.nombre + '</option>');
            });
            selectCargo.select2();
        }
    });

    const formTitle = document.getElementById("form-title");
    const formDescription = document.getElementById("form-description");
    const formQuestion = document.getElementById("form-question");

    // Función para mostrar el placeholder si el contenido está vacío
    function updatePlaceholder(element, placeholderText) {
        if (element.textContent.trim() === "") {
            element.textContent = placeholderText;
            element.classList.add("placeholder-style");
        }
    }

    // Función para eliminar el placeholder al hacer clic
    function removePlaceholderOnFocus(element, placeholderText) {
        if (element.textContent.trim() === placeholderText) {
            element.textContent = "";
            element.classList.remove("placeholder-style");
        }
    }

    // Agregar eventos y verificar contenido al cargar para el título
    formTitle.addEventListener("focus", function() {
        removePlaceholderOnFocus(formTitle, "Ingresa el título del formulario aquí");
    });
    formTitle.addEventListener("blur", function() {
        updatePlaceholder(formTitle, "Ingresa el título del formulario aquí");
    });

    // Agregar eventos y verificar contenido al cargar para la descripción
    formDescription.addEventListener("focus", function() {
        removePlaceholderOnFocus(formDescription, "Ingresa tu respuesta aquí");
    });
    formDescription.addEventListener("blur", function() {
        updatePlaceholder(formDescription, "Ingresa tu respuesta aquí");
    });

    // Agregar eventos y verificar contenido al cargar para la pregunta
    formQuestion.addEventListener("focus", function() {
        removePlaceholderOnFocus(formQuestion, "Escribe tu pregunta aquí");
    });
    formQuestion.addEventListener("blur", function() {
        updatePlaceholder(formQuestion, "Escribe tu pregunta aquí");
    });

    // Verificar el contenido al cargar la página para establecer los placeholders si están vacíos
    document.addEventListener("DOMContentLoaded", function() {
        updatePlaceholder(formTitle, "Ingresa el título del formulario aquí");
        updatePlaceholder(formDescription, "Ingresa tu respuesta aquí");
        updatePlaceholder(formQuestion, "Escribe tu pregunta aquí");
    });
</script>