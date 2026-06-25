using System.IO.Compression;
using System.Text;
using RedVictoria.WebUI.Models.Ciudadanos;

namespace RedVictoria.WebUI.Helpers;

public static class DashboardExcelExporter
{
    public static byte[] Export(IEnumerable<CiudadanoReferidoModel> referidos)
    {
        using var stream = new MemoryStream();
        using (var archive = new ZipArchive(stream, ZipArchiveMode.Create, leaveOpen: true))
        {
            AddEntry(archive, "[Content_Types].xml", ContentTypesXml());
            AddEntry(archive, "_rels/.rels", RootRelationshipsXml());
            AddEntry(archive, "xl/workbook.xml", WorkbookXml());
            AddEntry(archive, "xl/_rels/workbook.xml.rels", WorkbookRelationshipsXml());
            AddEntry(archive, "xl/styles.xml", StylesXml());
            AddEntry(archive, "xl/worksheets/sheet1.xml", WorksheetXml(referidos));
        }

        return stream.ToArray();
    }

    private static string WorksheetXml(IEnumerable<CiudadanoReferidoModel> referidos)
    {
        var rows = new List<IReadOnlyList<string>>
        {
            new[]
            {
                "Simpatizante",
                "Identificacion",
                "Email",
                "Celular",
                "Fecha de Nacimiento",
                "Codigo",
                "Referidor",
                "Registro",
                "Estado",
                "Tipo"
            }
        };

        rows.AddRange(referidos.Select(item => new[]
        {
            item.NombresCompletos,
            Display(item.NumeroIdentificacion),
            Display(item.Email),
            Display(item.Celular),
            DisplayDate(item.FechaNacimiento),
            item.CodigoReferido,
            Display(item.Referidor),
            item.FechaRegistro.ToString("yyyy-MM-dd"),
            item.Estado ? "Activo" : "Inactivo",
            item.TipoReferido
        }));

        var builder = new StringBuilder();
        builder.Append("""
            <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
            <worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
              <cols>
                <col min="1" max="1" width="28" customWidth="1"/>
                <col min="2" max="10" width="18" customWidth="1"/>
              </cols>
              <sheetData>
            """);

        for (var rowIndex = 0; rowIndex < rows.Count; rowIndex++)
        {
            var rowNumber = rowIndex + 1;
            builder.Append(CultureInvariant($"    <row r=\"{rowNumber}\">"));

            for (var columnIndex = 0; columnIndex < rows[rowIndex].Count; columnIndex++)
            {
                var cellReference = $"{ColumnName(columnIndex + 1)}{rowNumber}";
                var style = rowIndex == 0 ? " s=\"1\"" : string.Empty;
                builder.Append(CultureInvariant($"<c r=\"{cellReference}\" t=\"inlineStr\"{style}><is><t>{EscapeXml(rows[rowIndex][columnIndex])}</t></is></c>"));
            }

            builder.AppendLine("</row>");
        }

        builder.Append("""
              </sheetData>
            </worksheet>
            """);

        return builder.ToString();
    }

    private static void AddEntry(ZipArchive archive, string path, string content)
    {
        var entry = archive.CreateEntry(path, CompressionLevel.Fastest);
        using var writer = new StreamWriter(entry.Open(), Encoding.UTF8);
        writer.Write(content);
    }

    private static string ContentTypesXml() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
          <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
          <Default Extension="xml" ContentType="application/xml"/>
          <Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>
          <Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>
          <Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>
        </Types>
        """;

    private static string RootRelationshipsXml() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
          <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>
        </Relationships>
        """;

    private static string WorkbookXml() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
          <sheets>
            <sheet name="Dashboard" sheetId="1" r:id="rId1"/>
          </sheets>
        </workbook>
        """;

    private static string WorkbookRelationshipsXml() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
          <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>
          <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
        </Relationships>
        """;

    private static string StylesXml() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
          <fonts count="2">
            <font><sz val="11"/><name val="Calibri"/></font>
            <font><b/><sz val="11"/><name val="Calibri"/><color rgb="FFFFFFFF"/></font>
          </fonts>
          <fills count="3">
            <fill><patternFill patternType="none"/></fill>
            <fill><patternFill patternType="gray125"/></fill>
            <fill><patternFill patternType="solid"><fgColor rgb="FF0443FF"/><bgColor indexed="64"/></patternFill></fill>
          </fills>
          <borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>
          <cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>
          <cellXfs count="2">
            <xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>
            <xf numFmtId="0" fontId="1" fillId="2" borderId="0" xfId="0" applyFont="1" applyFill="1"/>
          </cellXfs>
        </styleSheet>
        """;

    private static string ColumnName(int columnNumber)
    {
        var name = string.Empty;
        while (columnNumber > 0)
        {
            var modulo = (columnNumber - 1) % 26;
            name = Convert.ToChar('A' + modulo) + name;
            columnNumber = (columnNumber - modulo) / 26;
        }

        return name;
    }

    private static string Display(string? value) =>
        string.IsNullOrWhiteSpace(value) ? "-" : value;

    private static string DisplayDate(DateTime? value) =>
        value.HasValue ? value.Value.ToString("dd/MM/yyyy") : "No registrada";

    private static string EscapeXml(string? value) =>
        System.Security.SecurityElement.Escape(value ?? string.Empty) ?? string.Empty;

    private static string CultureInvariant(FormattableString value) =>
        FormattableString.Invariant(value);
}
