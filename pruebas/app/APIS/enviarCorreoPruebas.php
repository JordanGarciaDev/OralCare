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
        $mesaje = '
            <div style="font-family:Arial,Helvetica,sans-serif;font-size:12px;">
                <table width="100%" border="0" cellspacing="0" style="background:#ffffff;border:1px solid #c9c9c9">
                    <tbody>
                        <tr>
                            <td align="right">
                                <img src="https://sgoc.clinicasoralcare.co/OralCare/SGOC/assets/img/avatars/logo.jpg" alt="Logo" style="max-width: 100px;">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <div style="padding: 10px;">
                                    <p>Cordial saludo, ' . $candidato['nombre_completo'] . '.</p>
                                    <p>Dando continuidad a su postulación para el cargo ' . $candidato['nomCargo'] . ' de la empresa Clinicas Oral Care, solicitamos que por favor conteste la(s) siguiente(s) prueba(s)</p>
                                    <p><b>Te informamos que tienes programadas unas pruebas para la entrevista en la fecha: ' . $candidato['fechapro'] . ' a las ' . $candidato['horapro'] . '.</b></p>
                                    <p>Por favor ingresa al siguiente link: <a href="https://sgoc.clinicasoralcare.co/pruebas/" target="_blank">https://sgoc.clinicasoralcare.co/pruebas/</a></p>
                                    <p>El usuario y la contraseña es su número de documento de identidad.</p>
                                    <p>Al hacer click en el link obtendrá más información. Le recomendamos responder la(s) pruebas cuando cuente con suficiente tiempo y un ambiente libre de distracciones.</p>
                                    <p>Saludos,</p>
                                    <p>El equipo de Recursos Humanos</p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>';
        
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
