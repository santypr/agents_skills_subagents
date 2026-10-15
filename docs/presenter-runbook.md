# Guion a dos voces: charla de 35–40 minutos

## Formato y reparto

Duración confirmada: 35–40 minutos entre dos ponentes. Propuesta: 35 de contenido,
3 de preguntas y 2 de margen. Si el límite es 35, usar los recortes indicados abajo.
Se asume que preguntas y transiciones están incluidas.

Se mantienen las hipótesis técnicas: audiencia familiarizada con chat, Windows,
.NET 10, Copilot en VS Code/Insiders, sin Docker ni Azure. El PPTX no se modifica.

- **A, hilo conductor:** plantea el problema, explica el modelo mental,
  pregunta por las decisiones y cierra.
- **B, hilo operativo:** explica skills/delegación y opera slides/editor/terminal
  durante la demo. Una sola máquina y sin cambios de pantalla entre equipos.
- Durante la demo, A interpreta lo que se observa; B señala las evidencias.
  No narrar cada clic ni hablar ambos a la vez.
- Los roles pueden intercambiarse. Ensayar las transiciones para equilibrar
  participación, no para asignar exactamente la mitad de cada minuto.

## Escaleta completa

| Reloj | Duración | Contenido | Voz principal | Apoyo |
|---|---|---|---|---|
| 00:00–03:00 | 3 min | Problema y promesa de la charla | A | Slides 1–3 |
| 03:00–10:00 | 7 min | Instrucciones, agente, skill, subagente | A y B | Slides 4, 5, 7, 9 |
| 10:00–14:00 | 4 min | Decisión y antipatrón | B | Slides 11, 12 |
| 14:00–27:00 | 13 min | Una funcionalidad de principio a fin | B opera; A interpreta | Slide 14 + editor |
| 27:00–31:00 | 4 min | Límites, permisos, diferencias de entorno | A y B | Slide 15 |
| 31:00–35:00 | 4 min | Respuesta inicial y conclusiones | B y A | Slides 16, 17 |
| 35:00–38:00 | 3 min | Preguntas | Ambos | Slide 17 |
| 38:00–40:00 | 2 min | Reserva para retrasos o más preguntas | Ambos | Sin contenido nuevo |

Las slides 6, 8, 10 y 13 son respaldo. No intentar exponer las 17 con el mismo
peso. El presupuesto de preguntas es pequeño: aparcar debates largos al final.

### 00:00–03:00 — Apertura

**A:**

> «Ya sabemos pedirle código a un asistente. Pero cuando tiene que seguir nuestras
> convenciones, usar herramientas y revisar el resultado, ¿qué debemos diseñar?».

**A, pregunta para recuperar al final:**

> «Si queremos revisar una API, ¿necesitamos instrucciones, una skill, un agente
> o un subagente?».

**B, intervención breve:**

> «Hoy lo veremos con una sola API .NET: registrar un dispositivo, comprobar
> el contrato y demostrar qué trabajo se ha delegado de verdad».

### 03:00–10:00 — Cuatro conceptos, un solo ejemplo

**A, instrucciones y agente:**

> «Las instrucciones dicen cómo trabajamos aquí: errores, arquitectura y pruebas.
> El agente persigue el objetivo y decide qué pasos y herramientas necesita».

Ejemplo común: «Queremos registrar dispositivos». Evitar cuatro casos de negocio
distintos y listas largas de agentes posibles.

**Transición de A a B:**

> «Si el procedimiento para crear endpoints se repite, ¿necesitamos otro agente?».

**B, skill y subagente:**

> «No necesariamente. Una skill empaqueta el procedimiento y sus recursos.
> Si delegamos una revisión separada, entonces aparece un subagente.
> La misma definición de agente puede utilizarse como trabajador delegado».

Mostrar carga progresiva y recordar: contexto separado no equivale a disco
aislado. Dejar permisos y diferencias entre productos para después de la demo.

### 10:00–14:00 — Decidir sin sobrearquitectura

**B:** recorrer el árbol con cuatro preguntas: ¿regla?, ¿capacidad reutilizable?,
¿rol/herramientas diferentes?, ¿trabajo separable que justifica delegación?

