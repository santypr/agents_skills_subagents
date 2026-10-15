# Revisión del PowerPoint

Archivo original: [GitHub_Copilot_Agentes_Skills_Subagentes.pptx](../slides/GitHub_Copilot_Agentes_Skills_Subagentes.pptx).
No modificado. Se revisó el texto de las 17 diapositivas, no su diseño renderizado.

## Recorrido para 35–40 minutos y dos ponentes

- Usar como recorrido principal: **1, 2, 3, 4, 5, 7, 9, 11, 12, 14, 15, 16, 17**.
- Reservar **6, 8, 10 y 13** para preguntas o material posterior: repiten criterios
  que ya se explican con el ejemplo. No borrarlas del original.
- En la slide 14, pasar al editor durante 13 minutos. Evitar recorrer todos
  los archivos o hacer una segunda implementación sin personalizaciones.
- A abre y construye el modelo mental; B explica capacidades/delegación y
  conduce la demo. A interpreta las evidencias mientras B opera.
- No repartir por «primera mitad/segunda mitad»: conectar los bloques con
  preguntas cortas ensayadas, sin interrumpirse continuamente.
- La comparación con Claude Code ocupa aproximadamente un minuto dentro del
  bloque de límites; no es una segunda demo.

Distribución y diálogo sugerido en el [guion de presentador](presenter-runbook.md).

## Cambios recomendados

| Slide | Evaluación y cambio |
|---|---|
| 1 | Título válido. Mantener la metáfora del compañero sin atribuir responsabilidad humana al agente. |
| 2 | Cambiar «ESPECIALIZACIÓN — Aprende» por «Carga capacidades». Explicar que no hay reentrenamiento. |
| 3 | Mapa mental útil. Añadir oralmente: son dimensiones, no cuatro clases excluyentes; un agente personalizado puede ejecutarse como subagente. |
| 4 | Sustituir «Estables y siempre aplicables» por «Generales o activadas por ámbito». «Nunca debería negociar» expresa intención, no un control técnico. |
| 5 | Bucle correcto como simplificación. Aclarar que el runtime/harness ejecuta herramientas y gestiona permisos; el archivo de agente configura un rol. |
| 6 | Lista orientativa, no requisitos acumulativos. Un revisor puede tener un objetivo estrecho y ser útil por sus herramientas/restricciones. |
| 7 | Estructura correcta para Copilot. Solo SKILL.md es necesario; subcarpetas opcionales. Mostrar descubrimiento → cuerpo → recursos. |
| 8 | Correcta. Matizar que una skill también puede empaquetar conocimiento y criterios, no solo pasos rígidos. |
| 9 | Añadir «Contexto separado ≠ filesystem aislado». Paralelismo posible, no obligatorio ni siempre beneficioso. En la demo habrá un solo reviewer. |
| 10 | Frases válidas como recordatorio; no usarlas como definición normativa de todos los productos. |
| 11 | Árbol útil si se presenta como heurística. Añadir «Empieza con un prompt» y aclarar que las piezas se combinan. |
| 12 | Mantener: es uno de los mensajes más fuertes. No convertir cada script pequeño en una skill innecesaria. |
| 13 | Patrones plausibles, no garantía de mejora. Añadir coste/latencia y evitar escritores paralelos sobre los mismos archivos. |
| 14 | Ajustar al material real: «Petición → instrucciones → skill → implementación → revisión delegada → pruebas». Cambiar «Auth · Seguridad · Tests» por «Contrato · Cobertura». No se ha implementado autenticación ni una auditoría de seguridad. |
| 15 | Buena base. Cambiar «SECRETOS — Nunca en prompts ni recursos» por «No incluir credenciales ni datos sensibles». Aclarar que permisos y controles deben verificarse; no basta con escribirlos. |
| 16 | El ejemplo de seguridad es válido conceptualmente. Aclarar que la demo revisa contrato y pruebas, no seguridad. Las cuatro respuestas también pueden combinarse. |
| 17 | Cierre correcto. Añadir oralmente «usa la pieza más simple y comprueba el resultado». |

## Dos mensajes que faltan

No es necesario añadir slides si no quieres cambiar el deck:

1. Entre las slides 5 y 7, explicar durante un minuto:
   **«Modelo no es harness: usar Claude como modelo en Copilot no es Claude Code».**
   Mostrar la tabla comparativa de la guía si hace falta.
2. Antes de la demo, mostrar el selector real de entorno y explicar:
   **«Esta demo está ensayada para un harness concreto; no todas las opciones de
   agentes y skills son portables».**

## Notas para la comparación

No prometer que un prompt vago fracasará. Las instrucciones ya están presentes
en el workspace de la demo, por lo que esa ejecución no sería una línea base
«sin personalización». Presentar la evolución como explicación del diseño.
Una comparación A/B real exigiría carpetas y sesiones separadas, condiciones
controladas y varias repeticiones; no es necesaria para esta charla.
