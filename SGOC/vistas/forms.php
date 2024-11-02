<h3>Lista de Formularios</h3>
<hr class="border-primary">
<div class="col-md-12">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Lista de Formularios</h5>
            </div>
            <div class="card-body">
                <div id="forms-tbl_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
                     </div>
                    <div class="row dt-row">
                        <div class="col-sm-12">
                            <table id="forms-tbl" class="table table-striped dataTable" aria-describedby="forms-tbl_info">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha y Hora</th>
                                    <th>Código</th>
                                    <th>Título</th>
                                    <th>URL</th>
                                    <th>Acción</th>
                                </tr>
                                </thead>
                                <tbody>
            <?php 
            $i = 1;

                $forms = $conn->query("SELECT * FROM `formularios` order by date(date_created) desc");
                while($row = $forms->fetch_assoc()):
            ?>
                <tr>
                    <td class="text-center"><?php echo $i++ ?></td>
                    <td><?php echo date("M d,Y h:i A",strtotime($row['date_created'])) ?></td>
                    <td><?php echo $row['form_code'] ?></td>
                    <td><?php echo $row['title'] ?></td>
                    <td><a href="pruebas.php?code=<?php echo $row['form_code'] ?>">pruebas.php?code=<?php echo $row['form_code'] ?></a></td>
                    <td class='text-center'>
                        <a href="./preguntas_entrevistas.php?p=view_form&code=<?php echo $row['form_code'] ?>" title="Ver Formulario" class="btn btn-sm btn-success edit">
                            <i class="align-middle fas fa-fw fa-eye"></i>
                        </a>
                        <a href="./preguntas_entrevistas.php?p=view_responses&code=<?php echo $row['form_code'] ?>" title="Ver Respuestas" class="btn btn-sm btn-info">
                            <i class="align-middle fas fa-fw fa-comments"></i>
                        </a>
                        <button title="Eliminar Formulario" class="btn btn-sm btn-danger rem_form" data-id="<?php echo $row['form_code'] ?>">
                            <i class="align-middle fas fa-fw fa-trash-alt"></i>
                        </button>
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
        $('.rem_form').click(function(){
            start_loader();
            var _conf = confirm("Realmente deseas eliminar este formulario?")
            if(_conf == true){
                $.ajax({
                    url:'../app/APIS/preguntas_entrevistas.php?a=delete_form',
                    method:'POST',
                    data:{form_code: $(this).attr('data-id')},
                    dataType:'json',
                    error:err=>{
                        console.log(err)
                        alert("a ocurrido un error")
                    },
                    success:function(resp){
                        if(resp.status == 'success'){
                            alert("Datos eliminados correctamente");
                            location.reload()
                        }else{
                            console.log(resp)
                        alert("a ocurrido un error")
                        }
                    }
                })
            }
            end_loader()
        })
    })
</script>