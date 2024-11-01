<?php
// Inicia la sesión
session_start();

// Incluye el archivo de configuración
include('app/config.php');

// Verifica si el usuario está logueado
if (!isset($_SESSION['user_logged_in']) || $_SESSION['user_logged_in'] !== true) {
    // Redirige al login si no está logueado
    header("Location: " . VIEW . "/login.php");
    exit();
} else {
    // Si está logueado, redirige al dashboard
    header("Location: " . VIEW . "/dashboard.php");
    exit();
}
?>
