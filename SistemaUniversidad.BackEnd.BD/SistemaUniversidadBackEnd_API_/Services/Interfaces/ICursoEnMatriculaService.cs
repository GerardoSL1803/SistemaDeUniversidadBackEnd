using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface ICursoEnMatriculaService
    {
        List<CursoEnMatricula> SeleccionarTodos();
        CursoEnMatricula SeleccionarPorId(int id);
        void Insertar(CursoEnMatricula model);
        void Actualizar(CursoEnMatricula model);
        void Eliminar(int id);
    }
}
