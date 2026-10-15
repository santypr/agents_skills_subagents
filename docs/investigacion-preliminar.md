# Investigación preliminar: copia histórica

Documento original conservado como antecedente, no como referencia validada.
La afirmación inicial sobre 4638 referencias internas no se ha podido verificar
y se ha retirado de esta copia. Sus afirmaciones técnicas deben leerse junto con
la [guía revisada](../guide.md), que prevalece en caso de discrepancia.

Descripción corta para publicitar la charla
Opción 1. Directa y técnica

GitHub Copilot: agentes, skills y subagentes

GitHub Copilot ya no es solo un asistente que completa código. Ahora puede planificar, usar herramientas, aplicar conocimientos especializados y delegar trabajo. En esta charla entenderemos qué son los agentes, las skills y los subagentes, cómo se relacionan y, sobre todo, cuándo conviene crear cada uno. Todo ello con ejemplos reales para pasar de “pedir código a Copilot” a diseñar auténticos flujos de desarrollo agénticos.

Opción 2. Más provocadora

Tu próximo compañero de equipo será un agente

¿Qué ocurre cuando GitHub Copilot deja de limitarse a sugerir código y empieza a investigar, planificar, implementar, revisar y delegar tareas? Descubriremos cómo funcionan los agentes, las skills y los subagentes, qué problemas resuelve cada concepto y cómo evitar construir un ejército de agentes cuando una simple skill era suficiente.

Opción 3. Orientada a arquitectura

Diseñando equipos de agentes con GitHub Copilot

Un agente no es una skill, y un subagente no es simplemente otro chatbot. En esta charla construiremos un modelo mental para diseñar soluciones con GitHub Copilot: agentes que coordinan, skills que encapsulan procedimientos reutilizables y subagentes que ejecutan tareas especializadas en contextos aislados. Veremos criterios de arquitectura, patrones, errores habituales y una demostración práctica.

Mi recomendación: utilizaría la opción 2 para un meetup o evento de comunidad, porque genera curiosidad sin caer en una descripción excesivamente comercial.

Posible guion de la charla
Título recomendado
Tu próximo compañero de equipo será un agente
Agentes, skills y subagentes en GitHub Copilot

Duración sugerida: 50-60 minutos, incluyendo demostración y preguntas.

1. Apertura: Copilot ya no es solo autocompletado
Objetivo

Romper desde el principio el modelo mental de “Copilot como generador de código”.

Mensaje de apertura

Durante los últimos años hemos aprendido a escribir mejores prompts.
 Ahora tenemos que aprender a diseñar mejores sistemas de trabajo para agentes.

Puedes comenzar mostrando una evolución sencilla:

Autocompletado: Copilot predice la siguiente línea.
Chat: Copilot responde preguntas sobre el código.
Modo agente: Copilot explora, modifica, ejecuta y valida.
Especialización: proporcionamos instrucciones, skills y herramientas.
Orquestación: un agente delega trabajo en subagentes.
Pregunta para la audiencia

Si necesitáis que Copilot revise la seguridad de una API, ¿qué crearíais: unas instrucciones, una skill, un agente de seguridad o un subagente?

No respondas todavía. Utiliza esa pregunta como hilo conductor y recupérala al final.

2. Antes de empezar: aclarar la terminología

Esta sección es importante porque los conceptos suelen mezclarse.

Instrucciones

Las instrucciones definen reglas estables que Copilot debería respetar:

Convenciones del repositorio.
Arquitectura utilizada.
Versiones del stack.
Estilo de código.
Reglas de seguridad.
Comandos habituales.
Limitaciones del proyecto.

Ejemplo:

Este repositorio utiliza arquitectura hexagonal.
 Los controladores no pueden acceder directamente a Entity Framework.
 Todos los endpoints deben incluir pruebas de integración.

Las instrucciones responden principalmente a:

¿Cómo debemos trabajar en este proyecto?

No representan un trabajador especializado ni un flujo completo. Son contexto y restricciones.

3. ¿Qué es un agente?

