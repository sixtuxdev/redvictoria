using RedVictoria.WebUI.Interfaces;
using RedVictoria.WebUI.Models.Auth;
using RedVictoria.WebUI.Models.Ciudadanos;
using MudBlazor;

namespace RedVictoria.WebUI.ViewModels.Ciudadanos;

public sealed class DashboardViewModel(
    ICiudadanoService ciudadanoService,
    IAuthSessionService authSessionService,
    IReferidosUrlBuilder referidosUrlBuilder)
{
    public AuthSessionModel? Session { get; private set; }

    public IReadOnlyCollection<CiudadanoReferidoModel> Referidos { get; private set; } = [];

    public bool IsLoading { get; private set; }

    public bool IsBusy { get; private set; }

    public string? ErrorMessage { get; private set; }

    public string SearchText { get; set; } = string.Empty;

    public string EstadoFiltro { get; set; } = "Todos";

    public string TipoFiltro { get; set; } = "Todos";

    public int TotalDirectos { get; private set; }

    public int TotalIndirectos { get; private set; }

    public int TotalActivos { get; private set; }

    public int TotalInactivos { get; private set; }

    public bool IsAuthenticated => Session?.IsValid == true;

    public bool IsAdmin =>
        string.Equals(Session?.Rol, "ADMIN", StringComparison.OrdinalIgnoreCase);

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
                ErrorMessage = "Debes iniciar sesión para consultar el dashboard.";
                return;
            }

            Referidos = [];
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

    public async Task<GridData<CiudadanoReferidoModel>> ObtenerReferidosGridAsync(
        GridState<CiudadanoReferidoModel> state)
    {
        ErrorMessage = null;

        var request = BuildPageRequest(state);
        var result = await ciudadanoService.ObtenerRedReferidosPaginadosAsync(request);
        if (!result.IsSuccess)
        {
            Referidos = [];
            ErrorMessage = result.Message;
            return new GridData<CiudadanoReferidoModel>
            {
                Items = [],
                TotalItems = 0
            };
        }

        Referidos = result.Items;
        TotalDirectos = result.TotalDirectos;
        TotalIndirectos = result.TotalIndirectos;
        TotalActivos = result.TotalActivos;
        TotalInactivos = result.TotalInactivos;

        return new GridData<CiudadanoReferidoModel>
        {
            Items = result.Items,
            TotalItems = result.TotalItems
        };
    }

    public async Task<byte[]> ExportarReferidosExcelAsync(CancellationToken cancellationToken = default)
    {
        return await ciudadanoService.ExportarRedReferidosExcelAsync(cancellationToken);
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

            return true;
        }
        finally
        {
            IsBusy = false;
        }
    }

    public string BuildReferralUrl(string codigoReferido) =>
        referidosUrlBuilder.BuildRegistroCiudadanoUrl(codigoReferido);

    private ReferidosPageRequestModel BuildPageRequest(GridState<CiudadanoReferidoModel> state)
    {
        var request = new ReferidosPageRequestModel
        {
            PageNumber = state.Page + 1,
            PageSize = state.PageSize <= 0 ? 10 : state.PageSize,
            SearchText = SearchText,
            Estado = GetEstadoFilter(),
            TipoReferido = GetTipoFilter()
        };

        var sort = state.SortDefinitions
            .OrderBy(item => item.Index)
            .FirstOrDefault();
        if (sort is not null)
        {
            request = request with
            {
                SortColumn = sort.SortBy,
                SortDescending = sort.Descending
            };
        }

        foreach (var filter in state.FilterDefinitions)
        {
            ApplyGridFilter(ref request, filter);
        }

        return request;
    }

    private bool? GetEstadoFilter()
    {
        if (string.Equals(EstadoFiltro, "Activos", StringComparison.OrdinalIgnoreCase))
            return true;
        if (string.Equals(EstadoFiltro, "Inactivos", StringComparison.OrdinalIgnoreCase))
            return false;
        return null;
    }

    private string? GetTipoFilter() =>
        string.Equals(TipoFiltro, "Todos", StringComparison.OrdinalIgnoreCase)
            ? null
            : TipoFiltro;

    private static void ApplyGridFilter(
        ref ReferidosPageRequestModel request,
        IFilterDefinition<CiudadanoReferidoModel> filter)
    {
        var value = filter.Value;
        if (value is null)
            return;

        var text = value.ToString();
        if (string.IsNullOrWhiteSpace(text))
            return;

        var propertyName = filter.Column?.PropertyName;
        request = propertyName switch
        {
            nameof(CiudadanoReferidoModel.NombresCompletos) => request with { NombresCompletos = text },
            nameof(CiudadanoReferidoModel.NumeroIdentificacion) => request with { NumeroIdentificacion = text },
            nameof(CiudadanoReferidoModel.Email) => request with { Email = text },
            nameof(CiudadanoReferidoModel.Celular) => request with { Celular = text },
            nameof(CiudadanoReferidoModel.FechaNacimiento) => request with { FechaNacimiento = AsDate(value) },
            nameof(CiudadanoReferidoModel.CodigoReferido) => request with { CodigoReferido = text },
            nameof(CiudadanoReferidoModel.Referidor) => request with { Referidor = text },
            nameof(CiudadanoReferidoModel.FechaRegistro) => request with { FechaRegistro = AsDate(value) },
            nameof(CiudadanoReferidoModel.Estado) => request with { Estado = AsBool(value) },
            nameof(CiudadanoReferidoModel.TipoReferido) => request with { TipoReferido = text },
            _ => request
        };
    }

    private static DateTime? AsDate(object value) =>
        value switch
        {
            DateTime date => date.Date,
            DateTimeOffset date => date.Date,
            _ => DateTime.TryParse(value.ToString(), out var parsed) ? parsed.Date : null
        };

    private static bool? AsBool(object value) =>
        value switch
        {
            bool boolean => boolean,
            _ when string.Equals(value.ToString(), "Activo", StringComparison.OrdinalIgnoreCase) => true,
            _ when string.Equals(value.ToString(), "Inactivo", StringComparison.OrdinalIgnoreCase) => false,
            _ when bool.TryParse(value.ToString(), out var parsed) => parsed,
            _ => null
        };
}
