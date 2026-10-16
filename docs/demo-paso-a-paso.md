# Demo paso a paso: preparación, ejecución y recuperación

Este documento explica qué ejecutar, qué cambia y qué resultado esperar.
Los comandos están preparados para PowerShell en Windows.

> **Los scripts preparan o comprueban la demo; no crean ni ejecutan agentes.**
> Los agentes y la skill ya están definidos en el repositorio. Copilot los
> utiliza desde una sesión del editor.

## 1. Qué hace cada comando

| Comando | Efecto | No hace |
|---|---|---|
| `dotnet restore AgentWorkshop.slnx` | Restaura las dependencias declaradas y genera archivos de restauración en `obj` | No implementa funcionalidades ni inicia Copilot |
| `.\scripts\Set-DemoStage.ps1 -Stage Starter` | Restablece el endpoint inicial y elimina las pruebas de registro preparadas si existen | No ejecuta pruebas ni arranca la API |
| `.\scripts\Set-DemoStage.ps1 -Stage Completed` | Copia el endpoint y las pruebas de la solución de respaldo | No genera código mediante IA ni ejecuta pruebas |
| `& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1` | Compila y ejecuta las pruebas del estado actual, sin restaurar paquetes | No cambia al estado Completed ni invoca agentes |
| `dotnet run ...` | Compila y arranca la API hasta que se detenga | No implementa el ejercicio ni realiza revisión delegada |

### Qué archivos modifica el cambio de estado

El script [Set-DemoStage.ps1](../scripts/Set-DemoStage.ps1) actúa únicamente sobre:

- [RegistrationEndpoints.cs](../demo/src/DeviceRegistry.Api/RegistrationEndpoints.cs).
- El archivo de pruebas de registro `RegistrationTests.cs`, en el proyecto de pruebas.

**Starter:**

- Copia la versión inicial del endpoint, sin `POST /devices`.
- Elimina `RegistrationTests.cs` si existe.
- Conserva la API base, el almacén y las tres pruebas iniciales.

**Completed:**

- Copia el endpoint terminado desde el respaldo.
- Crea o sustituye `RegistrationTests.cs` con las pruebas preparadas.
- Deja un total esperado de 15 casos de prueba, incluidos los tres iniciales.

Ninguno de los dos modos crea proyectos, agentes o skills.
El script no elimina otros archivos que haya creado el agente.

### Protección de cambios

El script se detiene si los archivos objetivo contienen cambios distintos de
las versiones preparadas. Antes de usar `-Force`, guardar fuera de esos archivos
todo lo que se quiera conservar.

`-Force` permite sustituir el endpoint y sustituir o eliminar las pruebas de
registro según el estado elegido. No usarlo automáticamente ante un rechazo.

### Qué genera el validador

El script [Validate-Demo.ps1](../.github/skills/create-api-endpoint/scripts/Validate-Demo.ps1)
ejecuta desde la raíz:

```powershell
dotnet test AgentWorkshop.slnx --no-restore --verbosity minimal
```

Genera los artefactos habituales de compilación en `bin` y `obj`, y muestra
el resultado de las pruebas. Si estas fallan, informa del fallo; no corrige
el código por sí mismo.

## 2. Preparar el ensayo

### Paso 1. Abrir el repositorio completo

Abrir la raíz del proyecto en VS Code, no únicamente la carpeta de la API.
En la terminal PowerShell:

```powershell
Set-Location C:\dev\santiagoporras\agents_skills_subagents
dotnet --version
dotnet restore AgentWorkshop.slnx
```

Se necesita un SDK estable .NET 10. La primera restauración puede requerir
acceso a NuGet. Copilot necesita además conexión y un modelo disponible.

### Paso 2. Preparar el punto de partida

