*** Settings ***
Documentation     Ejercicio 1 - Login correcto: inicio de sesión con credenciales válidas.
Resource          ../keywords/login_keywords.robot
Library           ../keywords/ApiHelper.py
Suite Setup       Preparar Usuario Valido
Suite Teardown    Eliminar Usuario De Prueba Por API    ${EMAIL_VALIDO}    ${USUARIO_PASSWORD}
Test Teardown     Cerrar Navegador Con Evidencia

*** Test Cases ***
EJ1 Login Correcto Con Credenciales Validas
    [Documentation]    Un usuario registrado inicia sesión y accede al sistema.
    [Tags]    ejercicio1    login    positivo
    Abrir Navegador En    ${URL_BASE}
    Ir A La Pagina De Login
    Title Should Be       ${TITULO_LOGIN}
    Iniciar Sesion Con    ${EMAIL_VALIDO}    ${USUARIO_PASSWORD}
    Validar Sesion Iniciada    ${USUARIO_NOMBRE}
    Capturar Evidencia    EJ1_login_correcto_sesion_iniciada
    Cerrar Sesion
    Location Should Contain    /login
    Capturar Evidencia    EJ1_login_correcto_sesion_cerrada

*** Keywords ***
Preparar Usuario Valido
    ${email}=    Generar Email Unico
    Crear Usuario De Prueba Por API    ${USUARIO_NOMBRE}    ${email}    ${USUARIO_PASSWORD}
    Set Suite Variable    ${EMAIL_VALIDO}    ${email}