**A, contrapunto:**

> «¿Y por qué no crear un agente para el DTO, otro para el handler y otro para
> cada test?».

**B:**

> «Porque añadimos coordinación sin ganar aislamiento útil. Aquí basta un agente
> que implementa con una skill y un revisor delegado que no escribe».

**Transición a la demo:**

> «Vamos a comprobarlo con código. No compararemos una respuesta mala preparada
> con otra buena: mostraremos el proceso y las evidencias».

### 14:00–27:00 — Demo

Seguir el cronómetro de 13 minutos descrito más abajo. A pregunta por decisiones;
B opera. La generación empieza en el minuto 16 de la charla, no después de
explicar todos los archivos.

### 27:00–31:00 — Lo que la demo no garantiza

**A:**

> «¿Leer las instrucciones significa que ya tenemos garantías? ¿Un contexto
> separado impide que dos agentes pisen el mismo archivo?».

**B:**

> «No. Comprobamos el contrato con tests y limitamos las herramientas del revisor.
> El contexto separado no es una sandbox. Y esta API no es un sistema de producción».

**B, comparación de aproximadamente un minuto:**

> «El modelo no es el entorno de ejecución. Elegir Claude dentro de Copilot no
> convierte la sesión en Claude Code. Las skills comparten un estándar, pero
> configuración de agentes, herramientas y permisos dependen del harness».

**A:** cerrar con mínimo privilegio, revisión de scripts y responsabilidad humana.
No abrir otra herramienta ni entrar en instalación o configuración.

### 31:00–35:00 — Resolver y cerrar

**A:** recuperar la pregunta inicial sobre revisión de una API.

**B:**

> «Reglas de revisión: instrucciones. Procedimiento reutilizable: skill.
> Rol con herramientas propias: agente. Ese rol ejecutado por delegación:
> subagente. Las cuatro piezas pueden combinarse».

**A, tres conclusiones:**

> «Empieza por lo más simple. Separa conocimiento de responsabilidad.
> Y comprueba el resultado: que el agente diga “terminado” no es una prueba».

**B:** señalar el material de la demo para que la audiencia pueda repetirla.
Pasar a preguntas sin volver a explicar definiciones.

## Qué recortar respecto al planteamiento anterior

- No cambiar el código ni añadir agentes: la demo ya contiene las piezas necesarias.
- Reducir la demo de 20 a 13 minutos: restauración y pruebas de base antes de salir,
  prompt pronto y solo una secuencia HTTP de éxito/conflicto si queda tiempo.
- Evitar una ejecución A/B, una segunda demo en Claude Code y el catálogo de
  patrones de la slide 13.
- No escribir archivos de agentes/skills desde cero en directo: mostrar los
  preparados y dedicar el tiempo a comprobar que se utilizan.
- Para **35 minutos estrictos**, reducir conceptos de 7 a 6, decisión de 4 a 3
  y cierre de 4 a 3. La demo queda en 12:00–25:00, límites en 25:00–29:00,
  cierre en 29:00–32:00 y preguntas en 32:00–35:00.
- Si se consume el margen, quitar peticiones HTTP opcionales, no la evidencia de
  delegación ni el resultado de pruebas. Si la herramienta no responde, usar
  recuperación o grabación y declarar explícitamente qué está preparado.

## Ensayo obligatorio antes del evento

1. Abrir la raíz de este workspace, no solo la carpeta de la API.
2. Anotar versión de VS Code/extensión, harness, modelo y políticas de herramientas.
   No actualizar el entorno después del ensayo.
3. Crear una sesión **Local** en VS Code si está disponible. La documentación
   de aliases, `agents` y visibilidad utilizada aquí está dirigida a ese harness.
   Si se usa Copilot harness, confirmar los campos y herramientas en esa sesión.
4. Abrir **Chat: Open Customizations** o la UI equivalente de la versión instalada.
   Comprobar que aparecen las instrucciones, Workshop Builder y la skill.
   Contract Reviewer puede estar oculto del selector por diseño.
5. Confirmar que Workshop Builder dispone de lectura, búsqueda, edición,
   terminal y delegación, y que el reviewer solo tiene lectura/búsqueda.
