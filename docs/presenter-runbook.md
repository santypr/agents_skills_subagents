# Guion a dos voces: charla de 35–40 minutos

## Formato y reparto

Duración confirmada: 35–40 minutos entre dos ponentes. Propuesta: 37 de contenido
y 3 de preguntas. Se asume que preguntas y transiciones están incluidas.
Para 35 minutos se incluye una variante comprimida, sin saltar diapositivas.

**Las slides validadas marcan la estructura:** se presentan las 17 en su orden
original, sin relegar ninguna a material de respaldo. Las explicaciones siguientes
son notas para acompañarlas, no una propuesta de cambiar el PowerPoint.

Se mantienen las hipótesis técnicas: audiencia familiarizada con chat, Windows,
.NET 10, Copilot en VS Code/Insiders, sin Docker ni Azure. El PPTX no se modifica.

- **A:** abre, explica instrucciones y agentes, desarrolla decisión/patrones
  y cierra con gobierno y conclusiones.
- **B:** explica skills y subagentes, conduce la demo y responde a la pregunta
  inicial. Opera el editor y la terminal desde una sola máquina.
- Durante la demo, A interpreta lo que se observa; B señala las evidencias.
  No narrar cada clic ni hablar ambos a la vez.
- Los roles pueden intercambiarse. Ensayar las transiciones para equilibrar
  participación, no para asignar exactamente la mitad de cada minuto.

## Escaleta completa: una entrada por slide

Los intervalos incluyen las transiciones. La slide 14 incluye el cambio al editor
y los 13 minutos de demo; no se añaden después otros 13 minutos.

| Slide | Reloj | Duración | Título / foco | Voz |
|---|---|---|---|---|
| 1 | 00:00–01:00 | 1 min | Tu próximo compañero de equipo será un agente | A |
| 2 | 01:00–03:00 | 2 min | Copilot ya no es solo autocompletado | A |
| 3 | 03:00–04:00 | 1 min | Cuatro piezas que no son intercambiables | A |
| 4 | 04:00–06:00 | 2 min | Instrucciones: las reglas del terreno | A |
| 5 | 06:00–08:00 | 2 min | Agente: objetivo, decisiones y herramientas | A |
| 6 | 08:00–09:00 | 1 min | ¿Cuándo merece existir un agente? | A |
| 7 | 09:00–11:00 | 2 min | Skill: enseñar a Copilot cómo hacer algo bien | B |
| 8 | 11:00–12:00 | 1 min | ¿Cuándo crear una skill? | B |
| 9 | 12:00–14:00 | 2 min | Subagente: un especialista temporal | B |
| 10 | 14:00–15:00 | 1 min | Una frase para recordar cada concepto | B |
| 11 | 15:00–16:00 | 1 min | ¿Qué debería crear? | A |
| 12 | 16:00–17:30 | 1,5 min | No construyas un ejército si basta una caja de herramientas | A |
| 13 | 17:30–19:00 | 1,5 min | Tres arquitecturas que sí funcionan | A |
| 14 | 19:00–32:00 | 13 min | De una petición vaga a un equipo de trabajo: demo | B opera; A interpreta |
| 15 | 32:00–34:00 | 2 min | Cuando Copilot actúa, la seguridad deja de ser opcional | A |
| 16 | 34:00–36:00 | 2 min | ¿Cómo revisarías la seguridad de una API? | B |
| 17 | 36:00–37:00 | 1 min | Tres ideas para llevarte | A |
| — | 37:00–40:00 | 3 min | Preguntas | Ambos |

## Notas a dos voces siguiendo las slides

### Slide 1 — Tu próximo compañero de equipo será un agente

**A:**

> «Hasta ahora hemos aprendido a pedirle código a un asistente. Hoy veremos cómo
> organizar su trabajo: qué reglas darle, qué capacidades reutilizar y cuándo
> tiene sentido delegar».

Presentar a ambos ponentes. Prometer una explicación práctica y una sola demo
.NET, no un catálogo de funcionalidades.

### Slide 2 — Copilot ya no es solo autocompletado

**A:** recorrer la evolución que aparece en pantalla: predice, responde, actúa,
se especializa y delega.

> «Al especializarse, carga instrucciones y capacidades para la tarea; no estamos
> reentrenando el modelo. El cambio es pasar de pedir fragmentos a diseñar cómo
> se ejecuta el trabajo».

Plantear la pregunta exacta de la slide:

> «Si necesitáis revisar la seguridad de una API, ¿qué crearíais: instrucciones,
> una skill, un agente o un subagente? Guardad vuestra respuesta para el final».

No resolverla todavía: se retoma en la slide 16.

### Slide 3 — Cuatro piezas que no son intercambiables

**A:** presentar el mapa, sin explicar todavía cada pieza en profundidad.

