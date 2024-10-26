<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los empleados
if ($action == 'fetch') {
    $query = "SELECT e.id, e.nombre_completo,ti.nombre AS tipo_doc_nombre, e.tipo_doc, e.num_doc, 
               c.municipio AS ciudad_residencia_nombre, 
               ca.nombre AS cargo_nombre
        FROM empleados AS e
        INNER JOIN municipios AS c ON e.ciudad_residencia = c.id_municipio
        INNER JOIN cargos AS ca ON e.cargo_id = ca.id
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
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombre_completo = $_POST['nombre_completo'];
    $tipo_doc = $_POST['tipo_doc'];
    $num_doc = $_POST['num_doc'];
    $ciudad_residencia = $_POST['ciudad_residencia'];
    $cargo_id = $_POST['cargo_id'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO empleados (nombre_completo, tipo_doc, num_doc, ciudad_residencia, cargo_id) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('ssssi', $nombre_completo, $tipo_doc, $num_doc, $ciudad_residencia, $cargo_id);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE empleados SET nombre_completo = ?, tipo_doc = ?, num_doc = ?, ciudad_residencia = ?, cargo_id = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sssiii', $nombre_completo, $tipo_doc, $num_doc, $ciudad_residencia, $cargo_id, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un empleado por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT e.*,ti.nombre AS tipo_doc_nombre,c.municipio AS ciudad_residencia_nombre,ca.nombre AS cargo_nombre
        FROM empleados AS e
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
    $query = "DELETE FROM empleados WHERE id = ?";
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
