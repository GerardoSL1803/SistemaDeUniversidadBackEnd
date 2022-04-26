
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface ICursoDocente : IObtenerRepository<CursoDocente, int>, IInsertarRepository<CursoDocente>, IActulizarRepository<CursoDocente>, IEliminarRepository<int>
    {
    }
}