> «Reglas, capacidad, responsabilidad y delegación. Resuelven problemas distintos,
> pero se combinan: un agente sigue instrucciones, usa una skill y puede delegar».

Transición: «Empezamos por las reglas del terreno».

### Slide 4 — Instrucciones: las reglas del terreno

**A:** usar los ejemplos que ya muestra la slide: arquitectura, acceso a datos,
pruebas de integración y Problem Details.

> «No quiero repetir estas convenciones en cada petición. Las documento para que
> el asistente tenga el contexto del proyecto. Las generales se aplican al
> proyecto; otras pueden estar acotadas. Es una guía, no un control infalible».

Conectar con la demo: .NET 10, almacén existente, errores coherentes y pruebas.
No enseñar aún el editor.

### Slide 5 — Agente: objetivo, decisiones y herramientas

**A:** seguir las cinco etapas visibles: interpreta, planifica, actúa, observa
y ajusta.

> «Si una prueba falla, el trabajo no termina en generar código: el agente
> observa el fallo y decide cómo continuar. Un agente personalizado configura
> un rol y sus herramientas sobre ese entorno de ejecución».

Ejemplo: entregar el registro de dispositivos comprobado, no solo escribir
un handler.

### Slide 6 — ¿Cuándo merece existir un agente?

**A:** destacar criterio, responsabilidad y herramientas propias; no leer
todos los puntos como requisitos acumulativos.

> «Un rol especializado se justifica cuando aporta decisiones o límites útiles.
> Un revisor de solo lectura también puede tener un objetivo pequeño.
> Para una petición puntual puede bastar el agente general».

**Transición a B:** «¿Y si no cambia el rol, sino la forma de hacer una tarea?».

### Slide 7 — Skill: enseñar a Copilot cómo hacer algo bien

**B:** recorrer la carpeta de la slide: SKILL.md y recursos opcionales.

> «Aquí empaquetamos conocimiento y procedimiento. El agente carga la capacidad
> cuando resulta relevante y consulta los recursos que necesita.
> La skill no es otro compañero de equipo ni ejecuta sola sus scripts».

Ejemplo: create-api-endpoint, con pasos, casos de prueba y validador.

### Slide 8 — ¿Cuándo crear una skill?

**B:** seguir las dos columnas de señales de la slide.

> «Si copiamos siempre el mismo checklist o varios agentes necesitan aplicar
> el mismo procedimiento, hay una buena candidata. Si basta una regla breve,
> la pondría en las instrucciones; si es una petición única, empezaría por un prompt».

No repetir la definición de la slide anterior: aquí se decide cuándo compensa.

### Slide 9 — Subagente: un especialista temporal

**B:** seguir el diagrama desde el principal hasta los trabajadores y la síntesis.

> «El principal mantiene el objetivo. Delega una misión acotada y recibe un
> resultado que debe integrar. Un agente personalizado puede ejecutarse así
> como subagente; no necesitamos inventar otra categoría de archivo».

Explicar las cuatro palabras de la slide: aislar contexto, especializar,
paralelizar cuando conviene y sintetizar.

> «Contexto separado no es disco aislado. En la demo habrá un único revisor
> de solo lectura; no necesitamos lanzar varios trabajadores para demostrarlo».

### Slide 10 — Una frase para recordar cada concepto

**B:** usar esta slide como pausa de síntesis, no como una nueva explicación.

> «Reglas que respetar. Procedimiento que reutilizar. Objetivo y responsabilidad.
> Parte del trabajo que delegar».

Aplicar las frases al mismo ejemplo de registro de dispositivos y pasar
el turno a A: «Con estas diferencias, ya podemos elegir».

### Slide 11 — ¿Qué debería crear?

**A:** recorrer el árbol tal como está dibujado.

> «¿Son reglas? Instrucciones. ¿Es un proceso reutilizable? Skill.
> ¿Necesito un rol que decide y actúa? Agente.
> ¿Una parte merece separarse? Delegación en un subagente».

Aclarar que las opciones se combinan y que un prompt puede bastar.

### Slide 12 — No construyas un ejército si basta una caja de herramientas

**A:** contrastar los dos diseños de la slide, sin proponer un tercer esquema.

> «Un agente para cada DTO, log o test añade coordinación. En muchos casos
> necesitamos un implementador con buenas capacidades, no cinco roles nuevos.
> Más agentes no implican automáticamente más calidad ni más velocidad».

Reservar unos segundos para la analogía con microservicios que cierra la slide.

### Slide 13 — Tres arquitecturas que sí funcionan

**A:** describir los tres patrones en el orden visible, con unos 30 segundos
por patrón:

1. **Generalista + skills:** procedimientos conocidos y poca coordinación.
2. **Orquestador + subagentes:** unidades de trabajo que sí justifican separación.
3. **Agentes + skills compartidas:** distintos roles reutilizan el mismo conocimiento.

