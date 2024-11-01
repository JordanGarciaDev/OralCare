<?php

include('../../app/config.php');

class PreguntasEntrevistaAPI {
    private $conn;

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function fetch() {
        $query = "SELECT *, p.id AS idPreg, tp.nombre as tipo 
                  FROM preguntas_entrevistas p 
                  INNER JOIN tipos_preguntas tp ON p.tpregunta = tp.id";
        $result = $this->conn->query($query);
        $data = array();

        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        echo json_encode(array('data' => $data));
    }

    public function save() {
        $id = isset($_POST['id']) ? $_POST['id'] : '';
        $pregunta = $_POST['pregunta'];
        $tpregunta = $_POST['tpregunta'];

        if (empty($id)) {
            $query = "INSERT INTO preguntas_entrevistas (pregunta, tpregunta) VALUES (?, ?)";
            $stmt = $this->conn->prepare($query);
            $stmt->bind_param('si', $pregunta, $tpregunta);
        } else {
            $query = "UPDATE preguntas_entrevistas SET pregunta = ?, tpregunta = ? WHERE id = ?";
            $stmt = $this->conn->prepare($query);
            $stmt->bind_param('sii', $pregunta, $tpregunta, $id);
        }

        $stmt->execute();
        $stmt->close();

        echo json_encode(array('status' => 'success'));
    }

    public function edit() {
        $id = $_GET['id'];
        $query = "SELECT *, p.id AS idPreg, tp.nombre as tipo 
                  FROM preguntas_entrevistas p 
                  INNER JOIN tipos_preguntas tp ON p.tpregunta = tp.id 
                  WHERE p.id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        echo json_encode($row);
    }

    public function delete() {
        $id = $_GET['id'];
        $query = "DELETE FROM preguntas_entrevistas WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bind_param('i', $id);
        $stmt->execute();

        echo json_encode(array('status' => 'success'));
    }
}

// Inicializar la API y manejar las acciones
$api = new PreguntasEntrevistaAPI($conn);
$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action) {
    case 'fetch':
        $api->fetch();
        break;
    case 'save':
        $api->save();
        break;
    case 'edit':
        $api->edit();
        break;
    case 'delete':
        $api->delete();
        break;
    default:
        echo json_encode(array('status' => 'error', 'message' => 'Acción no válida.'));
        break;
}
?>
