# Agentes, skills y subagentes: guía revisada para la charla

Revisión: 15 de octubre de 2026. Fuentes oficiales al final.
La [investigación preliminar](docs/investigacion-preliminar.md) se conserva
como antecedente, no como documentación validada.

## 1. Veredicto sobre la investigación y las slides

La base conceptual es correcta: separar reglas, capacidades, responsabilidades
y delegación es una buena forma de enseñar estas herramientas. Son especialmente
acertados el rechazo a la sobrearquitectura y el uso de una funcionalidad real.

Hay que corregir o matizar:

| Afirmación | Versión precisa |
|---|---|
| «4638 referencias internas» | No verificable con los materiales disponibles. No usarlo como aval. |
| Las instrucciones son siempre aplicables | Las generales se incluyen según el entorno; otras dependen de rutas, relevancia o selección manual. |
| Las instrucciones establecen reglas obligatorias | Orientan al modelo; el cumplimiento debe comprobarse o imponerse con controles externos. |
| Especializar significa «aprender» | En esta demo significa cargar contexto/procedimientos; no reentrenar ni modificar pesos. |
| Un agente personalizado es una entidad autónoma nueva | El archivo configura un rol sobre un runtime existente; no crea por sí mismo un proceso o servicio. |
| Agente y subagente son tipos distintos | «Personalizado» describe la configuración; «subagente» describe cómo se invoca. Pueden ser la misma definición. |
| Un subagente recibe únicamente lo necesario | El principal debe preparar una tarea autocontenida; la herencia exacta depende del harness. |
| Contexto aislado implica entorno aislado | No. Pueden compartir directorio de trabajo y modificar los mismos archivos. |
| Delegar mejora calidad o velocidad | Puede ayudar; también añade coste, latencia, errores de síntesis y conflictos. Hay que medirlo. |
| Agentes/skills funcionan igual en todos los asistentes | El estándar de skills es compartido; rutas, extensiones, herramientas y permisos no son universales. |

Las diapositivas funcionan como soporte visual del modelo mental. Véanse las
[correcciones concretas por diapositiva](docs/slides-review.md).

## 2. El modelo mental

### Instrucciones: reglas y contexto

Responden a «¿cómo trabajamos aquí?». Ejemplos: stack, límites arquitectónicos,
convenciones de errores y comandos de pruebas.

En Copilot, `.github/copilot-instructions.md` sirve para instrucciones generales.
Las `.instructions.md` pueden acotarse por `applyTo`. Su descubrimiento depende
del harness y de la configuración. No confundir alcance con precedencia universal.

Una instrucción como «no publiques secretos» no sustituye permisos, controles de
salida, detección de secretos ni revisión humana.

### Skill: capacidad cargada bajo demanda

Carpeta con `SKILL.md` y, opcionalmente, scripts, referencias y recursos.
Responde a «¿cómo hacemos bien esta tarea?».

La carga progresiva suele distinguir:

1. Metadatos para descubrir la capacidad (`name`, `description`).
2. Cuerpo de la skill cuando se utiliza.
3. Recursos auxiliares cuando se necesitan.

No tiene que ser un algoritmo rígido: también puede encapsular conocimiento
especializado, criterios de evaluación o un procedimiento con decisiones.
No crea necesariamente otra conversación ni ejecuta automáticamente sus scripts.
El agente necesita herramientas y permisos para usarlos.

La activación puede ser automática por relevancia o explícita cuando el cliente
lo permite. No presentar una descripción bien escrita como garantía de activación.

### Agente: objetivo, decisiones, herramientas y observación

Un runtime agéntico combina modelo, contexto, herramientas y un bucle de trabajo:

```text
objetivo -> interpretar -> actuar -> observar -> ajustar -> resultado
```

Un agente personalizado configura un rol: instrucciones, herramientas permitidas
y, donde se admita, modelo y opciones de invocación. Puede usarse interactivamente
o ser invocado por otro agente.

El archivo no convierte al LLM en una identidad humana ni garantiza autonomía
ilimitada, memoria duradera o éxito. La responsabilidad final sigue siendo humana.

### Subagente: una ejecución delegada

Recibe una misión acotada, trabaja con su contexto y devuelve un resultado al
principal. Sirve para separar exploración extensa, revisión o trabajo independiente.

La tarea delegada debe incluir objetivo, contexto/rutas, restricciones, formato
de salida y criterio de parada. No dar por supuesto que conoce el historial.
Persistencia, seguimiento multiturno y anidamiento dependen del runtime.

