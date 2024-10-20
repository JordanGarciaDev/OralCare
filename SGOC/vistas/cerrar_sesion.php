<?php
    session_start();
    session_destroy();

    require_once '../app/config.php';

    // Redirigir a la página de login
    header('Location: ' . BASE_URL . '/vistas/login.php');
    exit;
?>
