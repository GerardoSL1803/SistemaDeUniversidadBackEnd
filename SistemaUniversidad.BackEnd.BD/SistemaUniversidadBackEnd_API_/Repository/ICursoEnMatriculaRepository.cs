
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Repository.Actions;

namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface ICursoEnMatriculaRepository : IObtenerRepository<CursoEnMatricula, int>, IInsertarRepository<CursoEnMatricula>, IActulizarRepository<CursoEnMatricula>, IEliminarRepository<int>
    {
    }
}
