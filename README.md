# Demo: agentes, skills y subagentes con .NET

Material para una charla de 35–40 minutos entre dos ponentes, con 13 minutos
de demo. El guion sigue las 17 slides validadas en orden: 37 minutos de contenido
y 3 de preguntas, con una variante de 35 minutos sin omitir slides.
La aplicación es deliberadamente pequeña: lo importante es observar el flujo
de trabajo del asistente, no construir una plataforma.

## Empieza aquí

- [Demo paso a paso: comandos, efectos y recuperación](docs/demo-paso-a-paso.md).
- [Agentes, skills y subagentes: definiciones y cuándo utilizarlos](docs/agentes-skills-subagentes.md).
- [Guía revisada y fuentes](guide.md).
- [Guion, prompts y recuperación](docs/presenter-runbook.md).
- [Notas de acompañamiento de las slides validadas](docs/slides-review.md).
- [Contrato funcional](docs/device-contract.md).

## Requisitos

- SDK estable .NET 10 (`global.json` admite distintas bandas 10.0).
- PowerShell; instrucciones de terminal preparadas para Windows.
- Acceso a NuGet durante la primera restauración.
- Copilot y un modelo con herramientas/delegación para la parte agéntica.
- VS Code/Insiders: se recomienda **harness Local** para los aliases y opciones
  de los agentes incluidos. Verificar descubrimiento en el entorno real.

La API y los tests no consumen un modelo ni necesitan Docker, Azure o base de
datos. El asistente sí necesita conexión y una cuenta/modelo disponible.

## Preparación

Desde la raíz del workspace:

```powershell
dotnet restore AgentWorkshop.slnx
dotnet test AgentWorkshop.slnx --no-restore
dotnet run --project .\demo\src\DeviceRegistry.Api --no-launch-profile -- --urls http://localhost:5187
```

Comprobar `http://localhost:5187/health`. El puerto se fija explícitamente;
no depende del perfil generado por la plantilla.
Detener el servidor con Ctrl+C antes de compilar/restablecer archivos.

El estado entregado es **Starter**: tres pruebas de base pasan y no existe
todavía el endpoint POST. La solución terminada está en los checkpoints:

```powershell
.\scripts\Set-DemoStage.ps1 -Stage Completed
& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1
.\scripts\Set-DemoStage.ps1 -Stage Starter
```

Completed tiene 15 casos de prueba en total. Starter tiene 3. Ambos son estados
válidos, pero solo Completed satisface el contrato de registro.

El script modifica únicamente RegistrationEndpoints.cs y RegistrationTests.cs.
Rechaza contenido distinto de los checkpoints para proteger cambios en directo.
Tras guardar esos cambios fuera de los archivos objetivo, se puede usar
`-Force` para descartarlos explícitamente. No elimina otros archivos que haya
creado el agente: revisarlos y retirarlos manualmente si procede.

## Personalizaciones incluidas

- [Instrucciones generales](.github/copilot-instructions.md).
- [Workshop Builder](.github/agents/workshop-builder.agent.md): implementa,
  ejecuta validaciones y delega una revisión.
- [Contract Reviewer](.github/agents/contract-reviewer.agent.md): solo lectura,
  oculto del selector en entornos que admiten `user-invocable: false`.
- [create-api-endpoint](.github/skills/create-api-endpoint/SKILL.md): procedimiento,
  matriz de pruebas y validador PowerShell.

No hay un archivo especial de «subagentes»: Contract Reviewer es un agente
personalizado cuyo uso previsto es una invocación delegada.

## Límites y verificación

Solo datos ficticios y loopback. Almacén volátil, sin autenticación ni garantías
de producción. [Peticiones HTTP](demo/requests.http) opcionales para mostrar
201, 400 y 409; también se pueden ejecutar con PowerShell.

La validación local incluye compilación y pruebas reales de los dos estados,
servidor HTTP en loopback y comprobaciones estructurales de personalizaciones.
El descubrimiento y la invocación dentro del editor requieren el ensayo manual
descrito en el guion: no se afirman como comprobados por pasar tests de .NET.
