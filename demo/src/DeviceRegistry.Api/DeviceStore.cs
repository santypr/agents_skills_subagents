using System.Collections.Concurrent;

namespace DeviceRegistry.Api;

public sealed record Device(Guid Id, string Name, string SerialNumber);

public sealed class DeviceStore
{
    private readonly ConcurrentDictionary<string, Device> devices =
        new(StringComparer.OrdinalIgnoreCase);

    public Device[] GetAll() => devices.Values.OrderBy(device => device.Name).ToArray();

    public Device? Find(Guid id) => devices.Values.FirstOrDefault(device => device.Id == id);

    public bool TryAdd(Device device) => devices.TryAdd(device.SerialNumber, device);
}
