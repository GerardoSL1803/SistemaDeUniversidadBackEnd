using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface ICarrerasRepository : IObtenerRepository<Carrera, int>, IInsertarRepository<Carrera>, IActulizarRepository<Carrera>, IEliminarRepository<int>
    {
    }
}
