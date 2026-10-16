# Agentes, skills y subagentes: qué son y cuándo utilizarlos

Documento de consulta para desarrolladores y material de apoyo para la charla.
Los conceptos se aplican a asistentes de código como GitHub Copilot y Claude
Code; las opciones concretas dependen del producto, su versión y su entorno
de ejecución.

## 1. La diferencia en una frase

> **Agente:** persigue un objetivo y decide cómo actuar.
>
> **Skill:** aporta conocimiento y un procedimiento reutilizable.
>
> **Subagente:** ejecuta una parte del trabajo por delegación de otro agente.

No son tres alternativas excluyentes. Un agente puede utilizar varias skills
y delegar una tarea en un subagente. Además, una misma definición de agente
personalizado puede utilizarse como principal o como subagente.

## 2. Agente

### Definición

Un agente es un sistema que recibe un objetivo, interpreta el contexto, decide
acciones, utiliza las herramientas disponibles y observa sus resultados para
continuar, corregir el plan o finalizar.

### Descripción

A diferencia de una petición que solo busca una respuesta de texto, un flujo
agéntico puede encadenar acciones: explorar un repositorio, modificar código,
ejecutar pruebas y corregir errores.

```text
Objetivo → Interpretar → Decidir → Actuar → Observar → Ajustar → Resultado
```

Conviene distinguir:

- **Agente en ejecución:** el sistema que está realizando el trabajo.
- **Agente personalizado:** una configuración reutilizable de rol,
  instrucciones, herramientas y, cuando se admite, modelo y otras opciones.

Crear un archivo de agente personalizado no crea por sí mismo un servicio,
un proceso independiente o memoria permanente. El entorno de ejecución
aplica esa configuración cuando se utiliza.

### Cuándo usar un agente

- El objetivo necesita varias acciones y decisiones en función de los resultados.
- Hay que investigar antes de saber exactamente qué cambiar.
- Se necesita iterar entre implementación, pruebas y correcciones.
- La tarea requiere combinar herramientas, no solo generar texto.

No hace falta crear un agente personalizado para cada tarea: muchas se resuelven
con el agente general del asistente y un buen prompt.

### Cuándo crear un agente personalizado

- Hay un **rol recurrente** con criterios propios: implementador, revisor,
  arquitecto o especialista en migraciones.
- Es útil mantener un conjunto de herramientas distinto para ese rol.
- Se quieren límites claros de responsabilidad y un formato de entrega estable.
- Se repite una configuración que no conviene reescribir en cada conversación.

No es necesario que el rol sea amplio. Un revisor acotado puede justificarse
por sus restricciones de herramientas y sus criterios especializados.

### Cuándo no crearlo

- La petición es puntual y se explica bien en un prompt.
- Solo se necesita documentar una convención del repositorio.
- Lo único que cambia es un procedimiento que el agente existente puede seguir.
- Su responsabilidad se solapa con otro agente sin aportar límites útiles.

### Ejemplo

**Workshop Builder:** implementa una funcionalidad de la API, utiliza la skill
del proyecto, ejecuta las pruebas e integra una revisión delegada.

Su valor está en la responsabilidad de entregar un resultado comprobado,
no en generar una clase concreta.

## 3. Skill

### Definición

Una skill es una capacidad reutilizable que empaqueta instrucciones,
conocimiento especializado y, opcionalmente, scripts, referencias, plantillas
u otros recursos que un agente puede cargar cuando resultan relevantes.

### Descripción

Responde a la pregunta: **«¿Cómo hacemos bien esta tarea?»**.
Normalmente se organiza como una carpeta con un archivo `SKILL.md`.

La carga suele ser progresiva:

1. El agente puede consultar metadatos para descubrir la capacidad.
2. Carga sus instrucciones cuando la utiliza.
3. Consulta los recursos auxiliares que necesita.

Una skill puede enseñar un procedimiento con decisiones; no tiene que ser
una receta rígida. Cargarla no reentrena el modelo, no garantiza cumplimiento
y no ejecuta automáticamente los scripts incluidos.

### Cuándo usar una skill existente

- Su ámbito coincide con la tarea y con las convenciones del proyecto.
- Aporta un procedimiento o conocimiento que evita improvisar.
- Sus recursos son fiables y se han revisado antes de ejecutar scripts.

### Cuándo crear una skill

