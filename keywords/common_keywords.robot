*** Settings ***
Documentation     Keywords comunes: navegador, consentimiento y evidencias.
Library           SeleniumLibrary    timeout=15s    run_on_failure=Nothing    screenshot_root_directory=${EXECDIR}${/}screenshots
Resource          ../variables/variables.robot
Resource          ../variables/locators.robot

*** Keywords ***
Abrir Navegador En
    [Documentation]    Abre el navegador configurado en la URL indicada y maximiza la ventana.
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Set Window Size    1400    950
    Set Selenium Timeout    ${TIMEOUT}
    Aceptar Consentimiento Si Aparece

Aceptar Consentimiento Si Aparece
    [Documentation]    Cierra el aviso de cookies si el sitio lo muestra (depende de la región).
    ${visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOTON_CONSENTIR}    3s
    IF    ${visible}    Click Button    ${BOTON_CONSENTIR}

Capturar Evidencia
    [Documentation]    Guarda una captura con el nombre del ejercicio y el paso.
    [Arguments]    ${nombre}
    Capture Page Screenshot    ${nombre}.png

Cerrar Navegador Con Evidencia
    [Documentation]    Si el caso falló, guarda una captura antes de cerrar.
    Run Keyword If Test Failed    Capture Page Screenshot    FALLO_${TEST NAME}.png
    Close All Browsers
