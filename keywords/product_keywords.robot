*** Settings ***
Documentation     Keywords de negocio para la sección de productos.
Resource          common_keywords.robot

*** Keywords ***
Ir A La Seccion De Productos
    Go To    ${URL_PRODUCTOS}
    Aceptar Consentimiento Si Aparece
    Title Should Be                  ${TITULO_PRODUCTOS}
    Wait Until Element Is Visible    ${BUSCADOR}

Buscar Producto
    [Arguments]    ${termino}
    Input Text      ${BUSCADOR}    ${termino}
    Click Button    ${BOTON_BUSCAR}

Validar Resultados De Busqueda
    [Documentation]    Verifica el título, que existan resultados y que cada nombre contenga el término.
    [Arguments]    ${termino}
    Wait Until Element Contains      ${TITULO_SECCION}    ${TITULO_RESULTADOS}
    Location Should Contain          search=${termino}
    Page Should Contain Element      ${TARJETAS_PRODUCTO}
    ${productos}=    Get WebElements    ${TARJETAS_PRODUCTO}
    ${total}=        Get Length    ${productos}
    Should Be True    ${total} > 0    No se encontraron productos para "${termino}"
    FOR    ${producto}    IN    @{productos}
        ${nombre}=    Get Text    ${producto}
        Should Contain    ${nombre.lower()}    ${termino.lower()}
        ...    msg=El producto "${nombre}" no corresponde a la búsqueda "${termino}"
    END
    Log    Se encontraron ${total} productos que contienen "${termino}"    console=True
    RETURN    ${total}
