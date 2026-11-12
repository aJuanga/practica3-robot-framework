*** Settings ***
Documentation     Keywords de negocio para el inicio de sesión.
Resource          common_keywords.robot

*** Keywords ***
Ir A La Pagina De Login
    Go To    ${URL_LOGIN}
    Aceptar Consentimiento Si Aparece
    Wait Until Element Is Visible    ${LOGIN_EMAIL}

Iniciar Sesion Con
    [Documentation]    Completa el formulario "Login to your account" y lo envía.
    [Arguments]    ${email}    ${password}
    Input Text        ${LOGIN_EMAIL}       ${email}
    Input Password    ${LOGIN_PASSWORD}    ${password}
    Click Button      ${LOGIN_BOTON}

Validar Sesion Iniciada
    [Documentation]    Validaciones del acceso exitoso.
    [Arguments]    ${nombre}
    Wait Until Element Is Visible    ${MENU_LOGUEADO}
    Element Should Contain           ${MENU_LOGUEADO}    ${TEXTO_LOGUEADO} ${nombre}
    Element Should Be Visible        ${MENU_LOGOUT}
    Page Should Not Contain          ${MENSAJE_ERROR_LOGIN}
    Location Should Be               ${URL_BASE}/

Validar Error De Login
    [Documentation]    Validaciones del rechazo de credenciales.
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be           ${LOGIN_ERROR}    ${MENSAJE_ERROR_LOGIN}
    Page Should Not Contain Element  ${MENU_LOGUEADO}
    Location Should Contain          /login
    Title Should Be                  ${TITULO_LOGIN}

Cerrar Sesion
    Click Link    ${MENU_LOGOUT}
    Wait Until Element Is Visible    ${LOGIN_EMAIL}