**No confundir:**

- **Subagente:** trabajador invocado; el principal conserva el objetivo.
- **Handoff:** transición de la interacción a otro rol; no equivale a delegación.
- **Skill:** capacidad; normalmente no implica un trabajador separado.
- **MCP:** acceso a herramientas o contexto externo; no es un rol ni una skill.
- **Hook:** comando en un evento del runtime; puede imponer un control concreto,
  pero no garantiza por sí mismo un sistema seguro.
- **Prompt reutilizable:** entrada o tarea empaquetada; no todo merece una skill.

Claude Code permite extensiones de skills como ejecución en contexto delegado;
es un ejemplo de por qué no se deben convertir estas diferencias en prohibiciones
universales.

## 3. Modelo, producto y harness no son lo mismo

El modelo genera decisiones y texto. El harness organiza contexto, herramientas,
permisos y ejecución. VS Code es la interfaz/host; Copilot es también una familia
de productos con distintas superficies.

**Usar un modelo Claude en Copilot no es usar Claude Code.**

| Entorno | Configuración de referencia | Precaución |
|---|---|---|
| Copilot en VS Code, harness Local | `.github/agents/*.agent.md`, `.github/skills/*/SKILL.md`, instrucciones de workspace | La sintaxis y aliases de esta demo se dirigen a este harness. |
| Copilot harness / CLI | Agentes y skills según documentación de Copilot | Confirmar descubrimiento, herramientas y campos admitidos en la versión instalada. |
| Copilot cloud agent | Personalizaciones del repositorio admitidas por el producto | Ejecuta remotamente; no comparte sin más el contexto del editor local. |
| Claude Code | `.claude/agents/*.md`, `.claude/skills/*/SKILL.md`, `CLAUDE.md` | No copiar aliases, frontmatter o permisos de VS Code sin adaptarlos. |

La documentación actual de VS Code distingue varios harnesses. La disponibilidad
concreta depende de versión, extensiones, cuenta y políticas. Para el directo,
registrar el entorno ensayado y no actualizarlo en el último momento.

La demo está preparada para **VS Code/Insiders con harness Local**. Si se utiliza
Copilot harness, comprobar expresamente su compatibilidad antes de la charla.
No se ha ejecutado una sesión interactiva nueva de esos harnesses como parte
de la validación automatizada de este repositorio.

## 4. Cómo decidir sin crear un ejército

1. ¿Basta una petición puntual? Empieza por un prompt.
2. ¿Son convenciones recurrentes del repositorio? Instrucciones.
3. ¿Es conocimiento/procedimiento reutilizable bajo demanda? Skill.
4. ¿Cambia el rol, el criterio de decisión o el conjunto de herramientas? Agente.
5. ¿Hay una unidad de trabajo costosa y separable? Considera subagente.

No son ramas excluyentes: un agente puede seguir instrucciones, cargar una skill
y delegar una revisión. No delegar una búsqueda breve que el principal resolvería
con una lectura directa.

Paralelizar solo tareas independientes. Para escritores concurrentes, asignar
archivos distintos o worktrees y definir cómo integrar conflictos.
Un subagente de solo lectura es una opción didáctica más segura.

## 5. Demo incluida

Caso: implementar `POST /devices` en una Minimal API .NET 10 existente.

| Pieza | Qué demuestra |
|---|---|
| Instrucciones del workspace | Convenciones estables sin repetirlas en cada prompt |
| `create-api-endpoint` | Procedimiento y matriz de casos, con script de validación |
| `Workshop Builder` | Responsabilidad de implementar y verificar |
| `Contract Reviewer` | Mismo mecanismo de agente personalizado, invocado como subagente de solo lectura |
| Pruebas de integración | Verificación del contrato, no del discurso del agente |
| Estados Starter/Completed | Repetibilidad y recuperación sin depender del resultado del LLM |

El [contrato](docs/device-contract.md) incluye 201/400/409, Location, normalización,
límites exactos y unicidad concurrente. No incluye seguridad de producción,
autenticación, persistencia duradera u OpenAPI: añadir todo eso ocultaría
los conceptos en una demo de 13 minutos.

No mostrar que «sin skill sale mal» como si fuera una ley. Comparar decisiones
observadas, casos cubiertos y coste de dar contexto. Si ambas ejecuciones
funcionan, el resultado es válido; el interés es la mantenibilidad del proceso.

La sesión ya recibe instrucciones si los archivos están presentes. No fingir
una comparación «sin instrucciones» en el mismo workspace personalizado.
El guion propone usar el prompt vago como discusión, no como experimento A/B.