- Se repite un procedimiento, checklist o conjunto de criterios.
- Se copian las mismas instrucciones extensas en distintos prompts.
- Varios agentes necesitan aplicar el mismo conocimiento.
- Conviene versionar juntos el procedimiento y sus recursos.
- La capacidad tiene un ámbito reconocible y resultados verificables.

### Cuándo no crearla

- Basta una regla breve que debería estar en las instrucciones del repositorio.
- La tarea es excepcional y no hay una expectativa razonable de reutilización.
- Se necesita otro rol con herramientas o responsabilidad diferentes.
- Un script determinista resuelve todo sin necesidad de interpretación: puede
  bastar ejecutar ese script, sin envolverlo en una skill.

### Ejemplo

**create-api-endpoint:** enseña a leer el contrato, añadir pruebas, validar
entradas, gestionar duplicados y ejecutar el validador.

El agente conserva la responsabilidad de decidir, implementar y comprobar.
La skill le proporciona el procedimiento y la matriz de casos.

## 4. Subagente

### Definición

Un subagente es un agente invocado por otro agente para realizar una misión
acotada dentro de un objetivo mayor y devolverle un resultado.

### Descripción

«Subagente» describe una **forma de ejecución por delegación**, no
necesariamente un tipo de archivo o una configuración diferente.
Puede utilizar un agente incorporado en el asistente o un agente personalizado.

El principal conserva el objetivo global y se encarga de integrar y verificar
los resultados. El subagente trabaja con un contexto separado, cuya información
inicial y persistencia dependen del entorno.

**Contexto separado no significa filesystem aislado.** Dos agentes podrían
modificar los mismos archivos si sus herramientas y permisos lo permiten.

### Cuándo usar un subagente

- La tarea tiene un objetivo y un resultado separables.
- Requiere suficiente exploración como para llenar el contexto principal
  de detalles intermedios.
- Conviene aplicar criterios o herramientas diferentes en una revisión.
- Existen tareas independientes que pueden ejecutarse en paralelo con beneficio.
- El coste de coordinar es menor que el beneficio del aislamiento de contexto
  o de la especialización.

No es obligatorio ejecutarlo en paralelo: una revisión después de implementar
también es una delegación útil.

### Cuándo crear una definición personalizada para ese subagente

- Se delega repetidamente la misma clase de misión.
- Necesita instrucciones, restricciones o una salida consistentes.
- Se quiere limitar expresamente el conjunto de herramientas de ese trabajador.

Para una delegación ocasional puede bastar un subagente general con una misión
bien redactada. No hace falta crear un archivo nuevo para cada invocación.

### Cuándo no usarlo

- La tarea es una búsqueda breve o una lectura que el principal puede resolver.
- Necesita intercambios constantes con el principal para avanzar.
- No se puede describir un resultado claro que devolver.
- Varias tareas dependen unas de otras y no se gana nada al separarlas.
- Introduce escritores concurrentes sobre los mismos archivos sin coordinación.
- Solo se busca aparentar un «equipo de agentes».

### Qué debe incluir la delegación

| Elemento | Ejemplo |
|---|---|
| Objetivo | Comparar implementación y pruebas con el contrato HTTP |
| Contexto | Rutas del contrato, endpoint y pruebas |
| Restricciones | Solo lectura; sin terminal ni cambios |
| Resultado esperado | Hallazgos con archivo, caso demostrable y recomendación |
| Criterio de parada | Entregar el informe y terminar |

### Ejemplo

**Contract Reviewer**, invocado por Workshop Builder, revisa códigos HTTP,
Location, límites, duplicados y cobertura de pruebas.

El principal recibe el informe, decide qué hallazgos están justificados y
ejecuta las pruebas. La revisión delegada no sustituye esa verificación.

## 5. Comparación rápida

| Aspecto | Agente personalizado | Skill | Subagente |
|---|---|---|---|
| Qué representa | Un rol y su configuración | Una capacidad reutilizable | Una ejecución delegada |
| Pregunta principal | ¿Qué responsabilidad y herramientas necesita? | ¿Cómo se hace bien esta tarea? | ¿Qué parte merece separarse? |
| Qué se define | Instrucciones, criterios, herramientas y límites | Conocimiento, pasos y recursos | Misión, contexto, límites y resultado |
| Trabajo en contexto separado | No por el mero hecho de definirlo | Normalmente no; depende de extensiones del producto | Es una de sus características habituales |
| Reutilización | Del rol | De la capacidad | De la definición, si existe; cada invocación es trabajo concreto |
| Coste añadido principal | Mantener roles y límites | Mantener conocimiento y recursos | Coordinar, transferir contexto e integrar resultados |

