
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface IAulasRepository : IObtenerRepository<Aula, int>, IInsertarRepository<Aula>, IActulizarRepository<Aula>, IEliminarRepository<int>
    {
    }
}
