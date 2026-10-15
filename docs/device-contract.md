# Contrato del ejercicio: registrar dispositivos

## Contexto

API Minimal .NET 10. Ya existen `GET /health`, `GET /devices` y
`GET /devices/{id:guid}`. El almacén es un singleton en memoria, inicialmente
vacío; los datos desaparecen al reiniciar. No hay usuarios ni autenticación:
usar exclusivamente en loopback y con datos ficticios.

## Funcionalidad que se añade en directo

`POST /devices`, con JSON:

```json
{
  "name": " Sensor escenario ",
  "serialNumber": " DEMO-001 "
}
```

1. Eliminar espacios exteriores de nombre y serie con `Trim`.
2. Nombre obligatorio: de 1 a 80 caracteres .NET (`string.Length`) tras normalizar.
3. Serie obligatoria: de 1 a 64 caracteres tras normalizar.
4. Entrada inválida: HTTP 400, `application/problem+json`, `status: 400`,
   objeto `errors` con claves `name` y/o `serialNumber`. No insertar nada.
5. Serie única sin distinguir mayúsculas (`OrdinalIgnoreCase`).
   Duplicado: HTTP 409, `application/problem+json`, `status: 409`;
   no sobrescribir el dispositivo original.
6. Inserción correcta: HTTP 201; cuerpo con `id` GUID no vacío, `name` y
   `serialNumber` normalizados; cabecera `Location: /devices/{id}`.
7. GET a Location devuelve el mismo objeto; GET de colección lo incluye.
8. Ocho solicitudes concurrentes válidas con la misma serie producen
   exactamente un 201 y siete 409, y dejan un único dispositivo.

## Fuera de alcance

Persistencia duradera, autenticación, autorización, OpenAPI, telemetría avanzada,
despliegue y revisión de seguridad. No insinuar que esta API está lista para
producción. Estas omisiones son deliberadas para una demo de unos 20 minutos.
Los JSON malformados son responsabilidad del binding HTTP del framework;
el formato de sus errores no forma parte del contrato de validación anterior.