Un agente es la entidad que recibe un objetivo, interpreta el contexto, decide qué pasos realizar, selecciona herramientas, ejecuta acciones y evalúa los resultados.

Su estructura mental podría representarse así:

Objetivo
   ↓
Interpretar contexto
   ↓
Crear o ajustar un plan
   ↓
Seleccionar herramientas
   ↓
Ejecutar acciones
   ↓
Observar resultados
   ↓
Corregir o continuar
   ↓
Entregar resultado


En GitHub Copilot, un agente personalizado puede tener su propio prompt, restricciones de herramientas y servidores MCP opcionales.

Qué caracteriza a un agente

Un agente puede disponer de:

Una identidad o rol.
Un objetivo amplio.
Instrucciones propias.
Herramientas autorizadas.
Acceso a determinadas fuentes de contexto.
Criterios para tomar decisiones.
Límites de seguridad.
Capacidad para trabajar durante varios pasos.
Capacidad para delegar.
Ejemplos
Agente de arquitectura.
Agente de migración de .NET.
Agente de implementación.
Agente de revisión de seguridad.
Agente de documentación.
Agente de diagnóstico de incidencias.
Cuándo crear un agente

Crea un agente cuando necesites:

Un rol reconocible y reutilizable.
Un objetivo relativamente amplio.
Criterios propios para tomar decisiones.
Una combinación específica de herramientas.
Restricciones de seguridad diferentes.
Interacción directa con el usuario.
Coordinación de varias actividades.
Un comportamiento mantenido durante una sesión.
Ejemplo de agente

Un API Architect Agent podría:

Analizar una necesidad funcional.
Explorar el repositorio.
Identificar los patrones existentes.
Proponer el contrato de la API.
Evaluar autenticación, observabilidad y resiliencia.
Preparar un plan de implementación.
Delegar la revisión de seguridad.

Aquí el valor no está en seguir unos pasos rígidos, sino en tomar decisiones dentro de un ámbito de responsabilidad.

4. ¿Qué es una skill?

Una skill es una capacidad especializada, reutilizable y cargable cuando resulta relevante.

GitHub describe las Agent Skills como carpetas que contienen instrucciones, scripts y recursos que Copilot puede cargar para realizar mejor determinadas tareas especializadas. Las skills pueden vivir dentro del proyecto o en el entorno personal del usuario.

Una estructura típica sería:

.github/
└── skills/
    └── create-api-endpoint/
        ├── SKILL.md
        ├── scripts/
        ├── references/
        ├── assets/
        └── examples/

Qué puede contener una skill
Instrucciones detalladas.
Procedimientos.
Scripts auxiliares.
Plantillas.
Ejemplos.
Documentación de referencia.
Validadores.
Recursos necesarios para completar la tarea.
Pregunta que responde una skill

¿Cómo se realiza correctamente esta tarea repetible?

Ejemplos de skills
Crear un endpoint siguiendo los estándares del proyecto.
Generar una migración de base de datos.
Validar contratos OpenAPI.
Crear una Azure Function.
Preparar un ADR.
Añadir observabilidad con OpenTelemetry.
Crear pruebas de integración.
Generar infraestructura Terraform según las convenciones corporativas.
Cuándo crear una skill

Crea una skill cuando:

El procedimiento se repite.
Puede explicarse mediante pasos relativamente estables.
Quieres reutilizarlo desde diferentes agentes.
Necesitas incluir scripts, ejemplos o plantillas.
Quieres evitar repetir instrucciones muy extensas.
No necesitas una identidad ni un proceso de decisión independiente.
La capacidad tiene entradas y resultados razonablemente claros.
Frase clave

Un agente decide qué trabajo debe realizarse.
 Una skill enseña cómo realizar bien una tarea concreta.

Una skill no tiene por qué convertirse en otro agente. Puede ser simplemente una capacidad que el agente descubre y carga cuando la necesita.

5. ¿Qué es un subagente?

Un subagente es un agente utilizado temporalmente por otro agente para resolver una parte concreta del problema.

