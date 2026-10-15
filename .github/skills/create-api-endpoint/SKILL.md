---
name: create-api-endpoint
description: "Implementa endpoints HTTP en la API .NET Device Registry. Usar al crear POST /devices, registrar dispositivos, validar entradas, gestionar duplicados y anadir pruebas de integracion."
---

# Crear un endpoint verificable

Esta skill ensena un procedimiento al agente que la carga. No crea un trabajador
independiente y no ejecuta sus scripts automaticamente.

## Procedimiento

1. Lee el [contrato de la demo](../../../docs/device-contract.md) y el codigo
   existente antes de editar. No leas la solucion de `checkpoints/`.
2. Identifica ruta, entrada, normalizacion, estados HTTP y recurso recuperable.
3. Escribe pruebas de integracion con WebApplicationFactory. Usa la
   [matriz de casos](./references/test-matrix.md), incluidos limites exactos.
4. Implementa el handler en RegistrationEndpoints. Reutiliza DeviceStore y
   `TryAdd`; no hagas "buscar y despues insertar", que introduce una carrera.
5. Devuelve ValidationProblem para entradas invalidas y Problem para conflicto.
   No devuelvas 200 ni silencies errores para hacer pasar pruebas.
6. Ejecuta [el validador](./scripts/Validate-Demo.ps1) desde PowerShell:
   `& .\.github\skills\create-api-endpoint\scripts\Validate-Demo.ps1`.
   Si falta restore, ejecuta `dotnet restore AgentWorkshop.slnx` y repite.
7. Resume archivos cambiados, casos comprobados, comando y resultado real.

## Limites

Sin dependencias adicionales, servicios externos, autenticacion ni persistencia
en disco. No modifiques checkpoints o personalizaciones. Un fallo de pruebas
es un fallo que investigar, no una invitacion a rebajar el contrato.
