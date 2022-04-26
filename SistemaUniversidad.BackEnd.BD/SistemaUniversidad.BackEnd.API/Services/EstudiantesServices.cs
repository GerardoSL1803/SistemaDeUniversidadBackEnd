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
                bd.Repositories.AulasRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.AulasRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Estudiante model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.AulasRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Aula SeleccionarPorId(int id)
        {
            Aula AulaSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                AulaSeleccionada = bd.Repositories.AulasRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return AulaSeleccionada;
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
