<?php
include('../app/config.php');
$titulo = "Empleados"; // Título específico para esta vista
include(LAYOUT . '/header.php');
?>
<div class="wrapper">
    <?php include(LAYOUT . '/sidebar.php');?>

    <div class="main">
        <?php include(LAYOUT . '/navbar.php');?>

        <main class="content">
            <div class="tab">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="#tab-1" data-bs-toggle="tab" role="tab" aria-selected="true">Datos personales</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#tab-2" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">Entrevista de trabajo</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#tab-3" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">Pruebas Técnicas</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active show" id="tab-1" role="tabpanel">
                        <!--     se agrega div primero de datos personales -->
                        <?php
                        include(VIEW.'/crud_empleados.php');
                        ?>
                        <!--     fin div primero de datos personales -->
                    </div>
                    <div class="tab-pane" id="tab-2" role="tabpanel">
                        <?php
                        include(VIEW.'/crud_entrevistas.php');
                        ?>

                    </div>
                    <div class="tab-pane" id="tab-3" role="tabpanel">
                        <p>TERCER DIV</p>

                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<?php
include(LAYOUT . '/footer.php');
?>