El agente principal mantiene el objetivo global. El subagente recibe una misión más estrecha, trabaja en un contexto aislado y devuelve sus conclusiones al agente principal. La documentación de GitHub distingue precisamente entre el agente principal de la sesión y el subagente temporal que se lanza para realizar una tarea especializada.

Modelo mental
Usuario
   ↓
Agente principal
   ├── Subagente de exploración
   ├── Subagente de seguridad
   ├── Subagente de testing
   └── Subagente de documentación
          ↓
El agente principal integra los resultados
          ↓
Respuesta o implementación final

Qué aporta un subagente
Aislamiento de contexto

El subagente recibe únicamente el contexto necesario para su tarea. Esto evita llenar la conversación principal con búsquedas, hipótesis y detalles intermedios.

Especialización

Puede disponer de instrucciones y herramientas diferentes.

Paralelismo

Varias tareas independientes pueden delegarse en paralelo.

Separación de responsabilidades

El agente principal coordina. Los subagentes investigan, implementan o revisan.

Síntesis controlada

El agente principal decide qué resultados incorporar y cómo resolver contradicciones.

Cuándo utilizar un subagente

Utiliza un subagente cuando:

La tarea puede aislarse claramente.
Requiere bastante exploración.
Necesita instrucciones o herramientas diferentes.
Puede ejecutarse de forma independiente.
Quieres comparar varias soluciones.
Necesitas revisiones desde perspectivas diferentes.
Quieres preservar limpio el contexto principal.
El agente principal debe coordinar, no ejecutar todos los detalles.
Ejemplos
Un subagente estudia la autenticación existente.
Otro analiza las dependencias afectadas.
Otro revisa amenazas de seguridad.
Otro diseña las pruebas.
El agente principal combina todos los resultados y propone el plan.
6. Comparación directa
Concepto	Responsabilidad principal	Persistencia	Contexto	Reutilización	Habla con el usuarioInstrucción	Definir reglas y convenciones	Estable	Proyecto o ámbito	Alta	No
Skill	Enseñar un procedimiento reutilizable	Bajo demanda	Tarea especializada	Muy alta	No necesariamente
Agente	Perseguir un objetivo y tomar decisiones	Sesión o workflow	Contexto amplio	Alta	Normalmente sí
Subagente	Resolver una parte delegada del objetivo	Temporal	Aislado y reducido	Depende de su definición	Normalmente no
La diferencia esencial
INSTRUCCIÓN
“Estas son las reglas que debes respetar.”

SKILL
“Así se realiza correctamente esta tarea.”

AGENTE
“Este es tu objetivo y tu ámbito de responsabilidad.”

SUBAGENTE
“Resuelve esta parte del problema y devuelve el resultado.”

7. Árbol de decisión: ¿qué debería crear?

Puedes utilizar este árbol durante la charla:

¿Solo necesito establecer reglas o convenciones?
├── Sí → Instrucciones
└── No
    ↓
¿Necesito enseñar un proceso concreto y repetible?
├── Sí → Skill
└── No
    ↓
¿Necesito un rol que tome decisiones y use herramientas?
├── Sí → Agente
└── No → Probablemente basta con un prompt
    ↓
¿Una parte del trabajo puede aislarse o ejecutarse en paralelo?
├── Sí → Delegarla en un subagente
└── No → Mantenerla en el agente principal

Regla práctica

Si lo que cambia es el conocimiento procedimental, crea una skill.
 Si lo que cambia es la responsabilidad, las herramientas o el criterio de decisión, crea un agente.
 Si lo que cambia es la unidad de trabajo delegada durante una ejecución, utiliza un subagente.

8. El error habitual: crear demasiados agentes

Este puede ser uno de los mensajes más valiosos de la charla.

No todo necesita ser un agente.

Mal diseño
Agente para crear controladores
Agente para crear DTOs
Agente para añadir logs
Agente para generar tests
Agente para actualizar el README


En muchos casos, esto debería ser:

Agente de implementación
├── Skill para crear endpoints
├── Skill para añadir observabilidad
├── Skill para generar pruebas
└── Skill para actualizar documentación

