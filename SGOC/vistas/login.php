<?php
session_start(); 
include('../app/config.php');
include(LAYOUT . '/header.php');

// Hashear una contraseña para probar en SGOC
$password = "123";
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
//echo $hashedPassword;


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos del formulario
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    // Consultar a la base de datos
    $query = "SELECT * FROM usuarios WHERE usuario = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('s', $usuario);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Obtener los datos del usuario
        $usuarioData = $result->fetch_assoc();

        // Verificar la contraseña
        if (password_verify($password, $usuarioData['pass'])) {
            // Las credenciales son correctas
            $_SESSION['usuario'] = $usuario; // Guardar el usuario en la sesión
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

<main class="d-flex w-100">
    <div class="container d-flex flex-column">
        <div class="row vh-100">
            <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                <div class="d-table-cell align-middle">

                    <div class="text-center mt-4">
                        <h1 class="h2">Welcome back, Charles</h1>
                        <p class="lead">
                            Sign in to your account to continue
                        </p>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="m-sm-4">
                                <div class="text-center">
                                    <img src="<?= ASSET_URL ?>/img/avatars/avatar.jpg" alt="Charles Hall" class="img-fluid rounded-circle" width="132" height="132" />
                                </div>
                                <h2 class="mt-5 text-center">Iniciar Sesión</h2>
                                <?php if (isset($alert)): ?>
                                    <div class="alert alert-danger" role="alert">
                                        <?= $alert; ?>
                                    </div>
                                <?php endif; ?>
                                <form method="POST">
                                    <div class="mb-3">
                                        <label class="form-label">Usuario</label>
                                        <input class="form-control form-control-lg" type="text" name="usuario" placeholder="Enter your email" required />
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Contraseña</label>
                                        <input class="form-control form-control-lg" type="password" name="password" placeholder="Enter your password" required />
                                        <small>
                                            <a href="pages-reset-password.html">Forgot password?</a>
                                        </small>
                                    </div>
                                    <div>
                                        <label class="form-check">
                                            <input class="form-check-input" type="checkbox" value="remember-me" name="remember-me" checked>
                                            <span class="form-check-label">
                                                Remember me next time
                                            </span>
                                        </label>
                                    </div>
                                    <div class="text-center mt-3">
                                        <button type="submit" class="btn btn-lg btn-primary">Sign in</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>

<?php
include(LAYOUT . '/footer.php');
?>
