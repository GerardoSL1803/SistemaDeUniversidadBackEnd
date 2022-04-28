using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;

namespace SistemaUniversidad.BackEnd.API.Services
{
    public class CursoService : ICursosService
    {
        private IUnitOfWork BD;
        public CursoService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Curso model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursosRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursosRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Curso model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursosRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Curso SeleccionarPorId(int id)
        {
            Curso CursoSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                CursoSeleccionada = bd.Repositories.CursosRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return CursoSeleccionada;
        }

        public List<Curso> SeleccionarTodos()
        {
            List<Curso> ListaTodasLosCursos;

            using (var bd = BD.Conectar())
            {
                ListaTodasLosCursos = bd.Repositories.CursosRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLosCursos;
        }
    }
}
