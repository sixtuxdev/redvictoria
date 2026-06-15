using System.Data;

namespace RedVictoria.Application.Interfaces;

public interface IConnectionFactory
{
    IDbConnection CreateConnection();
}