6. Ensayar una invocación real del reviewer. Confirmar en el registro de
   herramientas que fue una llamada delegada, no texto imitando un informe.
7. Comprobar que el cuerpo de la skill se carga. Si se abre SKILL.md manualmente,
   decirlo: eso demuestra ejecución manual, no descubrimiento automático.
8. Restaurar paquetes y probar ambos estados. Detener el servidor antes
   de cambiar archivos o compilar, especialmente en Windows.

```powershell
dotnet --version
dotnet restore AgentWorkshop.slnx
.\scripts\Set-DemoStage.ps1 -Stage Completed
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
.\scripts\Set-DemoStage.ps1 -Stage Starter
dotnet test AgentWorkshop.slnx --no-restore
```

Esperado: **15 casos** en Completed, **3** en Starter.
La aplicación y tests pueden funcionar sin red después de restaurar; Copilot
no. Preparar acceso de respaldo o una grabación del ensayo.

## Demo, minutos 0–2: objetivo, contexto y lanzamiento (14:00–16:00)

Mostrar el [contrato](device-contract.md), no la solución completa.
Abrir Program, DeviceStore y el método vacío de RegistrationEndpoints.

Decir:

> «Ya hay una API que consulta dispositivos. Vamos a añadir el registro.
> El código es pequeño porque queremos observar cómo se organiza el trabajo».

Las tres pruebas iniciales ya se ejecutaron durante la preparación: mostrar su
resultado guardado si se necesita, sin atribuirle verificación del endpoint.
Los tests verdes de base no demuestran que el registro esté implementado.

Pregunta retórica para la audiencia: «¿Qué decisiones deja abiertas “añade un
endpoint”?». No gastar tiempo generando una versión supuestamente mala.

Seleccionar **Workshop Builder**, iniciar sesión nueva y enviar el siguiente
prompt antes del minuto 2 de la demo:

```text
Implementa POST /devices conforme a docs/device-contract.md.
Usa la skill create-api-endpoint y añade pruebas de integración.
No leas checkpoints ni cambies personalizaciones o documentación.
Después de implementar y ejecutar las pruebas, delega una única revisión
en Contract Reviewer, con objetivo, rutas, límites y formato autocontenidos.
Corrige solo incumplimientos demostrables y vuelve a probar si cambias código.
Indica qué capacidades se han cargado y qué comprobaciones se han ejecutado.
```

## Demo, minutos 2–7: implementación y lectura del flujo (16:00–21:00)

B muestra la actividad del agente en el editor; A explica las instrucciones
y la skill ya preparadas sin interrumpir la ejecución. No abrir otra sesión
del agente ni lanzar peticiones que modifiquen archivos mientras trabaja.
Consultar la matriz solo si ayuda a interpretar una decisión visible.

**A:**

> «La skill no es otro trabajador. Es el procedimiento que usa el agente actual.
> No le hemos enseñado nuevos pesos al modelo: hemos aportado contexto útil».

Mientras trabaja, señalar únicamente evidencias observables:

- Lectura del contrato y de patrones existentes.
- Carga de la skill y consulta de su referencia.
- Cambios en implementación/pruebas.
- Comando de test y resultado real.

No exigir exactamente la implementación del checkpoint ni exactamente su número
de tests: pueden existir otras soluciones válidas. Sí exigir todos los casos del
contrato, especialmente límites, error shape y concurrencia.

## Demo, minutos 7–10: delegación (21:00–24:00)

Los tiempos son puntos de control, no pausas impuestas al agente. Si delega antes,
mostrar la llamada cuando ocurra; no repetir la revisión solo para ajustarse al reloj.

Mostrar la llamada a Contract Reviewer y su resultado. El agente principal
integra el informe; el revisor no escribe ni ejecuta tests.

Prompt alternativo si hace falta explicitar la misión:

```text
Invoca Contract Reviewer como subagente para comparar
demo/src/DeviceRegistry.Api/RegistrationEndpoints.cs y las pruebas de
demo/tests/DeviceRegistry.Api.Tests con docs/device-contract.md.
Solo lectura, sin terminal, sin checkpoints y sin nueva arquitectura.
Devuelve hasta cinco incumplimientos con archivo/línea, caso demostrable
y prueba recomendada; si no hay hallazgos, indícalo. Termina tras el informe.
```

