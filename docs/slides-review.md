# Notas de acompañamiento del PowerPoint validado

Archivo original: [GitHub_Copilot_Agentes_Skills_Subagentes.pptx](../slides/GitHub_Copilot_Agentes_Skills_Subagentes.pptx).
No modificado. Se revisó el texto de las 17 diapositivas, no su diseño renderizado.
Las slides han sido validadas por el ponente y determinan el orden del guion.
Estas notas aportan matices orales, no solicitan rediseñar ni corregir el deck.

## Recorrido para 35–40 minutos y dos ponentes

- Seguir las **17 slides, de la 1 a la 17, en su orden original**.
- Las slides 6 y 8 explican cuándo crear cada pieza; la 10 consolida las
  diferencias; la 13 presenta los patrones. Se mantienen en la exposición.
- En la slide 14, pasar al editor durante 13 minutos. Evitar recorrer todos
  los archivos o hacer una segunda implementación sin personalizaciones.
- A presenta las slides 1–6; B, 7–10; A, 11–13; B conduce la demo de la 14
  con apoyo de A. A presenta gobierno, B responde a la pregunta inicial y A cierra.
- No repartir por «primera mitad/segunda mitad»: conectar los bloques con
  preguntas cortas ensayadas, sin interrumpirse continuamente.
- La comparación con Claude Code es un matiz breve dentro del
  bloque de límites; no es una segunda demo.

Distribución y diálogo sugerido en el [guion de presentador](presenter-runbook.md).

## Matices orales, sin modificar las slides

| Slide | Nota para la explicación |
|---|---|
| 1 | Título válido. Mantener la metáfora del compañero sin atribuir responsabilidad humana al agente. |
| 2 | Explicar «Aprende» como carga de contexto y capacidades, no reentrenamiento. Plantear la pregunta de seguridad y reservar su respuesta para la 16. |
| 3 | Mapa mental útil. Añadir oralmente: son dimensiones, no cuatro clases excluyentes; un agente personalizado puede ejecutarse como subagente. |
| 4 | Matizar oralmente que hay instrucciones generales y otras activadas por ámbito. «Nunca debería negociar» expresa intención, no un control técnico. |
| 5 | Bucle correcto como simplificación. Aclarar que el runtime/harness ejecuta herramientas y gestiona permisos; el archivo de agente configura un rol. |
| 6 | Lista orientativa, no requisitos acumulativos. Un revisor puede tener un objetivo estrecho y ser útil por sus herramientas/restricciones. |
| 7 | Estructura correcta para Copilot. Solo SKILL.md es necesario; subcarpetas opcionales. Mostrar descubrimiento → cuerpo → recursos. |
| 8 | Correcta. Matizar que una skill también puede empaquetar conocimiento y criterios, no solo pasos rígidos. |
| 9 | Aclarar oralmente «Contexto separado ≠ filesystem aislado». Paralelismo posible, no obligatorio ni siempre beneficioso. En la demo habrá un solo reviewer. |
| 10 | Frases válidas como recordatorio; no usarlas como definición normativa de todos los productos. |
| 11 | Recorrer el árbol visible como heurística. Recordar oralmente que un prompt puede bastar y que las piezas se combinan. |
| 12 | Mantener: es uno de los mensajes más fuertes. No convertir cada script pequeño en una skill innecesaria. |
| 13 | Explicar los tres patrones en su orden visible. No son niveles obligatorios de madurez ni garantía de mejora. Mencionar coste/latencia y conflictos de escritura. |
| 14 | Conservar las cinco etapas visibles. Auth, seguridad y tests son ejemplos del esquema; declarar que la demo concreta delega contrato y cobertura. No se ha implementado autenticación ni una auditoría de seguridad. |
| 15 | Recorrer los controles visibles. Aclarar que no deben incluirse credenciales ni datos sensibles y que permisos y controles deben verificarse; no basta con escribirlos. |
| 16 | El ejemplo de seguridad es válido conceptualmente. Aclarar que la demo revisa contrato y pruebas, no seguridad. Las cuatro respuestas también pueden combinarse. |
| 17 | Cierre correcto. Añadir oralmente «usa la pieza más simple y comprueba el resultado». |

## Aclaraciones integradas en el recorrido

No se añaden slides ni bloques que alteren el patrón validado:

1. Dentro de la slide 15, explicar brevemente:
   **«Modelo no es harness: usar Claude como modelo en Copilot no es Claude Code».**
   No abrir otra herramienta ni desarrollar una segunda charla sobre plataformas.
2. Antes de la demo, mostrar el selector real de entorno y explicar:
   **«Esta demo usa un harness concreto; no todas las opciones de agentes y
   skills son portables».** Afirmar que está ensayada solo si ya se ha realizado
   la comprobación interactiva en ese entorno.

## Notas para la comparación

No prometer que un prompt vago fracasará. Las instrucciones ya están presentes
en el workspace de la demo, por lo que esa ejecución no sería una línea base
«sin personalización». Presentar la evolución como explicación del diseño.
Una comparación A/B real exigiría carpetas y sesiones separadas, condiciones
controladas y varias repeticiones; no es necesaria para esta charla.
