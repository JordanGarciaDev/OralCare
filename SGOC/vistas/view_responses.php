<h5>Respuesta de la prueba/entrevista #<?php echo $_GET['code'] ?></h5>
<hr class="border-primary">
<div class="col-md-12">
    <table id="forms-tbl" class="table table-stripped">
        <thead>
            <tr>
                <th>#</th>
                <th>Fecha y Hora Finalización</th>
                <th>Tiempo</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $i = 1;
                $forms = $conn->query("SELECT * FROM `formularios_opciones` where form_code = '".$_GET['code']."' order by date(date_created)");
                while($row = $forms->fetch_assoc()):
            ?>
                <tr>
                    <td class="text-center"><?php echo $i++ ?></td>
                    <td><?php echo date("M d,Y h:i A",strtotime($row['date_created'])) ?></td>
                    <td><?php $tiempo = $row['tiempo'];
                        echo $tiempo == 1 ? "$tiempo minuto" : "$tiempo minutos"; ?> </td>
                    <td>
                        <a href="preguntas_entrevistas.php?p=view_response&code=<?php echo $row['form_code'] ?>&id=<?php echo $row['id'] ?>" class="btn btn-primary border"><i class="align-middle fas fa-eye"></i> Ver</a>
                    </td>
                </tr>
            <?php endwhile;  ?>
        </tbody>
    </table>
</div>
<script>
    $(function(){
        $('#forms-tbl').dataTable(
            {"language": {
                    "url": "<?= API ?>languages/Spanish.json"
                }
            });
    })
</script>