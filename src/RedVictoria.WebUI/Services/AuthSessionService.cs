using System.Text.Json;
using Microsoft.JSInterop;
using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;

namespace RedVictoria.WebUI.Services;

public sealed class AuthSessionService(IJSRuntime jsRuntime) : IAuthSessionService
{
    private const string StorageKey = "redvictoria.auth";

    public async Task<AuthSessionModel?> GetSessionAsync(CancellationToken cancellationToken = default)
    {
        var json = await jsRuntime.InvokeAsync<string?>(
            "localStorage.getItem",
            cancellationToken,
            StorageKey);

        if (string.IsNullOrWhiteSpace(json))
        {
            return null;
        }

        try
        {
            var session = JsonSerializer.Deserialize<AuthSessionModel>(json);
            return session?.IsValid == true ? session : null;
        }
        catch (JsonException)
        {
            await ClearSessionAsync(cancellationToken);
            return null;
        }
    }

    public async Task<string?> GetTokenAsync(CancellationToken cancellationToken = default)
    {
        var session = await GetSessionAsync(cancellationToken);
        return session?.Token;
    }

    public async Task SetSessionAsync(AuthSessionModel session, CancellationToken cancellationToken = default)
    {
        var json = JsonSerializer.Serialize(session);
        await jsRuntime.InvokeVoidAsync(
            "localStorage.setItem",
            cancellationToken,
            StorageKey,
            json);
    }

    public async Task ClearSessionAsync(CancellationToken cancellationToken = default)
    {
        await jsRuntime.InvokeVoidAsync(
            "localStorage.removeItem",
            cancellationToken,
            StorageKey);
    }
}
