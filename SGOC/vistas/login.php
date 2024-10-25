<?php

session_start();
include('../app/config.php');
$titulo = "Iniciar Sesión"; // Título específico para esta vista
include(LAYOUT . '/header.php');

// Hashear una contraseña para probar en SGOC
$password = "123";
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
//echo $hashedPassword;

$_SESSION['user_logged_in']  = false; // Guardar que está logueado

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    // Consultar a la base de datos
    $query = "SELECT *,c.nombre AS nomcargo, u.id AS idUser FROM usuarios u INNER JOIN cargos c ON u.cargo_id = c.id WHERE usuario = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('s', $usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Obtener los datos del usuario
        $infoUsuario = $result->fetch_assoc();

        // Verificar la contraseña
        if (password_verify($password, $infoUsuario['pass'])) {

            // Aqui se agregan todas las variables globales que van a usarse en el sistema
            $_SESSION['usuario'] = $usuario; // Guardar el usuario en la sesión
            $_SESSION['userId'] = $infoUsuario['idUser'];

            if (empty($infoUsuario['foto'])) {
                $_SESSION['fotousuario'] = "default.png"; // Si no hay foto, asigna la imagen predeterminada
            } else {
                $_SESSION['fotousuario'] = $infoUsuario['foto']; // Si hay foto, asigna la foto del usuario
            }

            $_SESSION['fecharegusuario'] = $infoUsuario['fecha']; // Guardar el usuario en la sesión
            $_SESSION['nomusuario'] = $infoUsuario['nombres'].' '.$infoUsuario['apellidos']; // Guardar el nombre del usuario en la sesión
            $_SESSION['cargo']  = $infoUsuario['cargo_id']; // Guardar el perfil en la sesión
            $_SESSION['nomcargo']  = $infoUsuario['nomcargo']; // Guardar el nombre del perfil en la sesión
            $_SESSION['user_logged_in']  = true; // Guardar que está logueado

            header("Location: " . BASE_URL . '/vistas/dashboard.php'); // Redirigir a dashboard
            exit();
        } else {
            $alert = "El usuario o la clave son incorrectos.";
        }
    } else {
        $alert = "No existe ningun usuario con estas credenciales";
    }

    $stmt->close();
}

$conn->close();
?>
<style>
    .card {
        box-shadow: 0 0 .875rem 0 rgba(33, 37, 41, .05);
        margin-bottom: -231px;
        background-color: #deb88700;
        border-radius: 50%;
    }
    .fondo {
        background-image: url('<?= ASSET_URL; ?>/img/avatars/fondo.webp');
        background-repeat: no-repeat;
        background-position: center;
        z-index: -1;
        height: 114%;
    }
    @media (min-width: 1200px) {
        .container, .container-lg, .container-md, .container-sm, .container-xl {
            max-width: 860px;
        }
    }
</style>
<main class="d-flex w-100 fondo">
    <div class="container d-flex flex-column">
        <div class="row vh-100">
            <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                <div class="d-table-cell align-middle">

                    <div class="text-center mt-4">
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="m-sm-4">
                                <div class="text-center">
                                    <img src="<?= ASSET_URL ?>/img/avatars/logo.jpg" alt="SGOC" class="img-fluid rounded-circle" width="132" height="132" />
                                </div>
                                <h2 class="mt-5 text-center text-white">Iniciar Sesión</h2>
                                <?php if (isset($alert)): ?>
                                    <div class="alert alert-danger" role="alert">
                                        <?= $alert; ?>
                                    </div>
                                <?php endif; ?>
                                <form method="POST">
                                    <div class="mb-3">
                                        <label class="form-label text-white">Usuario</label>
                                        <input class="form-control form-control-lg" type="text" name="usuario" placeholder="Ingrese su usuario" required />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label text-white">Contraseña</label>
                                        <input class="form-control form-control-lg" type="password" name="password" placeholder="Ingrese su contraseña" required />
                                        <small class="text-center">
                                            <a href="pages-reset-password.html">¿Has olvidado tu contraseña?</a>
                                        </small>
                                    </div>
                                    <div>
                                        <label class="form-check">
                                            <input class="form-check-input" type="checkbox" value="remember-me" name="remember-me" checked>
                                            <span class="form-check-label text-white">
                                                Recuérdame la próxima vez
                                            </span>
                                        </label>
                                    </div>
                                    <div class="text-center mt-3">
                                        <button type="submit" class="btn btn-lg btn-primary">Ingresar</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <p style="position: fixed;right: 0;bottom: 0;">
            <span style="margin-left: 30%;font-weight: bold;"> ..:: S.G.O.C. ::..</span>
            <br>(Sistema de Gestión Oral Care) <sup>
                <small class="badge bg-primary text-uppercase">V.1.0</small>
            </sup>
        </p>
    </div>
</main>

<?php
include(LAYOUT . '/footer.php');
?>