Por qué evitar el exceso de agentes
Aumenta la coordinación.
Aumenta la posibilidad de instrucciones contradictorias.
Hace más difícil determinar quién es responsable del resultado.
Duplica conocimiento.
Fragmenta excesivamente el contexto.
Complica la evolución del sistema.
Puede aumentar el número de decisiones y llamadas necesarias.
Frase para la audiencia

Un ecosistema de agentes no mejora por tener más agentes, igual que una arquitectura de microservicios no mejora por tener más microservicios.

9. Demo propuesta
Caso: añadir una nueva funcionalidad a una API .NET

El objetivo puede ser:

Añadir un endpoint para registrar dispositivos, incluyendo validación, persistencia, autenticación, observabilidad, pruebas y documentación OpenAPI.

Este caso encaja bien con tu perfil porque permite hablar de arquitectura, .NET, APIs, seguridad y automatización sin convertir la demo en un ejemplo artificial.

Parte 1. Resolverlo únicamente con un prompt

Pides a Copilot:

Añade un endpoint para registrar dispositivos.


Muestras las limitaciones:

Tiene que descubrir demasiadas convenciones.
Puede tomar decisiones inconsistentes.
La validación puede no coincidir con el proyecto.
La observabilidad puede quedar fuera.
Las pruebas pueden ser superficiales.
Todo el trabajo comparte el mismo contexto.
Parte 2. Añadir instrucciones del repositorio

Incorporas reglas como:

Arquitectura utilizada.
Convenciones de nombres.
Librería de validación.
Política de errores.
Requisitos de autenticación.
Estrategia de pruebas.

Vuelves a ejecutar la tarea y comparas la mejora.

Parte 3. Añadir una skill

Creas una skill conceptual denominada:

create-api-endpoint


La skill contiene:

Pasos para crear el caso de uso.
Plantilla del endpoint.
Ejemplo de validador.
Convenciones OpenAPI.
Script para validar la solución.
Checklist de finalización.

Explicas que no has creado otro agente porque el problema es procedimental:

“Cada vez que haya que crear un endpoint, quiero que se siga este proceso.”

Parte 4. Incorporar agentes especializados

Defines conceptualmente:

Architecture Agent
Implementation Agent
Security Review Agent

Cada agente tiene responsabilidades y herramientas diferentes.

Por ejemplo, el agente de seguridad puede estar limitado a herramientas de lectura y análisis, sin permiso para modificar archivos.

Parte 5. Delegación en subagentes

El agente principal recibe la funcionalidad completa y delega:

Subagente 1:
Analiza cómo se implementa actualmente la autenticación.

Subagente 2:
Identifica el patrón utilizado para persistencia y transacciones.

Subagente 3:
Realiza un análisis de seguridad del nuevo endpoint.

Subagente 4:
Propón los escenarios de pruebas necesarios.


Después, el agente principal:

Recibe los resultados.
Resuelve incompatibilidades.
Construye el plan.
Aplica las skills necesarias.
Implementa.
Ejecuta validaciones.
Entrega un resumen.

La documentación actual del SDK de Copilot describe este patrón mediante agentes personalizados con prompts y herramientas delimitadas que pueden ser seleccionados por el runtime y utilizados como subagentes dentro de una sesión.

10. Patrones que puedes presentar
Patrón 1. Agente generalista con skills
Development Agent
├── Skill: create-endpoint
├── Skill: create-migration
├── Skill: add-telemetry
└── Skill: generate-tests

Cuándo utilizarlo
Equipos pequeños.
Repositorios homogéneos.
Procedimientos bien definidos.
Poca necesidad de aislamiento.
Tareas principalmente secuenciales.
Patrón 2. Orquestador con subagentes
Orchestrator Agent
├── Research Agent
├── Architecture Agent
├── Implementation Agent
└── Review Agent

Cuándo utilizarlo
Cambios transversales.
Repositorios grandes.
Varias áreas técnicas implicadas.
Necesidad de investigación previa.
Tareas paralelizables.
Revisiones independientes.
Patrón 3. Agentes con skills compartidas
Architecture Agent ──┐
Implementation Agent ├── Shared Skills
Review Agent ────────┘

