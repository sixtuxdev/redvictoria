using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;
using RedVictoria.WebUI.Models.Ciudadanos;

namespace RedVictoria.WebUI.ViewModels.Ciudadanos;

public sealed class DashboardViewModel(
    ICiudadanoService ciudadanoService,
    IAuthSessionService authSessionService)
{
    public AuthSessionModel? Session { get; private set; }

    public IReadOnlyCollection<CiudadanoReferidoModel> Referidos { get; private set; } = [];

    public bool IsLoading { get; private set; }

    public bool IsBusy { get; private set; }

    public string? ErrorMessage { get; private set; }

    public string SearchText { get; set; } = string.Empty;

    public string EstadoFiltro { get; set; } = "Todos";

    public string TipoFiltro { get; set; } = "Todos";

    public int TotalDirectos => Referidos.Count(item => item.Nivel == 1);

    public int TotalIndirectos => Referidos.Count(item => item.Nivel == 2);

    public int TotalActivos => Referidos.Count(item => item.Estado);

    public int TotalInactivos => Referidos.Count(item => !item.Estado);

    public bool IsAuthenticated => Session?.IsValid == true;

    public string? MiUrlReferido =>
        string.IsNullOrWhiteSpace(Session?.CodigoReferido)
            ? null
            : BuildReferralUrl(Session.CodigoReferido);

    public async Task InitializeAsync(CancellationToken cancellationToken = default)
    {
        IsLoading = true;
        ErrorMessage = null;

        try
        {
            Session = await authSessionService.GetSessionAsync(cancellationToken);
            if (!IsAuthenticated)
            {
                ErrorMessage = "Debes iniciar sesion para consultar el dashboard.";
                return;
            }

            await CargarReferidosAsync(cancellationToken);
        }
        finally
        {
            IsLoading = false;
        }
    }

    public async Task CargarReferidosAsync(CancellationToken cancellationToken = default)
    {
        ErrorMessage = null;
        var result = await ciudadanoService.ObtenerRedReferidosAsync(cancellationToken);
        if (!result.IsSuccess)
        {
            Referidos = [];
            ErrorMessage = result.Message;
            return;
        }

        Referidos = result.Data;
    }

    public IReadOnlyCollection<CiudadanoReferidoModel> ObtenerReferidosFiltrados()
    {
        var query = Referidos.AsEnumerable();

        if (!string.Equals(EstadoFiltro, "Todos", StringComparison.OrdinalIgnoreCase))
        {
            var estado = string.Equals(EstadoFiltro, "Activos", StringComparison.OrdinalIgnoreCase);
            query = query.Where(item => item.Estado == estado);
        }

        if (!string.Equals(TipoFiltro, "Todos", StringComparison.OrdinalIgnoreCase))
        {
            query = query.Where(item => string.Equals(item.TipoReferido, TipoFiltro, StringComparison.OrdinalIgnoreCase));
        }

        if (!string.IsNullOrWhiteSpace(SearchText))
        {
            query = query.Where(item => Matches(item, SearchText));
        }

        return query
            .OrderBy(item => item.Nivel)
            .ThenByDescending(item => item.FechaRegistro)
            .ToArray();
    }

    public async Task<bool> DesactivarReferidoAsync(
        CiudadanoReferidoModel referido,
        CancellationToken cancellationToken = default)
    {
        IsBusy = true;
        ErrorMessage = null;

        try
        {
            var result = await ciudadanoService.DesactivarReferidoAsync(
                referido.CiudadanoId,
                cancellationToken);

            if (!result.IsSuccess)
            {
                ErrorMessage = result.Message;
                return false;
            }

            await CargarReferidosAsync(cancellationToken);
            return true;
        }
        finally
        {
            IsBusy = false;
        }
    }

    public static string BuildReferralUrl(string codigoReferido) =>
        $"https://localhost:7206/registro-ciudadano/{Uri.EscapeDataString(codigoReferido.Trim())}";

    private static bool Matches(CiudadanoReferidoModel item, string search)
    {
        return Contains(item.NombresCompletos, search)
            || Contains(item.NumeroIdentificacion, search)
            || Contains(item.Celular, search)
            || Contains(item.Email, search)
            || Contains(item.CodigoReferido, search)
            || Contains(item.Referidor, search)
            || Contains(item.Estado ? "Activo" : "Inactivo", search)
            || Contains(item.TipoReferido, search);
    }

    private static bool Contains(string? value, string search) =>
        !string.IsNullOrWhiteSpace(value)
        && value.Contains(search, StringComparison.OrdinalIgnoreCase);
}
