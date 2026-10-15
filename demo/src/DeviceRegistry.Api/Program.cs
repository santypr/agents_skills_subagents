using DeviceRegistry.Api;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddProblemDetails();
builder.Services.AddSingleton<DeviceStore>();
var app = builder.Build();

app.UseExceptionHandler();
app.MapGet("/health", () => Results.Ok(new { status = "ok" }));
app.MapGet("/devices", (DeviceStore store) => Results.Ok(store.GetAll()));
app.MapGet("/devices/{id:guid}", (Guid id, DeviceStore store) =>
    store.Find(id) is { } device ? Results.Ok(device) : Results.NotFound());
app.MapDeviceRegistration();

app.Run();

public partial class Program;
