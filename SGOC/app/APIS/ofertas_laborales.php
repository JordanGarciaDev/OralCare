<?php
include('../../app/config.php');
header('Content-Type: application/json');
session_start();

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los ofertas_laborales
if ($action == 'fetch') {
    $query = "SELECT *, o.id AS idOferta, dc.nombre AS departamentoNom, cg.nombre AS cargoNom FROM ofertas_laborales o INNER JOIN dep_contratacion dc ON o.depto_id = dc.id INNER JOIN cargos cg ON o.cargo_id = cg.id INNER JOIN tipos_contratos tc ON o.tipo_contrato = tc.id";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo TITULO AQUI o actualizar uno existente
if ($action == 'save') {
    $documentoUrl = null;
    $response = [];

    if (isset($_FILES['documento']) && $_FILES['documento']['error'] == 0) {
        $documento = $_FILES['documento'];

        // Validar el tipo de archivo (solo imágenes permitidas)
        $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'application/pdf'];

        if (in_array($documento['type'], $allowedTypes)) {
            $targetDir = $_SERVER['DOCUMENT_ROOT'] . '/OralCare/SGOC/uploads/OfertasLaborales/';  // Carpeta donde se guardarán las documentos
            $extension = pathinfo($documento['name'], PATHINFO_EXTENSION);
            $nuevoNombre = uniqid() . '.' . $extension; // Generar un nuevo nombre único

            // Intentar mover la imagen
            if (move_uploaded_file($documento['tmp_name'], $targetDir . $nuevoNombre)) {
                $documentoUrl = $nuevoNombre;
                $_SESSION['documentousuario'] = $documentoUrl;
                $response['documento'] = $documentoUrl;
            } else {
                $response['error'] = 'Error al subir la documento';
            }
        } else {
            echo json_encode(['error' => 'Formato de imagen no permitido']);
            exit();
        }
    }
    
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $titulo_oferta = $_POST['titulo'];
    $beneficios_oferta = $_POST['beneficios'];
    $condiciones_oferta = $_POST['condiciones'];
    $depto_id = $_POST['depto_id'];
    $tipo_contrato = $_POST['tipo_contrato_id'];
    $salario = $_POST['salario'];
    $estado = $_POST['estado'];
    if ($estado == "Activo" ) {
        $estado == 1;
    }
    else {
        $estado == 0;
    }
    $usu_reg = $_SESSION['userId'];


    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO ofertas_laborales (titulo_oferta,beneficios_oferta,condiciones_oferta,depto_id,tipo_contrato,salario,documento,estado,usu_reg) VALUES (?,?,?,?,?,?,?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sssiiisii', $titulo_oferta,$beneficios_oferta,$condiciones_oferta,$depto_id,$tipo_contrato,$salario,$documentoUrl,$estado,$usu_reg);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        // Construcción de la consulta
        if ($documentoUrl) {
            $query = "UPDATE ofertas_laborales SET titulo_oferta = ?, beneficios_oferta = ?, condiciones_oferta = ?, depto_id = ?, tipo_contrato = ?, salario = ?, documento = ?, estado = ?, usu_reg = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('sssiiisiii', $titulo_oferta, $beneficios_oferta, $condiciones_oferta, $depto_id, $tipo_contrato, $salario, $documentoUrl, $estado, $usu_reg, $id);
        } else {
            $query = "UPDATE ofertas_laborales SET titulo_oferta = ?, beneficios_oferta = ?, condiciones_oferta = ?, depto_id = ?, tipo_contrato = ?, salario = ?, estado = ?, usu_reg = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('sssiiisii', $titulo_oferta, $beneficios_oferta, $condiciones_oferta, $depto_id, $tipo_contrato, $salario, $estado, $usu_reg, $id);
        }

// Ejecutar la consulta
        $stmt->execute();

// Cerrar la declaración
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT *, o.id AS idOferta, dc.nombre AS departamentoNom FROM ofertas_laborales o INNER JOIN dep_contratacion dc ON o.depto_id = dc.id INNER JOIN tipos_contratos tc ON o.tipo_contrato = tc.id WHERE o.id = ?";
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
    $query = "DELETE FROM ofertas_laborales WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}

// Departamentos
if ($action == 'departamentos') {
    $query = "SELECT * FROM dep_contratacion";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('status' => 'success', 'data' => $data));
}


// tipos contratos
if ($action == 'tipos_contratos') {
    $query = "SELECT * FROM tipos_contratos";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('status' => 'success', 'data' => $data));
}
?>
