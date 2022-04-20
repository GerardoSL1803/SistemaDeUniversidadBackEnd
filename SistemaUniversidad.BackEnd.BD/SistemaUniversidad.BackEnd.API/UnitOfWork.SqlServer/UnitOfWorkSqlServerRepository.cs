using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.UnitOfWork.SqlServer
{
    public class UnitOfWorkSqlServerRepository : IUnitOfWorkRepository
    {

        public UnitOfWorkSqlServerRepository(SqlConnection context, SqlTransaction transaction) 
        { 
        
        }

    }
}
