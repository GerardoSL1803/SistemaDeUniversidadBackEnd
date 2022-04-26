
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface IEstudiantesRepository : IObtenerRepository<Estudiante, int>, IInsertarRepository<Estudiante>, IActulizarRepository<Estudiante>, IEliminarRepository<int>
    {
    }
}
