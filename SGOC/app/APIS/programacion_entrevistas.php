<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los programacion_entrevistas
if ($action == 'fetch') {
    $query = "SELECT *, e.id AS idEntrevista FROM programacion_entrevistas e INNER JOIN empleados em ON e.empleado_id = em.id";
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
    $fechapro = $_POST['fechapro'];
    $horapro = $_POST['horapro'];
    $empleado_id = $_POST['emp_id'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO programacion_entrevistas (empleado_id,fechapro,horapro) VALUES (?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('iis', $empleado_id,$fechapro,$horapro);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE programacion_entrevistas SET empleado_id = ?, fechapro = ?, horapro = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('iisi', $empleado_id, $fechapro, $horapro, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT * FROM programacion_entrevistas WHERE id = ?";
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
    $query = "DELETE FROM programacion_entrevistas WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}

// Empleados
if ($action == 'empleados') {
    $query = "SELECT * FROM empleados";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('status' => 'success', 'data' => $data));
}
?>
