using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface ICursosRepository : IObtenerRepository<Curso, int>, IInsertarRepository<Curso>, IActulizarRepository<Curso>, IEliminarRepository<int>
    {
    }
}
