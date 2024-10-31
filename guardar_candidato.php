<?php
header('Content-Type: application/json');

require_once("./SGOC/app/config.php");

//$response = ['success' => false, 'message' => ''];

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener tipos de identificacion
if ($action == 'tipo_identificacion') {
    $query = "SELECT id, nombre FROM tipo_identificacion ORDER BY nombre ASC";
    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        echo json_encode(array('error' => $conn->error));
    }
}

// Obtener ciudades
if ($action == 'ciudades') {
    $query = "SELECT id_municipio, municipio FROM municipios";
    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        echo json_encode(array('error' => $conn->error));
    }
}

// Obtener estado_civil
if ($action == 'estados_civil') {
    $query = "SELECT id, nombre FROM estados_civiles";
    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
    } else {
        echo json_encode(array('error' => $conn->error));
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombreCompleto = $_POST['nombre_completo'];
    $tipoDoc = $_POST['ddlTipoIdentificacion'];
    $numDoc = $_POST['txtNumeroIdentificacion'];
    $lugExp = $_POST['lug_exp'];
    $fecNacimiento = $_POST['fec_nacimiento'];
    $nacionalidad = $_POST['nacionalidad'];
    $sexo = $_POST['sexo'];
    $estadoCivil = $_POST['estado_civil'];
    $dirResidencia = $_POST['dir_residencia'];
    $barrioResidencia = $_POST['barrio_residencia'];
    $ciudadResidencia = $_POST['ciudad_residencia'];
    $telMovil = $_POST['tel_movil'];
    $emailPersonal = $_POST['email_personal'];
    $emailEmpresarial = $_POST['email_empresarial'];
    $tipoSangre = $_POST['tipo_sangre'];
    
	$rutaCarpeta = __DIR__ . '/uploads/OfertasLaborales/cv/';
	$nombreArchivo = str_replace(' ', '_', $nombreCompleto) . '-' . $numDoc . '.' . pathinfo($_FILES['hoja_vida']['name'], PATHINFO_EXTENSION);
    $rutaArchivo = $rutaCarpeta . $nombreArchivo;

    if (move_uploaded_file($_FILES['hoja_vida']['tmp_name'], $rutaArchivo)) {
        $cv = $rutaArchivo;
    } else {
        $response['message'] = "Error al subir el archivo.";
        echo json_encode($response);
        exit;
    }

    $sql = "INSERT INTO candidatos (nombre_completo, tipo_doc, num_doc, lug_exp, fec_nacimiento, nacionalidad, sexo, estado_civil, dir_residencia, barrio_residencia, ciudad_residencia, tel_movil, email_personal, email_empresarial, tipo_sangre, cv, estado)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'candidato')";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
        "sissssssssisssss",
        $nombreCompleto, $tipoDoc, $numDoc, $lugExp, $fecNacimiento, $nacionalidad, $sexo, $estadoCivil, $dirResidencia, $barrioResidencia, $ciudadResidencia, $telMovil, $emailPersonal, $emailEmpresarial, $tipoSangre, $cv
    );

    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = "Candidato guardado exitosamente.";
		echo json_encode($response);
    } else {
        $response['message'] = "Error al guardar los datos: " . $stmt->error;
		echo json_encode($response);
    }

    $stmt->close();
    $conn->close();
}

?>