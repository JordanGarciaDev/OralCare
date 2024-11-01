<?php
include('../app/config.php');
$titulo = "Constructor de Formularios";
include(LAYOUT.'/header.php');

$page = isset($_GET['p']) ? $_GET['p'] : "forms";
?>

<div class="wrapper">
    <?php include(LAYOUT.'/sidebar.php'); ?>

    <div class="main">
        <?php include(LAYOUT.'/navbar.php'); ?>

        <main class="content">
            <div class="container-fluid p-0">
                <div class="mb-3">
                    <h1 class="h3 d-inline align-middle"><i class="align-middle me-2 fas fa-fw fa-th-list"></i><?= $titulo; ?></h1>
                    <a href="./preguntas_entrevistas.php?p=manage_forms" class="btn btn-primary float-end">
                        <i class="align-middle me-2 fas fa-fw fa-plus"></i>Crear Nuevo
                    </a>
                </div>

                <!-- Contenido del Constructor de Formularios -->
                <div class="container-fluid">
                    <?php include("./" . $page . ".php"); ?>
                </div>
            </div>
        </main>
    </div>
</div>

<script>
    $(function(){
        var page = "<?php echo $page ?>";
        $('#nav-menu').find(".nav-item.nav-"+page).addClass("active");
    });
</script>

<?php include(LAYOUT.'/footer.php'); ?>