Arranque, prompts, recuperación y resultados de validación:
[README](README.md) y [guion de presentador](docs/presenter-runbook.md).

## 6. Guion de 35–40 minutos entre dos ponentes

Objetivo: 35 minutos de contenido, 3 de preguntas y hasta 2 de margen.
Se asume que las preguntas están incluidas en el tiempo total.
Ponente A conduce el problema y el modelo mental; ponente B desarrolla
la parte operativa y maneja el editor. Ambos intervienen en la demo.
No hacer dos minicharlas independientes ni cambiar de ordenador.

| Tiempo | Bloque | Reparto | Slides |
|---|---|---|---|
| 0–3 | Problema, promesa y pregunta inicial | A | 1–3 |
| 3–10 | Cuatro conceptos con un único ejemplo | A: instrucciones/agente; B: skill/subagente | 4, 5, 7, 9 |
| 10–14 | Cómo decidir y evitar sobrearquitectura | B, con contrapunto breve de A | 11, 12 |
| 14–27 | Demo: contrato, implementación con skill, revisión y pruebas | B opera; A interpreta y pregunta | 14 y editor |
| 27–31 | Límites, permisos y modelo frente a harness | A y B | 15 |
| 31–35 | Resolver la pregunta inicial y tres conclusiones | B responde; A cierra | 16, 17 |
| 35–38 | Preguntas | Ambos | 17 |
| 38–40 | Margen para latencia o preguntas, no contenido nuevo | Ambos | — |

Para un límite estricto de 35 minutos: conceptos 6 minutos, decisión 3,
y cierre 3; mantener la demo en 13. Son 32 minutos de contenido y 3 de preguntas.
Las slides 6, 8, 10 y 13 quedan como apoyo para preguntas, no como recorrido
obligatorio. La comparación con Claude Code es conceptual; no abrir una
segunda herramienta en directo.

La demo existente no necesita más código ni más agentes. El cambio es editorial:
restauración y pruebas iniciales antes de salir, lanzar la implementación pronto,
mostrar solo archivos clave y usar el respaldo si se consume el presupuesto.
El [guion a dos voces](docs/presenter-runbook.md) incluye frases de transición,
tiempos de demo y puntos de corte.

Pregunta inicial: «Para revisar el contrato de una API, ¿creamos instrucciones,
una skill, un agente o un subagente?». Respuesta: depende de si queremos expresar
reglas, empaquetar un procedimiento, configurar un rol o delegar una ejecución.
La seguridad puede usarse como otro ejemplo conceptual, sin simular una auditoría
que esta demo no realiza.

## 7. Gobierno y límites

- Mínimo privilegio real: revisar herramientas efectivamente disponibles.
- `tools: [read, search]` restringe herramientas en entornos que lo respetan;
  no constituye una sandbox universal.
- No dar terminal a un revisor solo para que «ejecute tests»: también abriría
  una vía de escritura. El principal ejecuta las pruebas.
- Scripts de skills y hooks son código: inspeccionarlos como dependencias.
- Instrucciones y resultados de herramientas pueden incluir contenido no fiable;
  no deben elevarlo a órdenes privilegiadas.
- El trabajo delegado no elimina el coste en tokens ni la necesidad de revisión.
- Un informe que dice «todo correcto» no sustituye evidencias reproducibles.
- No prometer trazabilidad, aislamiento de procesos o aprobaciones si no se han
  configurado y comprobado.

## 8. Fuentes oficiales

Consultadas para esta revisión; las páginas son documentación viva.

1. [VS Code: Agent Skills](https://code.visualstudio.com/docs/agent-customization/agent-skills)
2. [VS Code: custom agents y frontmatter](https://code.visualstudio.com/docs/agent-customization/custom-agents)
3. [VS Code: subagentes y diferencias por harness](https://code.visualstudio.com/docs/agents/run/subagents)
4. [VS Code: elegir un harness](https://code.visualstudio.com/docs/agents/run/agent-harnesses)
5. [VS Code: custom instructions y activación](https://code.visualstudio.com/docs/agent-customization/custom-instructions)
6. [GitHub: concepto y disponibilidad de Agent Skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
7. [Claude Code: subagentes](https://code.claude.com/docs/en/sub-agents)
8. [Claude Code: skills y extensiones del estándar](https://code.claude.com/docs/en/skills)

La verificación de slides se ha hecho sobre el texto extraído del PPTX, no sobre
su renderizado visual. No se ha modificado el PowerPoint original.
