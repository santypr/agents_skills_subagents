# Device Registry workshop

- This is a local .NET 10 Minimal API demonstration, not a production service.
- Keep endpoint mapping in `demo/src/DeviceRegistry.Api/RegistrationEndpoints.cs`.
- Reuse `DeviceStore`; its case-insensitive `TryAdd` provides atomic serial uniqueness.
- Use HTTP 201 + Location for creation, ValidationProblem for invalid input,
  and Problem Details with HTTP 409 for duplicate serials.
- Add integration tests with WebApplicationFactory for behavior changes.
- Do not add authentication, databases, Docker, cloud services or packages for this exercise.
- Do not read/copy `checkpoints/` to solve the live exercise. Those files are presenter recovery assets.
- Do not modify the guide, slides, customizations or checkpoint files when implementing the exercise.
- Build/test from the workspace root: `dotnet test AgentWorkshop.slnx --no-restore`.
- The authoritative acceptance criteria are in `docs/device-contract.md`.
- Explain which checks actually ran. Never report validation success from inspection alone.
