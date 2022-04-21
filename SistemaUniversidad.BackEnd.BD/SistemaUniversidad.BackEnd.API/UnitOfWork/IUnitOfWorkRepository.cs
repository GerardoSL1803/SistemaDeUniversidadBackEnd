using SistemaUniversidad.BackEnd.API.Repository;

namespace SistemaUniversidad.BackEnd.API.UnitOfWork
{
    public interface IUnitOfWorkRepository
{
//ACA VAN TODOS LOS REPOS DEL SISTEMA
        IAulasRepository AulasRepository { get; }
    }
}
