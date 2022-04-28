using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;
namespace SistemaUniversidad.BackEnd.API.Services
{
    public class CursoEnMatriculaService : ICursoEnMatriculaService
    {
        private IUnitOfWork BD;
        public CursoEnMatriculaService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(CursoEnMatricula model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoEnMatriculaRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoEnMatriculaRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(CursoEnMatricula model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CursoEnMatriculaRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public CursoEnMatricula SeleccionarPorId(int id)
        {
            CursoEnMatricula CursoEnMatriculaSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                CursoEnMatriculaSeleccionada = bd.Repositories.CursoEnMatriculaRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return CursoEnMatriculaSeleccionada;
        }

        public List<CursoEnMatricula> SeleccionarTodos()
        {
            List<CursoEnMatricula> ListaTodasCursoEnMatricula;

            using (var bd = BD.Conectar())
            {
                ListaTodasCursoEnMatricula = bd.Repositories.CursoEnMatriculaRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasCursoEnMatricula;
        }
    }
}
