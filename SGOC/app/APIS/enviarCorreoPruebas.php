<?php
header('Content-Type: application/json'); // Asegúrate de establecer el tipo de contenido

// Conexión y configuración
include('../../app/config.php');
require '../../vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idCandidato = $_POST['idCandidato'];

    // Obtener información del candidato
    $query = "SELECT *, e.id AS idEntrevista, c.id AS idCargo, c.nombre AS nomCargo FROM programacion_entrevistas e
              INNER JOIN candidatos em ON e.candidato_id = em.id
              INNER JOIN cargos c ON e.cargo_id = c.id WHERE e.id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $idCandidato);
    $stmt->execute();
    $result = $stmt->get_result();
    $candidato = $result->fetch_assoc();

    if ($candidato) {
        $to = $candidato['email_personal'];
        $subject = "Clinicas Oral Care ha programado tus pruebas para el cargo ".$candidato['nomCargo']."";
        $mesaje = '<table width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="background-color:transparent;">
    <tbody>
        <tr>
            <td>
                <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation">
                    <tbody>
                        <tr>
                            <td>
                                <table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="border-radius:0;color:#000;width:650px;margin:0 auto;" width="650">
                                    <tbody>
                                        <tr>
                                            <td class="column" width="100%" style="font-weight:400;text-align:left;padding-bottom:5px;padding-top:5px;vertical-align:top;border-top:0;border-right:0;border-bottom:0;border-left:0;">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div style="font-family:Arial,Helvetica Neue,Helvetica,sans-serif;text-align:center;" align="center">
                                                                    <table class="image_block" role="presentation" border="0" width="100%" cellspacing="0" cellpadding="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td style="width:100%;padding-right:0;padding-left:0;">
                                                                                    <div style="line-height:10px" align="center">
                                                                                        <div style="max-width:116px;">
                                                                                            <a href="https://clinicasoralcare.co/" target="_blank">
                                                                                                <img style="display:block;height:auto;border:0;width:100%;" src="https://sgoc.clinicasoralcare.co/OralCare/SGOC/assets/img/avatars/logo.jpg" width="116" height="auto">
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation">
                    <tbody>
                        <tr>
                            <td>
                                <table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="border-radius:0;color:#343446;width:650px;margin:0 auto;" width="650">
                                    <tbody>
                                        <tr>
                                            <td class="column" width="100%" style="font-weight:400;text-align:left;padding-bottom:5px;padding-top:5px;vertical-align:top;border-top:0;border-right:0;border-bottom:0;border-left:0;">
                                                <table width="100%" border="0" cellpadding="10" cellspacing="0" role="presentation" style="word-break:break-word;">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div style="font-family:sans-serif;">
                                                                    <div style="font-size:12px;font-family:Arial,Helvetica Neue,Helvetica,sans-serif;color:#5a5d8d;line-height:1.5;">
                                                                        <p style="margin:0;font-size:15px;">
                                                                            <span style="font-size:15px">¡Hola, '.$candidato['nombre_completo'].'.! 👋</span>
                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;">&nbsp;</p>
                                                                        <p style="margin:0;font-size:15px;">
                                                                            <span style="font-size:15px">Nos complace informarte que has sido <strong>seleccionado para presentar las entrevistas y pruebas técnicas</strong> para la vacante en <strong>Clínicas Oral Care</strong>.</span>
                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;">&nbsp;</p>
                                                                        <p style="margin:0;font-size:15px;">
                                                                            <span style="font-size:15px">Detalles de la entrevista:</span><br>
                                                                            <strong>Fecha de la entrevista:</strong> ' . $candidato['fechapro'] . ' a las ' . $candidato['horapro'] . '.<br>
                                                                            <strong>Duración estimada:</strong> 45 Minutos<br>
                                                                            <strong>Modalidad:</strong> <a href="https://sgoc.clinicasoralcare.co/pruebas/" target="_blank">Virtual desde este link</a>.<br>
                                                                            <strong>Credenciales:</strong> Ingresa tu número de identificación en el usuario y contraseña.<br>

                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;">&nbsp;</p>
                                                                        <p style="margin:0;font-size:15px;">
                                                                            Te recomendamos prepararte con los temas técnicos relevantes y revisar nuestras áreas de especialización en el sitio web de Clínicas Oral Care para obtener una comprensión más profunda de nuestros valores y misión.
                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;">&nbsp;</p>
                                                                        <p style="margin:0;font-size:15px;">
                                                                            Si tienes alguna pregunta o necesitas asistencia, no dudes en comunicarte con nuestro equipo de Recursos Humanos.
                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;"><br>
                                                                            Atentamente,<br>
                                                                            <strong>Equipo de Clínicas Oral Care</strong>
                                                                        </p>
                                                                        <p style="margin:0;font-size:15px;">&nbsp;</p>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>';
        
        // Configuración de PHPMailer
        $mail = new PHPMailer(true);

        try {
            // Configuración del servidor
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'ing.jordangarcia@gmail.com'; // Cambia esto por tu correo
            $mail->Password = 'lechdhidrbawrrjm'; // Cambia esto por tu contraseña
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587;

            // Remitente y destinatario
            $mail->setFrom('no-reply@clinicasoralcare.co', 'Clinicas Oral Care');
            $mail->addAddress($to);
            $mail->addReplyTo('contacto@clinicasoralcare.co');

            // Contenido del correo
            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body = $mesaje;

            // Enviar el correo
            if ($mail->send()) {
                echo json_encode(['message' => 'Correo enviado exitosamente al candidato.']);
            } else {
                echo json_encode(['message' => 'Error al enviar el correo.']);
            }
        } catch (Exception $e) {
            echo json_encode(['message' => 'Error al enviar el correo: ' . $mail->ErrorInfo]);
        }
    } else {
        echo json_encode(['message' => 'Candidato no encontrado.']);
    }
}
?>