Cuándo utilizarlo
Diferentes roles necesitan aplicar los mismos estándares.
Quieres centralizar los procedimientos.
Necesitas evitar duplicar instrucciones.
Quieres evolucionar procesos sin redefinir agentes.

Este es probablemente el patrón más interesante desde el punto de vista arquitectónico: los agentes representan responsabilidades y las skills encapsulan capacidades reutilizables.

11. Aspectos de gobierno y seguridad

Una vez que los agentes pueden ejecutar comandos o modificar código, la conversación ya no consiste únicamente en calidad de prompts.

Incluye una sección breve sobre:

Principio de mínimo privilegio.
Herramientas autorizadas por agente.
Separación entre lectura y escritura.
Validación antes de aceptar cambios.
Protección de secretos.
Trazabilidad de las acciones.
Límites del contexto proporcionado.
Revisión humana de operaciones sensibles.
Riesgo de skills no confiables.
Control sobre scripts incorporados en una skill.

Puedes plantearlo así:

Una skill no es simplemente documentación. Puede incluir scripts y recursos. Por tanto, instalar una skill externa debería tratarse de forma similar a incorporar una dependencia o una herramienta de automatización.

En materiales internos recientes también aparece esta evolución hacia agentes con herramientas, hooks, permisos, plugins y mecanismos de gobierno.

12. Recuperar la pregunta inicial

Vuelve al ejemplo de seguridad de una API.

Si necesitamos que Copilot revise la seguridad de una API, ¿qué creamos?

La respuesta correcta depende de la necesidad:

Instrucciones

Si solamente queremos establecer reglas obligatorias:

Todos los endpoints deben validar autorización y no deben registrar datos sensibles.

Skill

Si queremos un procedimiento repetible:

Ejecuta este checklist de seguridad, revisa estos patrones y genera un informe con esta plantilla.

Agente

Si necesitamos un especialista que investigue, tome decisiones, utilice herramientas concretas y dialogue con el usuario:

Security Review Agent.

Subagente

Si el agente principal está implementando una funcionalidad y delega temporalmente la revisión:

Ejecuta el Security Review Agent como subagente y devuelve los hallazgos al agente principal.

Conclusión

El mismo conocimiento de seguridad puede aparecer como instrucción, skill o agente. La diferencia está en el grado de autonomía, responsabilidad, reutilización y aislamiento que necesitamos.

13. Cierre
Tres ideas para llevarse a casa
1. No empieces creando agentes

Empieza identificando reglas, procedimientos y responsabilidades.

2. Las skills son capacidades, no compañeros de equipo

Encapsulan conocimiento operativo reutilizable.

3. Los subagentes son una decisión de orquestación

No representan necesariamente una nueva definición. Representan una forma de ejecutar temporalmente un agente dentro de una tarea mayor.

Frase final

El futuro del desarrollo no consiste en saber pedirle código a una IA.
 Consiste en saber diseñar el equipo, los procedimientos, el contexto y los límites con los que esa IA trabaja.

Posible distribución del tiempo
Bloque	Contenido	DuraciónApertura	De autocompletado a sistemas agénticos	5 min
Terminología	Instrucciones, agentes, skills y subagentes	12 min
Decisión de diseño	Cuándo crear cada elemento	8 min
Patrones y errores	Orquestación, reutilización y sobrearquitectura	8 min
Demo	API .NET con skills y subagentes	17 min
Seguridad y gobierno	Permisos, scripts y validación	5 min
Cierre y preguntas	Ideas clave	5 min
Mejoras aplicadas

He planteado la charla alrededor de un modelo mental y una decisión de arquitectura, no como una enumeración de funcionalidades de GitHub Copilot. La estructura progresa desde instrucciones hasta orquestación, utiliza un caso de API .NET cercano a tu experiencia y reserva los subagentes para el momento en que la delegación aporta aislamiento, especialización o paralelismo. También he incorporado el matiz más importante: una skill enseña un procedimiento, mientras que un agente asume una responsabilidad y toma decisiones.