Si la API está ejecutándose, detenerla con Ctrl+C antes de cambiar archivos.

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Starter
dotnet test AgentWorkshop.slnx --no-restore
```

**Resultado esperado:** tres pruebas correctas y el registro aún sin implementar.
Esas pruebas comprueban la API de base, no el contrato de una funcionalidad
que todavía no existe.

### Paso 3. Comprobar las personalizaciones

Desde la interfaz de personalizaciones de Copilot, comprobar:

- [Workshop Builder](../.github/agents/workshop-builder.agent.md): agente principal.
- [create-api-endpoint](../.github/skills/create-api-endpoint/SKILL.md): skill.
- [Contract Reviewer](../.github/agents/contract-reviewer.agent.md): revisor delegado.
- [Instrucciones del proyecto](../.github/copilot-instructions.md).

Contract Reviewer puede no aparecer en el selector porque está configurado
para utilizarse como subagente. Comprobar su disponibilidad para delegación,
no solo su visibilidad.

La demo está preparada para el harness Local de VS Code donde esté disponible.
En otro entorno, comprobar compatibilidad de herramientas y configuración.
Ejecutar los scripts PowerShell no registra estas personalizaciones.

## 3. Ejecutar la parte agéntica

### Paso 4. Seleccionar el agente y enviar el objetivo

Seleccionar **Workshop Builder**, abrir una conversación nueva y enviar:

```text
Implementa POST /devices conforme a docs/device-contract.md.
Usa la skill create-api-endpoint y añade pruebas de integración.
No leas checkpoints ni cambies personalizaciones o documentación.
Después de implementar y ejecutar las pruebas, delega una única revisión
en Contract Reviewer, con objetivo, rutas, límites y formato autocontenidos.
Corrige solo incumplimientos demostrables y vuelve a probar si cambias código.
Indica qué capacidades se han cargado y qué comprobaciones se han ejecutado.
```

El agente debe:

1. Leer el [contrato funcional](device-contract.md) y el código existente.
2. Cargar la skill y consultar los recursos necesarios.
3. Implementar el registro y añadir pruebas.
4. Ejecutar las comprobaciones.
5. Invocar Contract Reviewer como subagente.
6. Integrar los hallazgos justificados y volver a probar si cambia código.
7. Entregar un resumen de resultados y limitaciones.

No ejecutar el cambio de estado ni editar los mismos archivos mientras el
agente está trabajando.

### Paso 5. Observar evidencias, no solo el relato

- La skill se ha cargado realmente; mencionar su nombre no basta.
- Se han modificado implementación y pruebas.
- Existe una ejecución de pruebas con resultado visible.
- Aparece una llamada real al subagente y su respuesta.

Si el agente dice «voy a delegar», pero no realiza una llamada, no se ha
demostrado la delegación. Si la herramienta no está disponible, declarar
la limitación y continuar con revisión directa, sin fingir un subagente.

### Paso 6. Comprobar la solución

Si el agente no ha ejecutado pruebas, o el código cambió después de la última
ejecución, lanzar:

```powershell
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
```

La solución de respaldo tiene 15 casos. Una implementación generada puede tener
otro número: lo importante es cubrir el contrato completo, incluidos límites
exactos y duplicados concurrentes. No rebajar el contrato para obtener tests verdes.

## 4. Mostrar la API funcionando

### Paso 7. Arrancar el servidor

```powershell
dotnet run --project .\demo\src\DeviceRegistry.Api --no-launch-profile -- --urls http://localhost:5187
```

Mantener esta terminal abierta. El servidor se detiene con Ctrl+C.
Usar solo datos ficticios y loopback: la API no tiene autenticación.

### Paso 8. Crear un dispositivo

En otra terminal PowerShell:

```powershell
$base = 'http://localhost:5187'
Invoke-RestMethod "$base/health"

$body = @{
    name = ' Sensor escenario '
    serialNumber = ' DEMO-001 '
} | ConvertTo-Json

$response = Invoke-WebRequest `
    "$base/devices" `
    -Method Post `
    -ContentType 'application/json' `
    -Body $body

$response.StatusCode
$response.Headers.Location
$response.Content

$location = [string]$response.Headers.Location
Invoke-RestMethod "$base$location"
Invoke-RestMethod "$base/devices"
```

**Resultado esperado:**

- Salud disponible.
- Creación con HTTP 201.
- Cabecera `Location` que permite recuperar el dispositivo.
- Nombre y serie guardados sin espacios exteriores.
- El dispositivo aparece en la colección.

Si se repite la creación con la misma serie, corresponde HTTP 409.
El almacén está en memoria: reiniciar el servidor vacía los datos.

### Paso 9. Mostrar conflicto y validación, si queda tiempo

En PowerShell 7:

```powershell
function Show-HttpResponse($response) {
    $response.StatusCode
    if ($response.Content -is [byte[]]) {
        [System.Text.Encoding]::UTF8.GetString($response.Content)
    } else {
        $response.Content
    }
}

Show-HttpResponse (Invoke-WebRequest "$base/devices" -Method Post -ContentType 'application/json' -Body '{"name":"Duplicado","serialNumber":"demo-001"}' -SkipHttpErrorCheck)
Show-HttpResponse (Invoke-WebRequest "$base/devices" -Method Post -ContentType 'application/json' -Body '{"name":" ","serialNumber":"BAD"}' -SkipHttpErrorCheck)
```

Esperado: 409 por duplicado y 400 por nombre inválido, ambos con Problem Details.
La función decodifica el cuerpo si PowerShell entrega `application/problem+json`
como bytes. Alternativamente, usar [requests.http](../demo/requests.http) con
un cliente HTTP compatible.

## 5. Recuperar la demo si el directo se atasca

1. Cancelar la ejecución del agente.
2. Detener el servidor.
3. Guardar los cambios que interese conservar fuera de los archivos objetivo.
4. Cargar la solución preparada:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Completed
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
```

Si el script rechaza los cambios, revisarlos antes de continuar. Solo después
de guardarlos y decidir descartarlos explícitamente:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Completed -Force
```

Después de la copia forzada, ejecutar de nuevo el validador.

Decir a la audiencia: **«Cargo la solución preparada para continuar; no es código
que acabe de generar el agente»**. Cargar Completed no demuestra que Copilot haya
usado la skill o delegado la revisión.

## 6. Dejarlo listo para otro ensayo

Con el agente y el servidor detenidos, guardar los cambios que se quieran
conservar y ejecutar:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Starter
dotnet test AgentWorkshop.slnx --no-restore
```

Esperado: tres pruebas iniciales y el endpoint de registro sin implementar.
Si el agente creó otros archivos, revisarlos manualmente: este script no
restablece todo el repositorio.

## Secuencia que conviene recordar

**Starter → pedir a Copilot que implemente → observar skill y delegación →
comprobar pruebas → mostrar la API.**

**Completed es el respaldo**, no el paso previo a pedirle a Copilot que resuelva
el ejercicio.

Para los tiempos y el reparto entre ponentes, consultar el
[guion de la charla](presenter-runbook.md).
