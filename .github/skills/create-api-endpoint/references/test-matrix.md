# Matriz de pruebas

| Caso | Resultado |
|---|---|
| Nombre y serie validos | 201, id no vacio y Location |
| GET a Location | 200 y mismo objeto |
| GET de coleccion | Contiene el objeto creado |
| Espacios exteriores | Se eliminan antes de validar y guardar |
| Nombre nulo, vacio o solo espacios | 400, errors.name |
| Serie nula, vacia o solo espacios | 400, errors.serialNumber |
| Nombre 80 / 81 caracteres normalizados | 201 / 400 |
| Serie 64 / 65 caracteres normalizados | 201 / 400 |
| Serie repetida con otro casing y espacios | 409; original sin sobrescribir |
| Ocho peticiones con la misma serie | Exactamente un 201 y siete 409 |
| Entrada invalida | No modifica la coleccion |

400 y 409 usan application/problem+json y status numerico correcto.
Cada prueba crea su WebApplicationFactory para no compartir estado entre pruebas.
