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
    $id = isset($_POST['empleadoId']) ? $_POST['empleadoId'] : '';
    // Variables de $_POST
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
    $email_empresarial = $_POST['email_empresarial'];
    $cargo_id = $_POST['cargo_id'];
    $salario = $_POST['salario'];
    $fingreso = $_POST['fingreso'];
    $fretiro = $_POST['fretiro'];
    $tipo_sangre = $_POST['tipo_sangre'];

    // Insertar o actualizar en la base de datos
    if ($id == '') {
        $estado = 2; // Candidato

        // Crear nuevo registro
        $query = "INSERT INTO empleados (nombre_completo, tipo_doc, num_doc, lug_exp, fec_nacimiento, nacionalidad, sexo, estado_civil, dir_residencia, barrio_residencia, ciudad_residencia, tel_movil, email_personal, email_empresarial, cargo_id, salario, fingreso, fretiro, tipo_sangre, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param(
            'siiisssissiissiisssi',
            $nombre_completo,$tipo_doc,$num_doc,$lug_exp,$fec_nacimiento,$nacionalidad,$sexo,$estado_civil,$dir_residencia,$barrio_residencia,$ciudad_residencia,$tel_movil,$email_personal,$email_empresarial,$cargo_id,$salario,$fingreso,$fretiro,$tipo_sangre,$estado);
        $stmt->execute();
        $stmt->close();
    }
    else {
        $estado = $_POST['estado']; // Se cambia a 0 Activo ó sino 1 que es activo

        // Actualizar registro existente
        $query = "UPDATE empleados SET nombre_completo = ?, tipo_doc = ?, num_doc = ?, lug_exp = ?, fec_nacimiento = ?, nacionalidad = ?, sexo = ?, estado_civil = ?, dir_residencia = ?, barrio_residencia = ?, ciudad_residencia = ?, tel_movil = ?, email_personal = ?, email_empresarial = ?, cargo_id = ?, salario = ?, fingreso = ?, fretiro = ?, tipo_sangre = ?, estado = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param(
            'sssisssisssissisissii',
            $nombre_completo,
            $tipo_doc,
            $num_doc,
            $lug_exp,
            $fec_nacimiento,
            $nacionalidad,
            $sexo,
            $estado_civil,
            $dir_residencia,
            $barrio_residencia,
            $ciudad_residencia,
            $tel_movil,
            $email_personal,
            $email_empresarial,
            $cargo_id,
            $salario,
            $fingreso,
            $fretiro,
            $tipo_sangre,
            $estado,
            $id
        );
        $stmt->execute();
        $stmt->close();
    }
    echo json_encode(array('status' => 'success'));
}


// Editar (obtener un empleado por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT e.*,e.id AS empleadoId,ti.nombre AS tipo_doc_nombre,c.municipio AS ciudad_residencia_nombre,ca.nombre AS cargo_nombre
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
