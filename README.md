# Práctica 3 – Automatización con Robot Framework

**Estudiante:** Juan Gabriel Ibañez Copatiti · **Materia:** Testing & Quality Assurance · UNIFRANZ
**Sitio probado:** https://automationexercise.com
**Repositorio:** https://github.com/aJuanga/practica3-robot-framework

Ejercicios resueltos (3 de 6):

| Ejercicio | Suite | Validaciones principales |
|---|---|---|
| 1 – Login correcto | `tests/01_login_correcto.robot` | "Logged in as <nombre>", enlace Logout visible, URL de inicio, sin mensaje de error |
| 2 – Login incorrecto | `tests/02_login_incorrecto.robot` | Texto exacto del error, no aparece "Logged in as", URL /login, título de la página |
| 3 – Búsqueda de productos | `tests/03_busqueda_productos.robot` | Título "SEARCHED PRODUCTS", URL con `search=`, hay resultados y todos contienen el término |

## Estructura

```
practica3-robot-framework/
├── tests/         # Suites .robot (un archivo por ejercicio)
├── keywords/      # Keywords reutilizables (.robot) + ApiHelper.py (crea/elimina el usuario de prueba por API)
├── variables/     # variables.robot (datos y URLs) y locators.robot (localizadores ID, CSS y XPath)
├── screenshots/   # Capturas generadas en cada ejecución
└── reports/       # report.html, log.html y output.xml de Robot Framework
```

## Instalación y ejecución

```bash
python -m venv venv
venv\Scripts\activate          # Linux/Mac: source venv/bin/activate
pip install -r requirements.txt
robot -d reports tests                               # Chrome visible
robot -d reports -v BROWSER:headlesschrome tests     # sin ventana
robot -d reports tests/02_login_incorrecto.robot     # un solo ejercicio
robot -d reports -i login tests                      # por etiqueta
```

El Ejercicio 1 crea un usuario nuevo mediante la API pública del sitio (`/api/createAccount`) al inicio de la suite
y lo elimina al final (`/api/deleteAccount`), así la prueba no depende de cuentas manuales ni datos personales.
