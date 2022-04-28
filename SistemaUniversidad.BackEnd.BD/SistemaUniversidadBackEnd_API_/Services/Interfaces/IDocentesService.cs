using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services
{
    public interface IDocentesService
    {
        List<Docente> SeleccionarTodos();
        Docente SeleccionarPorId(string id);
        void Insertar(Docente model);
        void Actualizar(Docente model);
        void Eliminar(int id);
    }
}
