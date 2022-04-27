using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface IEstudiantesService
    {
        List<Estudiante> SeleccionarTodos();
        Estudiante SeleccionarPorId(string id);
        void Insertar(Estudiante model);
        void Actualizar(Estudiante model);
        void Eliminar(string id);
    }
}
