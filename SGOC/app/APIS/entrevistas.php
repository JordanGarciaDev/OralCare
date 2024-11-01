<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los entrevistas
if ($action == 'fetch') {
    $query = "SELECT *, e.id AS idEntrevista FROM entrevistas e INNER JOIN candidatos em ON e.candidato_id = em.id";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo TITULO AQUI o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $pregunta = $_POST['pregunta'];
    $respuesta = $_POST['respuesta'];
    $empleado_id = $_POST['emp_id'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO entrevistas (candidato_id,pregunta_id,respuesta) VALUES (?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('iis', $empleado_id,$pregunta,$respuesta);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE entrevistas SET candidato_id = ?, pregunta_id = ?, respuesta = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('iisi', $empleado_id, $pregunta, $respuesta, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT * FROM entrevistas WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    echo json_encode($row);
}

// Eliminar
if ($action == 'delete') {
    $id = $_GET['id'];
    $query = "DELETE FROM entrevistas WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}

// Preguntas
if ($action == 'questions') {
    $query = "SELECT p.id AS idPreg, p.pregunta, tp.nombre as tipo FROM preguntas_entrevistas p INNER JOIN tipos_preguntas tp ON p.tpregunta = tp.id";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('status' => 'success', 'data' => $data));
}
// candidatos
if ($action == 'candidatos') {
    $query = "SELECT * FROM candidatos";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('status' => 'success', 'data' => $data));
}
?>
