using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface ICursoDocenteService
    {
        List<CursoDocente> SeleccionarTodos();
        CursoDocente SeleccionarPorId(int id);
        void Insertar(CursoDocente model);
        void Actualizar(CursoDocente model);
        void Eliminar(int id);
    }
}