Decir:

> «Este es un agente personalizado ejecutado como subagente. Su contexto está
> separado; el disco no está mágicamente aislado. Hemos limitado herramientas
> y evitado dos escritores. La verificación ejecutable sigue en el principal».

No confundir el texto «voy a delegar» con una invocación real.
Si no se ve la herramienta, explicar la limitación y usar revisión directa
como respaldo, sin decir que hubo subagente.

## Demo, minutos 10–12: evidencia funcional (24:00–26:00)

Mostrar el resultado real de pruebas del agente. Si no existe o cambió el código
desde su ejecución, ejecutar el validador. No duplicar una ejecución vigente
solo para llenar el guion. Arrancar la API si queda tiempo:

```powershell
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
dotnet run --project .\demo\src\DeviceRegistry.Api --no-launch-profile -- --urls http://localhost:5187
```

En otra terminal:

```powershell
$base = 'http://localhost:5187'
Invoke-RestMethod "$base/health"
$created = Invoke-WebRequest "$base/devices" -Method Post -ContentType 'application/json' -Body '{"name":" Sensor escenario ","serialNumber":" DEMO-001 "}'
$created.StatusCode
$created.Headers.Location
$created.Content
Invoke-RestMethod "$base/devices"
```

Para 400/409, usar [requests.http](../demo/requests.http) con un cliente HTTP
compatible. En PowerShell 7 también se pueden mostrar el estado y el JSON:

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

Algunas versiones de PowerShell devuelven `application/problem+json` como bytes;
la función anterior los decodifica sin confundirlos con el cuerpo JSON.

Las peticiones con la misma serie son intencionadamente duplicadas. Reiniciar
el proceso vacía el almacén para repetir la secuencia.

## Demo, minutos 12–13: síntesis y transición (26:00–27:00)

Recapitular:

- Instrucciones: reglas del repositorio.
- Skill: procedimiento reutilizable.
- Agente principal: responsabilidad del resultado.
- Subagente: ejecución delegada y resultado acotado.
- Pruebas: evidencia de que el contrato se cumple.

«Menos agentes, mejores límites y resultados comprobables».

## Recuperación

Si pasan dos minutos sin progreso útil, o al minuto 7 de la demo todavía
no hay una implementación que permita llegar a revisión y pruebas, activar
el respaldo. No consumir los bloques de cierre y preguntas esperando al modelo:

1. Cancelar la ejecución del agente y detener el servidor.
2. Guardar los cambios en directo si interesan.
3. Recuperar Completed:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Completed
# Solo si rechaza cambios que ya has guardado y quieres descartar:
.\scripts\Set-DemoStage.ps1 -Stage Completed -Force
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
```

Anunciar: «Cargo la solución preparada para continuar; esto no es código que
acabe de generar el agente». Mostrar contrato, tests y revisión de todos modos.
Si ya no hay tiempo o conexión para delegar, mostrar una grabación del ensayo
identificada como tal. Sin grabación, enseñar la configuración y declarar que
la invocación no se ha podido demostrar; no simular un informe de subagente.

Para otro ensayo:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Starter
dotnet test AgentWorkshop.slnx --no-restore
```

El reset no es un `git reset`: solo toca los dos archivos nombrados. Si el agente
ha creado otros archivos, el presentador debe revisarlos antes de otro ensayo.
No usar borrados globales ni forzar cambios sin guardarlos.

## Qué está verificado y qué falta ensayar

- Verificación automatizada local: .NET compila, ambos estados pasan sus pruebas;
  el respaldo comprueba 201/400/409, Location, normalización, límites y unicidad.
- Comprobación HTTP real en loopback, además de WebApplicationFactory.
- Frontmatter y referencias locales comprobados estructuralmente.
- Pendiente de ensayo humano: descubrimiento e invocación real de las
  personalizaciones en la versión/harness elegidos y tiempos del modelo.
- No se ha ejecutado la demo en Claude Code ni una auditoría de seguridad.
