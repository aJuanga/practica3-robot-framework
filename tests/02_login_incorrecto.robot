*** Settings ***
Documentation     Ejercicio 2 - Login incorrecto: el sistema rechaza credenciales inválidas.
Resource          ../keywords/login_keywords.robot
Test Teardown     Cerrar Navegador Con Evidencia

*** Test Cases ***
EJ2 Login Incorrecto Muestra Mensaje De Error
    [Documentation]    Un correo no registrado con contraseña cualquiera no puede ingresar.
    [Tags]    ejercicio2    login    negativo
    Abrir Navegador En    ${URL_LOGIN}
    Iniciar Sesion Con    ${EMAIL_INVALIDO}    ${PASSWORD_INVALIDO}
    Validar Error De Login
    Capturar Evidencia    EJ2_login_incorrecto_mensaje_error
