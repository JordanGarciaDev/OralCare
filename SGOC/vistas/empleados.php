<?php
	include('../app/config.php');
    $titulo = "Empleados"; // Título específico para esta vista
    include(LAYOUT.'/header.php');
?>
			<div class="wrapper">
			<?php include(LAYOUT .'/sidebar.php');?>

			<div class="main">
			<?php include(LAYOUT .'/navbar.php');?>

                <main class="content">
                    <div class="container-fluid p-0">

                        <div class="mb-3">
                            <h1 class="h3 d-inline align-middle">Formulario de aspirantes</h1>
                        </div>

                        <div class="row">
                            <div class="col-12 col-xl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Datos Básicos</h5>
                                        <h6 class="card-subtitle text-muted">Escriba aqui los datos personales del postulante/aspirante</h6>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <label class="form-label">Nombres</label>
                                                <input type="text" class="form-control" placeholder="Escriba el nombre del aspirante">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Apellidos</label>
                                                <input type="text" class="form-control" placeholder="Escriba el apellido del aspirante">
                                            </div>
                                            <fieldset class="mb-3">
                                                <div class="row">
                                                    <label class="col-form-label col-sm-2 text-sm-end pt-sm-0">Sexo</label>
                                                    <div class="col-sm-10">
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input" checked="">
                                                            <span class="form-check-label">Masculino</span>
                                                        </label>
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input">
                                                            <span class="form-check-label">Femenino</span>
                                                        </label>
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input">
                                                            <span class="form-check-label">No especifica</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="mb-3">
                                                <label class="form-label">Dirección</label>
                                                <input type="text" class="form-control" placeholder="Escriba la dirección del aspirante">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Barrio</label>
                                                <input type="text" class="form-control" placeholder="Escriba el barrio del aspirante">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Correo</label>
                                                <input type="email" class="form-control" placeholder="Escriba el correo del aspirante">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Celular</label>
                                                <input type="email" class="form-control" placeholder="Escriba el celular del aspirante">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Foto del aspirante</label>
                                                <input class="form-control" type="file">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-check m-0">
                                                    <input type="checkbox" class="form-check-input">
                                                    <span class="form-check-label">Acepta el tratamiento de sus datos personales</span>
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-6">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Datos del contrato</h5>
                                        <h6 class="card-subtitle text-muted">Escriba aqui los datos del contrato.</h6>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3 row">
                                                <label class="col-form-label col-sm-2 text-sm-end">Salario</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="Escriba el salario">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <label class="col-form-label col-sm-2 text-sm-end">Fecha de ingreso</label>
                                                <div class="col-sm-10">
                                                    <input type="date" class="form-control" placeholder="DD-MM-AAAA">
                                                </div>
                                            </div>


                                            <fieldset class="mb-3">
                                                <div class="row">
                                                    <label class="col-form-label col-sm-2 text-sm-end pt-sm-0">Radios</label>
                                                    <div class="col-sm-10">
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input" checked>
                                                            <span class="form-check-label">Default radio</span>
                                                        </label>
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input">
                                                            <span class="form-check-label">Second default radio</span>
                                                        </label>
                                                        <label class="form-check">
                                                            <input name="radio-3" type="radio" class="form-check-input" disabled>
                                                            <span class="form-check-label">Disabled radio</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="mb-3 row">
                                                <label class="col-form-label col-sm-2 text-sm-end pt-sm-0">Checkbox</label>
                                                <div class="col-sm-10">
                                                    <label class="form-check m-0">
                                                        <input type="checkbox" class="form-check-input">
                                                        <span class="form-check-label">Check me out</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-10 ms-sm-auto">
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Form row</h5>
                                        <h6 class="card-subtitle text-muted">Bootstrap column layout.</h6>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputEmail4">Email</label>
                                                    <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputPassword4">Password</label>
                                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="inputAddress">Address</label>
                                                <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="inputAddress2">Address 2</label>
                                                <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                                            </div>
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputCity">City</label>
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                                <div class="mb-3 col-md-4">
                                                    <label class="form-label" for="inputState">State</label>
                                                    <select id="inputState" class="form-control">
                                                        <option selected>Choose...</option>
                                                        <option>...</option>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-2">
                                                    <label class="form-label" for="inputZip">Zip</label>
                                                    <input type="text" class="form-control" id="inputZip">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" class="form-check m-0">
                                                    <input type="checkbox" class="form-check-input">
                                                    <span class="form-check-label">Check me out</span>
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Inline form</h5>
                                        <h6 class="card-subtitle text-muted">Single horizontal row.</h6>
                                    </div>
                                    <div class="card-body">
                                        <form class="row row-cols-md-auto align-items-center">
                                            <div class="col-12">
                                                <label class="visually-hidden" for="inlineFormInputName2">Name</label>
                                                <input type="text" class="form-control mb-2 me-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">
                                            </div>

                                            <div class="col-12">
                                                <label class="visually-hidden" for="inlineFormInputGroupUsername2">Username</label>
                                                <div class="input-group mb-2 me-sm-2">
                                                    <div class="input-group-text">@</div>
                                                    <input type="text" class="form-control" id="inlineFormInputGroupUsername2" placeholder="Username">
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-check mb-1 me-sm-2">
                                                    <input type="checkbox" class="form-check-input" id="customControlInline">
                                                    <label class="form-check-label" for="customControlInline">Remember me</label>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-primary mb-2">Submit</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </main>

		</div>
	</div>

<?php
 include(LAYOUT.'/footer.php');
 ?>