using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface IDocentesRepository : IObtenerRepository<Docente, string>, IInsertarRepository<Docente>, IActulizarRepository<Docente>, IEliminarRepository<int>
    {
    }
}
