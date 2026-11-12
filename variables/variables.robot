*** Settings ***
Documentation     Variables reutilizables de la Práctica 3 (sitio, navegador y datos de prueba).

*** Variables ***
# ---------- Ambiente ----------
${URL_BASE}               https://automationexercise.com
${URL_LOGIN}              ${URL_BASE}/login
${URL_PRODUCTOS}          ${URL_BASE}/products
${BROWSER}                chrome
${TIMEOUT}                15s
${CARPETA_CAPTURAS}       ${EXECDIR}${/}screenshots

# ---------- Usuario de prueba (se crea por API al iniciar la suite) ----------
${USUARIO_NOMBRE}         Juan QA Robot
${USUARIO_PASSWORD}       RobotQA2026!

# ---------- Datos de login incorrecto ----------
${EMAIL_INVALIDO}         usuario.inexistente.robot@qa-test.com
${PASSWORD_INVALIDO}      ClaveErronea123

# ---------- Búsqueda de productos ----------
${TERMINO_BUSQUEDA}       Jeans
${TITULO_RESULTADOS}      SEARCHED PRODUCTS

# ---------- Mensajes esperados ----------
${TEXTO_LOGUEADO}         Logged in as
${MENSAJE_ERROR_LOGIN}    Your email or password is incorrect!
${TITULO_LOGIN}           Automation Exercise - Signup / Login
${TITULO_PRODUCTOS}       Automation Exercise - All Products
