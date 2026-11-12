*** Settings ***
Documentation     Ejercicio 3 - Búsqueda de productos: los resultados coinciden con el término buscado.
Resource          ../keywords/product_keywords.robot
Test Teardown     Cerrar Navegador Con Evidencia

*** Test Cases ***
EJ3 Buscar Productos Por Nombre
    [Documentation]    Busca "Jeans" y valida que todos los resultados correspondan.
    [Tags]    ejercicio3    productos    busqueda
    Abrir Navegador En    ${URL_BASE}
    Ir A La Seccion De Productos
    Capturar Evidencia    EJ3_seccion_productos
    Buscar Producto    ${TERMINO_BUSQUEDA}
    ${total}=    Validar Resultados De Busqueda    ${TERMINO_BUSQUEDA}
    Capturar Evidencia    EJ3_resultados_busqueda_${TERMINO_BUSQUEDA}
