/* 
This Simple Form Builder was Developed by 
Carlo Montero
Posted/Published in: www.sourcecodester.com
*/
$(function() {
    $('#form-field form').prepend("<input type='hidden' name='form_code' value='" + form_code + "'/>")
    $('#form-buidler-action').remove()
    $('.question-item .card-footer, .item-move,[name="choice"],.add_chk, .add_radio,.rem-on-display').remove()
    $('[contenteditable]').each(function() {
        $(this).removeAttr('contenteditable')
    })
    $('.form-check label').click(function() {
        if ($(this).siblings('input').is(":checked") == true) {
            $(this).siblings('input').prop("checked", false).trigger('change')
        } else {
            $(this).siblings('input').prop("checked", true).trigger('change')
        }
    })
    $('.choice-field input[type="checkbox"][required="required"]').each(function() {
        $(this).closest('.choice-field').attr("data-required", true)
    })
    $('.choice-field input[type="checkbox"]').change(function() {
        var _req = $(this).closest('.choice-field').attr("data-required")
        if (_req == "true") {
            if ($(this).closest('.choice-field').find('input[type="checkbox"]:checked').length > 0) {
                $(this).closest('.choice-field').find('input[type="checkbox"]').attr('required', false)
            } else {
                $(this).closest('.choice-field').find('input[type="checkbox"]').attr('required', true)
            }
        }
    })
    $('#save_response').click(function() {
        $('#form-field form').submit()
    })

    let startTime; // Variable para almacenar el tiempo de inicio

// Función para registrar el tiempo de entrada
    window.onload = function() {
        startTime = new Date(); // Almacena la fecha y hora actuales
    };

// Evento para calcular y mostrar el tiempo en consola antes de enviar el formulario
    $('#form-field form').submit(function(e) {
        e.preventDefault(); // Prevenir el envío del formulario

        // Calcular el tiempo transcurrido en minutos
        let endTime = new Date();
        let timeSpent = (endTime - startTime) / 1000 / 60; // Tiempo en minutos
        console.log(`Tiempo en la página: ${timeSpent.toFixed(2)} minutos`); // Mostrar tiempo en consola

        // Agregar el tiempo a los datos del formulario
        const formData = new FormData($(this)[0]);
        formData.append('time_spent', timeSpent); // Agregar el tiempo al FormData

        start_loader(); // Iniciar el loader
        $.ajax({
            url: "../app/APIS/preguntas_entrevistas.php?a=save_response",
            method: 'POST',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            error: err => {
                console.log(err);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Ha ocurrido un error. Por favor, intenta nuevamente.',
                });
                end_loader();
            },
            success: function(resp) {
                if (typeof resp == 'object' && resp.status == 'success') {
                    $('#enviar').hide(); // Ocultar el botón de enviar
                    $('textarea[name^="q["]').prop('disabled', true); // Deshabilitar todos los textarea que comienzan con q[
                    Swal.fire({
                        icon: 'success',
                        title: 'Éxito',
                        html: 'Tus respuestas han sido guardadas exitosamente,<br>¡Te deseamos los mejores éxitos!',
                    });
                } else {
                    console.log(resp);
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Ha ocurrido un error. Por favor, intenta nuevamente.',
                    });
                }
                end_loader(); // Finalizar el loader
            }
        });
    });

})