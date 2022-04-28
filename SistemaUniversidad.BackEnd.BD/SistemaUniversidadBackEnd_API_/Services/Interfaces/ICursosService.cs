using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface ICursosService
    {
        List<Curso> SeleccionarTodos();
        Curso SeleccionarPorId(int id);
        void Insertar(Curso model);
        void Actualizar(Curso model);
        void Eliminar(int id);
    }
}
