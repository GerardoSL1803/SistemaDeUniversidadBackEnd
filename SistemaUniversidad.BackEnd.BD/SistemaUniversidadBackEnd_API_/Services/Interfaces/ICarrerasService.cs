using SistemaUniversidad.BackEnd.API.Models;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public interface ICarrerasService
    {
        List<Carrera> SeleccionarTodos();
        Carrera SeleccionarPorId(int id);
        void Insertar(Carrera model);
        void Actualizar(Carrera model);
        void Eliminar(int id);
    }
}