> «No son niveles de madurez que haya que completar. Elegimos el patrón más
> sencillo que resuelve el problema. La demo combina un implementador con una
> skill y una revisión delegada».

**Transición a B:** «Vamos a verlo sobre una API real, pero deliberadamente pequeña».

### Slide 14 — De una petición vaga a un equipo de trabajo

**B:** presentar las cinco etapas visibles: prompt, instrucciones, skill,
subagentes y síntesis. Pasar al editor y seguir el cronómetro operativo de abajo.

> «La slide muestra la evolución del diseño. No vamos a ejecutar cinco versiones
> ni a forzar que el prompt simple salga mal. Veremos las piezas trabajando juntas».

Auth, seguridad y tests son ejemplos de especialización en la slide. Precisar
oralmente el alcance real:

> «En esta demo la misión delegada será revisar contrato y cobertura de pruebas.
> No implementaremos autenticación ni haremos una auditoría de seguridad».

B opera; A señala las evidencias y plantea preguntas breves. Al acabar,
regresar a la slide 15, no volver a recorrer las definiciones.

### Slide 15 — Cuando Copilot actúa, la seguridad deja de ser opcional

**A:** seguir los controles de la slide: mínimo privilegio, lectura frente a
escritura, secretos, trazabilidad, revisión humana y skills externas.

> «Escribir “solo lectura” no basta: hay que comprobar las herramientas reales.
> Revisamos los scripts como código y no introducimos credenciales ni datos
> sensibles en los ejemplos. El agente puede equivocarse y nosotros verificamos».

**B, matiz breve dentro del mismo bloque:**

> «Las opciones dependen del entorno: elegir un modelo Claude en Copilot no es
> ejecutar Claude Code. El harness coordina contexto, herramientas y permisos».

No abrir otra aplicación ni convertir este matiz en un bloque nuevo.

### Slide 16 — ¿Cómo revisarías la seguridad de una API?

**B:** recuperar expresamente la pregunta de la slide 2 y seguir las cuatro
respuestas de esta slide.

> «Instrucciones para establecer reglas. Skill para un checklist repetible.
> Agente para un especialista con criterio y herramientas. Subagente cuando
> el principal le delega esa revisión dentro de un trabajo mayor».

> «Podemos combinarlas. La demo ha mostrado ese mecanismo con una revisión
> de contrato, no ha demostrado que una API sea segura».

Dar espacio para que A contraste la respuesta con la intuición inicial del público.

### Slide 17 — Tres ideas para llevarte

**A:** cerrar con las tres ideas que aparecen, sin sustituirlas por otro resumen:

> «No empieces creando agentes: identifica reglas, procedimientos y responsabilidades.
> Las skills son capacidades, no compañeros de equipo.
> Los subagentes son una decisión de orquestación».

**B:** señalar el repositorio para repetir la demo.
**A:** pronunciar la idea final de la slide y abrir preguntas.

## Variante de 35 minutos y control de tiempo

Se mantiene el orden completo de las 17 slides. Reducir profundidad, no eliminar
las slides de decisión, resumen o patrones.

| Bloque | Versión de 40 min | Versión de 35 min |
|---|---|---|
| Slides 1–6 | 00:00–09:00 | 00:00–08:00 |
| Slides 7–10 | 09:00–15:00 | 08:00–13:00 |
| Slides 11–13 | 15:00–19:00 | 13:00–16:00 |
| Slide 14 + demo | 19:00–32:00 | 16:00–27:00 |
| Slides 15–17 | 32:00–37:00 | 27:00–32:00 |
| Preguntas | 37:00–40:00 | 32:00–35:00 |

Para comprimir: un ejemplo por concepto, una frase por criterio, 20 segundos
por patrón y demo de 11 minutos. En esa demo, reservar 1 minuto para lanzamiento,
4 para implementación, 3 para revisión, 2 para pruebas y 1 para síntesis.
Las peticiones HTTP son opcionales; preparar una grabación de respaldo.

La versión de 40 minutos no tiene margen adicional fuera del reloj indicado.
Si se retrasa el agente, activar recuperación y recortar peticiones opcionales;
no prolongar la demo a costa de omitir las slides finales.
No escribir personalizaciones desde cero ni abrir una segunda demo en Claude Code.

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

## Demo, minutos 0–2: objetivo, contexto y lanzamiento (19:00–21:00)

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

## Demo, minutos 2–7: implementación y lectura del flujo (21:00–26:00)

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

## Demo, minutos 7–10: delegación (26:00–29:00)

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

## Demo, minutos 10–12: evidencia funcional (29:00–31:00)

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

## Demo, minutos 12–13: síntesis y transición (31:00–32:00)

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
