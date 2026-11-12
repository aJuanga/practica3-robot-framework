"""Keywords en Python para preparar datos de prueba mediante la API pública del sitio.

Se usa para crear (y luego eliminar) un usuario válido sin depender de cuentas manuales.
"""
import json
import time
import urllib.parse
import urllib.request

from robot.api import logger
from robot.api.deco import keyword, library


@library(scope="GLOBAL")
class ApiHelper:
    BASE = "https://automationexercise.com/api"

    def _post(self, endpoint, data, method="POST"):
        body = urllib.parse.urlencode(data).encode()
        req = urllib.request.Request(f"{self.BASE}/{endpoint}", data=body, method=method,
                                     headers={"User-Agent": "Mozilla/5.0 (RobotFramework QA)"})
        with urllib.request.urlopen(req, timeout=30) as resp:
            payload = json.loads(resp.read().decode())
        logger.info(f"{method} /{endpoint} -> {payload}")
        return payload

    @keyword("Generar Email Unico")
    def generar_email_unico(self, prefijo="juan.robot"):
        return f"{prefijo}.{int(time.time() * 1000)}@qa-test.com"

    @keyword("Crear Usuario De Prueba Por API")
    def crear_usuario(self, nombre, email, password):
        data = {"name": nombre, "email": email, "password": password, "title": "Mr",
                "birth_date": "18", "birth_month": "7", "birth_year": "2004",
                "firstname": "Juan", "lastname": "QA", "company": "UNIFRANZ",
                "address1": "Av. Arce 123", "address2": "", "country": "Canada",
                "zipcode": "0000", "state": "La Paz", "city": "La Paz", "mobile_number": "71234567"}
        r = self._post("createAccount", data)
        if r.get("responseCode") != 201:
            raise AssertionError(f"No se pudo crear el usuario de prueba: {r}")
        return email

    @keyword("Eliminar Usuario De Prueba Por API")
    def eliminar_usuario(self, email, password):
        r = self._post("deleteAccount", {"email": email, "password": password}, method="DELETE")
        return r.get("responseCode")
