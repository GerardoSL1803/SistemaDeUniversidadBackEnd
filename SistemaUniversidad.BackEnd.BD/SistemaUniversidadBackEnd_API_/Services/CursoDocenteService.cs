using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;

namespace SistemaUniversidad.BackEnd.API.Services.Interfaces
{
    public class CursoDocenteService : ICursoDocenteService
    {
        private IUnitOfWork BD;
        public CursoDocenteService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(CursoDocente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoDocenteRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoDocenteRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(CursoDocente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoDocenteRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public CursoDocente SeleccionarPorId(int id)
        {
            CursoDocente CursoDocenteSelccionado = new();

            using (var bd = BD.Conectar())
            {
                CursoDocenteSelccionado = bd.Repositories.CursoDocenteRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return CursoDocenteSelccionado;
        }

        public List<CursoDocente> SeleccionarTodos()
        {
            List<CursoDocente> ListaTodasLosCursoDocente;

            using (var bd = BD.Conectar())
            {
                ListaTodasLosCursoDocente = bd.Repositories.CursoDocenteRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLosCursoDocente;
        }
    }
}
