<?php
	include('../app/config.php');
	include(LAYOUT.'/header.php');
?>
			<div class="wrapper">
			<?php include(LAYOUT .'/sidebar.php');?>

			<div class="main">
			<?php include(LAYOUT .'/navbar.php');?>

                <div class="container-fluid p-0">

                    <h1 class="h3 mb-3">Perfil</h1>

                    <div class="row">
                        <div class="col-md-4 col-xl-2">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Detalles de perfil</h5>
                                </div>
                                <div class="card-body text-center">
                                    <img src="img/avatars/avatar-4.jpg" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128">
                                    <h5 class="card-title mb-0">Christina Mason</h5>
                                    <div class="text-muted mb-2">Lead Developer</div>

                                    <div>
                                        <a class="btn btn-primary btn-sm" href="#">Follow</a>
                                        <a class="btn btn-primary btn-sm" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg> Message</a>
                                    </div>
                                </div>
                                <hr class="my-0">

                                <hr class="my-0">

                                <hr class="my-0">

                            </div>
                        </div>

                        <div class="col-12 col-xl-3">
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
                                        <div class="mb-3">
                                            <label class="form-label" for="inputSexo">Sexo</label>
                                            <select id="inputSexo" class="form-control">
                                                <option selected="">Seleccione</option>
                                                <option value="M">Masculino</option>
                                                <option value="F">Femenino</option>
                                                <option value="NE">No especifica</option>
                                            </select>
                                        </div>
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
                        </div><div class="col-12 col-xl-3">
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
                                        <div class="mb-3">
                                            <label class="form-label" for="inputSexo">Sexo</label>
                                            <select id="inputSexo" class="form-control">
                                                <option selected="">Seleccione</option>
                                                <option value="M">Masculino</option>
                                                <option value="F">Femenino</option>
                                                <option value="NE">No especifica</option>
                                            </select>
                                        </div>
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
                        </div><div class="col-12 col-xl-3">
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
                                        <div class="mb-3">
                                            <label class="form-label" for="inputSexo">Sexo</label>
                                            <select id="inputSexo" class="form-control">
                                                <option selected="">Seleccione</option>
                                                <option value="M">Masculino</option>
                                                <option value="F">Femenino</option>
                                                <option value="NE">No especifica</option>
                                            </select>
                                        </div>
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
                    </div>

                </div>
		</div>
	</div>

<?php
 include(LAYOUT.'/footer.php');
 ?>