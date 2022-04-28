using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;

namespace SistemaUniversidad.BackEnd.API.Services
{
    public class DocenteService : IDocentesService
    {
        private IUnitOfWork BD;
        public DocenteService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Docente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DocentesRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DocentesRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Docente model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.DocentesRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Docente SeleccionarPorId(string id)
        {
            Docente DocenteSeleccionado = new();

            using (var bd = BD.Conectar())
            {
                DocenteSeleccionado = bd.Repositories.DocentesRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return DocenteSeleccionado;
        }

        public List<Docente> SeleccionarTodos()
        {
            List<Docente> ListaTodasLosDocentes;

            using (var bd = BD.Conectar())
            {
                ListaTodasLosDocentes = bd.Repositories.DocentesRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLosDocentes;
        }

    }
}