Estas diferencias son un modelo mental, no una especificación universal:
algunos productos permiten que una skill solicite ejecución en un subagente.

## 6. Cómo elegir

1. **Empieza con un prompt.** Si resuelve la necesidad, no añadas estructura.
2. **Identifica las reglas estables.** Ponlas en las instrucciones del proyecto.
3. **Busca conocimiento reutilizable.** Si es una capacidad bajo demanda,
   considera una skill.
4. **Busca una responsabilidad diferente.** Si cambia el rol, el criterio
   o las herramientas, considera un agente personalizado.
5. **Evalúa una separación concreta del trabajo.** Si compensa la coordinación,
   utiliza un subagente.

No es una cadena obligatoria ni una elección exclusiva.

### Casos de decisión

| Necesidad | Elección inicial |
|---|---|
| Explicar una función una sola vez | Prompt |
| Todos los endpoints deben usar Problem Details | Instrucciones del proyecto |
| Seguir el mismo procedimiento para crear endpoints | Skill |
| Mantener un rol de revisión con herramientas de solo lectura | Agente personalizado |
| Delegar esa revisión durante una implementación | Ejecutar el revisor como subagente |
| Ejecutar un formateador siempre en CI | Automatización determinista, no otro agente |

## 7. Las tres piezas en la demo .NET

```text
Usuario: implementar POST /devices
                │
                ▼
       Workshop Builder              ← Agente principal
                │
                ├─ create-api-endpoint ← Skill que utiliza
                │
                ├─ Implementa y ejecuta pruebas
                │
                └─ Contract Reviewer   ← Agente invocado como subagente
                          │
                          └─ Devuelve hallazgos
                │
                ▼
       Integra, verifica y entrega
```

La demo utiliza [instrucciones del proyecto](../.github/copilot-instructions.md),
el agente [Workshop Builder](../.github/agents/workshop-builder.agent.md),
la skill [create-api-endpoint](../.github/skills/create-api-endpoint/SKILL.md)
y el agente [Contract Reviewer](../.github/agents/contract-reviewer.agent.md).
El comportamiento se verifica contra el [contrato funcional](device-contract.md).

## 8. Errores que conviene evitar

- **Confundir contexto con seguridad:** separar conversaciones no garantiza
  aislamiento de procesos, archivos o credenciales.
- **Confundir instrucciones con controles:** una regla escrita no sustituye
  permisos, pruebas o controles de CI.
- **Confundir especialización con entrenamiento:** una skill aporta contexto;
  no modifica los pesos del modelo.
- **Delegar por sistema:** más agentes pueden aumentar latencia, coste y errores.
- **Confiar en el informe sin evidencia:** un subagente también puede equivocarse.
- **Suponer portabilidad completa:** el estándar de skills facilita compartir
  contenido, pero las extensiones, herramientas y rutas varían.

El **harness** es el entorno que coordina modelo, contexto, herramientas y permisos.
Usar Claude como modelo dentro de Copilot no equivale a utilizar Claude Code.
Antes de compartir configuraciones, comprobar qué admite el entorno de destino.

## 9. Resumen para recordar

> Crea una **skill** cuando quieras reutilizar conocimiento o un procedimiento.
>
> Crea un **agente personalizado** cuando necesites un rol con criterios,
> responsabilidad o herramientas propios.
>
> Usa un **subagente** cuando una misión concreta merezca ejecutarse por delegación.
>
> Si basta un prompt, unas instrucciones o un script, no añadas más piezas.

## Referencias

Para ampliar conceptos y comprobar las opciones admitidas en cada entorno:

- [Guía de la charla y matices de compatibilidad](../guide.md).
- [VS Code: agentes personalizados](https://code.visualstudio.com/docs/agent-customization/custom-agents).
- [VS Code: Agent Skills](https://code.visualstudio.com/docs/agent-customization/agent-skills).
- [VS Code: subagentes](https://code.visualstudio.com/docs/agents/run/subagents).
- [GitHub Copilot: Agent Skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills).
- [Claude Code: subagentes](https://code.claude.com/docs/en/sub-agents).
- [Claude Code: skills](https://code.claude.com/docs/en/skills).
