<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los candidatos
if ($action == 'fetch') {
    $query = "SELECT e.id, e.nombre_completo,ti.nombre AS tipo_doc_nombre, e.tipo_doc, e.num_doc, 
               c.municipio AS ciudad_residencia_nombre, ol.titulo_oferta,
               ca.nombre AS cargo_nombre,   CASE 
           WHEN e.estado = 'candidato' THEN 'Pendiente' 
           WHEN e.estado = 'en_proceso' THEN 'En Proceso' 
           WHEN e.estado = 'no_continua' THEN 'No Continúa' 
           ELSE e.estado 
       END AS estado 
       FROM candidatos AS e
        INNER JOIN municipios AS c ON e.ciudad_residencia = c.id_municipio
        INNER JOIN cargos AS ca ON e.cargo_id = ca.id
        INNER JOIN ofertas_laborales AS ol ON e.oferta_laboral_id = ol.id
        INNER JOIN tipo_identificacion AS ti ON e.tipo_doc = ti.id";

    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    } else {
        echo json_encode(array('error' => $conn->error));
        exit;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo empleado o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['empleadoId']) ? $_POST['empleadoId'] : '';

    // Variables de $_POST

    $fechapro = $_POST['fechapro'];
    $horapro = $_POST['horapro'];
    $estado = $_POST['estado'];

    // Insertar o actualizar en la base de datos
    if ($id == '') {
        $nombre_completo = $_POST['nombre_completo'];
        $tipo_doc = $_POST['tipo_doc'];
        $num_doc = $_POST['num_doc'];
        $lug_exp = $_POST['lug_exp'];
        $fec_nacimiento = $_POST['fec_nacimiento'];
        $nacionalidad = $_POST['nacionalidad'];
        $sexo = $_POST['sexo'];
        $estado_civil = $_POST['estado_civil'];
        $dir_residencia = $_POST['dir_residencia'];
        $barrio_residencia = $_POST['barrio_residencia'];
        $ciudad_residencia = $_POST['ciudad_residencia'];
        $tel_movil = $_POST['tel_movil'];
        $email_personal = $_POST['email_personal'];
        $cargo_id = $_POST['cargo_id'];
        $tipo_sangre = $_POST['tipo_sangre'];
        $estado = "candidato"; // Candidato

        $query = "INSERT INTO candidatos (nombre_completo, tipo_doc, num_doc, lug_exp, fec_nacimiento, nacionalidad, sexo, estado_civil, dir_residencia, barrio_residencia, ciudad_residencia, tel_movil, email_personal, cargo_id, tipo_sangre, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('siiisssissiisisi', $nombre_completo, $tipo_doc, $num_doc, $lug_exp, $fec_nacimiento, $nacionalidad, $sexo, $estado_civil, $dir_residencia, $barrio_residencia, $ciudad_residencia, $tel_movil, $email_personal, $cargo_id, $tipo_sangre, $estado);
        $stmt->execute();
        $stmt->close();
    }
    else {

        // Actualizar el estado
        $query = "UPDATE candidatos SET estado = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $estado, $id);
        $stmt->execute();
        $stmt->close();


        if ($estado == 'en_proceso') {
            // Obtener datos del candidato
            $query = "SELECT * FROM candidatos WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $result = $stmt->get_result();
            $candidato = $result->fetch_assoc();
            $stmt->close();

//            // Insertar en la tabla de empleados
//            $query = "INSERT INTO empleados (nombre_completo, tipo_doc, num_doc, lug_exp, fec_nacimiento, nacionalidad, sexo, estado_civil, dir_residencia, barrio_residencia, ciudad_residencia, tel_movil, email_personal, cargo_id, tipo_sangre, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//            $stmt = $conn->prepare($query);
//            $stmt->bind_param('siiisssissiisiss', $candidato['nombre_completo'], $candidato['tipo_doc'], $candidato['num_doc'], $candidato['lug_exp'], $candidato['fec_nacimiento'], $candidato['nacionalidad'], $candidato['sexo'], $candidato['estado_civil'], $candidato['dir_residencia'], $candidato['barrio_residencia'], $candidato['ciudad_residencia'], $candidato['tel_movil'], $candidato['email_personal'], $candidato['cargo_id'], $candidato['tipo_sangre'], $estado);
//            $stmt->execute();
//            $empleado_id = $conn->insert_id;
//            $stmt->close();

            // Insertar en la tabla de programación de entrevistas
            $query = "INSERT INTO programacion_entrevistas (candidato_id, cargo_id, fechapro, horapro) VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('iiss', $candidato['id'], $candidato['cargo_id'], $fechapro, $horapro);
            $stmt->execute();
            $stmt->close();
        }

        if ($estado == 'no_continua') {
            $query = "DELETE FROM programacion_entrevistas WHERE candidato_id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('i', $id);
            $stmt->execute();
            $stmt->close();
        }
    }

    echo json_encode(array('status' => 'success'));
}


// Editar (obtener un empleado por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT e.*,e.id AS empleadoId,ti.nombre AS tipo_doc_nombre,c.municipio AS ciudad_residencia_nombre,ca.nombre AS cargo_nombre
        FROM candidatos AS e
        INNER JOIN municipios AS c ON e.ciudad_residencia = c.id_municipio
        INNER JOIN cargos AS ca ON e.cargo_id = ca.id
        INNER JOIN tipo_identificacion AS ti ON e.tipo_doc = ti.id
        WHERE e.id = ?";

    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    if ($row) {
        echo json_encode($row);
    } else {
        echo json_encode(array('error' => 'No se encontró el empleado.'));
    }
}

// Eliminar
if ($action == 'delete') {
    $id = $_GET['id'];
    $query = "DELETE FROM candidatos WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}

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

// Obtener tipos de documentos
if ($action == 'tipos_documentos') {
    $query = "SELECT id, nombre FROM tipos_documentos";
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
if ($action == 'lugar_exp') {
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

// Obtener cargos
if ($action == 'cargos') {
    $query = "SELECT id, nombre FROM cargos";
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
?>
