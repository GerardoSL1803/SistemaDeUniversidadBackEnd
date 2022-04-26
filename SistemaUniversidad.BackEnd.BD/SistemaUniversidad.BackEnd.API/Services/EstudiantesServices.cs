using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public class EstudiantesService : IEstudiantesService
    {
        private IUnitOfWork BD;
        public EstudiantesService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Estudiante model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstudiantesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(string id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstudiantesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Estudiante model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.EstudiantesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Estudiante SeleccionarPorId(String id)
        {
            Estudiante EstudianteSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                EstudianteSeleccionado = bd.Repositories.EstudiantesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return EstudianteSeleccionado;
        }

        public List<Estudiante> SeleccionarTodos()
        {
            List<Estudiante> ListaTodasLosEstudiantes;

            using (var bd = BD.Conectar())
            {
                ListaTodasLosEstudiantes = bd.Repositories.EstudiantesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLosEstudiantes;
        }
    }
}
