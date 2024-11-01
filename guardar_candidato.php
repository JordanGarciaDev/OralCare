<?php
require_once("./SGOC/app/config.php");

header('Content-Type: application/json');

$response = ["success" => false, "message" => ""];

$action = isset($_GET['action']) ? $_GET['action'] : '';

if ($action == 'tipo_identificacion') {
    $query = "SELECT id, nombre FROM tipo_identificacion ORDER BY nombre ASC";
    $result = $conn->query($query);
    $data = [];

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
        exit;
    } else {
        echo json_encode(["error" => $conn->error]);
        exit;
    }
}

if ($action == 'ciudades') {
    $query = "SELECT id_municipio, municipio FROM municipios";
    $result = $conn->query($query);
    $data = [];

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
        exit;
    } else {
        echo json_encode(["error" => $conn->error]);
        exit;
    }
}

if ($action == 'estados_civil') {
    $query = "SELECT id, nombre FROM estados_civiles";
    $result = $conn->query($query);
    $data = [];

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode($data);
        exit;
    } else {
        echo json_encode(["error" => $conn->error]);
        exit;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recopilar y procesar datos de entrada
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
    $oferta_laboral_id = $_POST['oferta_laboral_id'];
    $telMovil = $_POST['tel_movil'];
    $emailPersonal = $_POST['email_personal'];
    $tipoSangre = $_POST['tipo_sangre'];

    $rutaCarpeta = __DIR__ . '/SGOC/uploads/OfertasLaborales/cv/';
    $nombreArchivo = str_replace(' ', '_', $nombreCompleto) . '-' . $numDoc . '.' . pathinfo($_FILES['hoja_vida']['name'], PATHINFO_EXTENSION);
    $rutaArchivo = $rutaCarpeta . $nombreArchivo;


    if (move_uploaded_file($_FILES['hoja_vida']['tmp_name'], $rutaArchivo)) {
        $cv = $rutaArchivo;
    } else {
        $response['message'] = "Error al subir el archivo. En la carpeta " . $rutaCarpeta;
        echo json_encode($response);
        exit;
    }

    $sql = "INSERT INTO candidatos (oferta_laboral_id,nombre_completo, tipo_doc, num_doc, lug_exp, fec_nacimiento, nacionalidad, sexo, estado_civil, dir_residencia, barrio_residencia, ciudad_residencia, tel_movil, email_personal, tipo_sangre, cv, estado)
            VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'candidato')";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
        "isissssssssissss",
        $oferta_laboral_id,$nombreCompleto, $tipoDoc, $numDoc, $lugExp, $fecNacimiento, $nacionalidad, $sexo, $estadoCivil, $dirResidencia, $barrioResidencia, $ciudadResidencia, $telMovil, $emailPersonal, $tipoSangre, $cv
    );

    if ($stmt->execute()) {
        $response["success"] = true;
        $response["message"] = "Tus datos para esta oferta laboral han sido enviados con exito!.";
    } else {
        $response["message"] = "Error al guardar los datos: " . $stmt->error;
    }
    echo json_encode($response);
    exit;
}
