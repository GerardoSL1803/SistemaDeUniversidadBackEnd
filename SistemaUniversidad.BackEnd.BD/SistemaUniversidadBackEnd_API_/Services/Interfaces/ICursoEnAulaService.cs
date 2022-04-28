using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface ICursoEnAulaService
    {
        List<CursoEnAula> SeleccionarTodos();
        CursoEnAula SeleccionarPorId(int id);
        void Insertar(CursoEnAula model);
        void Actualizar(CursoEnAula model);
        void Eliminar(int IdCurso , int IdAula , int IdCiclo , string ModificadoPor);
    }
}
