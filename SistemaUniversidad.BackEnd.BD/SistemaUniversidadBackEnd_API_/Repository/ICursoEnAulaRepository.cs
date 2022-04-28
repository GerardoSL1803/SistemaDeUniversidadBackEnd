
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface ICursoEnAulaRepository : IObtenerRepository<CursoEnAula, int>, IInsertarRepository<CursoEnAula>, IActulizarRepository<CursoEnAula>, IEliminarCompuestaTresRepository<int , int , int, string>
    {
    }
}
