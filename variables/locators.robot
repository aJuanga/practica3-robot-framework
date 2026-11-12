*** Settings ***
Documentation     Localizadores de la aplicación agrupados por página (ID, Name, CSS y XPath).

*** Variables ***
# ---------- Login ----------
${LOGIN_EMAIL}            css:input[data-qa="login-email"]
${LOGIN_PASSWORD}         css:input[data-qa="login-password"]
${LOGIN_BOTON}            css:button[data-qa="login-button"]
${LOGIN_ERROR}            xpath://form[@action="/login"]//p[contains(.,"incorrect")]
${MENU_LOGUEADO}          xpath://a[contains(.,"Logged in as")]
${MENU_LOGOUT}            css:a[href="/logout"]
${MENU_DELETE}            css:a[href="/delete_account"]

# ---------- Productos ----------
${BUSCADOR}               id:search_product
${BOTON_BUSCAR}           id:submit_search
${TITULO_SECCION}         css:h2.title.text-center
${TARJETAS_PRODUCTO}      css:.features_items .productinfo p
${LISTA_PRODUCTOS}        css:.features_items

# ---------- Consentimiento de cookies (aparece solo en algunas regiones) ----------
${BOTON_CONSENTIR}        css:button.fc-cta-consent
