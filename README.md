# SGOC (Sistema de Gestión Oral Care)

**Versión:** 20241020  
**Desarrollado por:** Jordan Garcia Dev  
**Cliente:** Clínica Oral Care SAS  
**Licenciado para:** Dr. Jaime Borja Altamar  

## Descripción

..::S.G.O.C::.. es un sistema desarrollado específicamente para la gestión y administración de las operaciones de la Clínica Oral Care SAS. El software permite gestionar el flujo de trabajo clínico, desde la administración de pacientes hasta la organización de consultas, registros médicos y otras funcionalidades clave para una clínica odontológica.

## Funcionalidades

- Gestión de empleados
- Programación de mantenimientos
- Administración de tratamientos odontológicos
- Control de estandares
- Gestión de contrataciones laborales
- Generación de reportes personalizados
- Sistema de autenticación de usuarios

## Requisitos del Sistema

- **Servidor web:** Apache
- **Lenguaje de programación:** PHP 8.2 o superior
- **Base de datos:** MySQL 5.7 o superior
- **Entorno:** XAMPP

## Instalación

1. Clonar el repositorio en el directorio de tu servidor web:
    ```bash
    git clone [https://github.com/JordanGarciaDev/OralCare.git](https://github.com/JordanGarciaDev/OralCare.git)
    ```

2. Configurar el archivo `config.php` con las rutas y parámetros correspondientes.

3. Importar la base de datos:
    - El archivo de base de datos SQL se encuentra en `database/sgoc_db.sql`.
    - Importar el archivo SQL usando phpMyAdmin o la línea de comandos:
      ```bash
      mysql -u [usuario] -p [base_datos] < database/sgoc.sql
      ```

4. Verificar los permisos de los directorios y archivos necesarios para la correcta ejecución del sistema.

5. Acceder al sistema en la siguiente URL:
    ```bash
    http://interno.oralcare.com/
    ```

## Uso

Una vez instalado el sistema, puedes acceder al panel de gestión de la clínica:

1. **Login:** Ingresar con el usuario y contraseña proporcionados por el administrador.
2. **Panel de control:** Desde aquí puedes acceder a las distintas secciones del sistema para gestionar empleados, mantenimientos, gastos, entre otros.

## Soporte

Para cualquier duda o problema técnico, por favor contacta al desarrollador:

- **Página web:** [www.jordangarciadev.com](https://www.jordangarciadev.com)
- **Correo electrónico:** [ing.jordangarcia@gmail.com](mailto:ing.jordangarcia@gmail.com)

## Licencia

Este software está licenciado para el Dr. Jaime Borja Altamar para su uso exclusivo en la **Clínica Oral Care SAS**.

