using System.Net;
using System.Net.Http.Json;
using DeviceRegistry.Api;
using Microsoft.AspNetCore.Mvc.Testing;

namespace DeviceRegistry.Api.Tests;

public sealed class BaselineTests
{
    [Fact]
    public async Task Health_is_available()
    {
        await using var factory = new WebApplicationFactory<Program>();
        using var client = factory.CreateClient();
        using var response = await client.GetAsync("/health");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task New_store_is_empty()
    {
        await using var factory = new WebApplicationFactory<Program>();
        using var client = factory.CreateClient();

        Assert.Empty((await client.GetFromJsonAsync<Device[]>("/devices"))!);
    }

    [Fact]
    public async Task Unknown_device_returns_not_found()
    {
        await using var factory = new WebApplicationFactory<Program>();
        using var client = factory.CreateClient();
        using var response = await client.GetAsync($"/devices/{Guid.NewGuid()}");

        Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
    }
}
