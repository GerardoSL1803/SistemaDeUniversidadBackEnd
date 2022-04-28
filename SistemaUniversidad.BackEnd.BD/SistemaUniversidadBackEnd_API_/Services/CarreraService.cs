using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.UnitOfWork;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;
namespace SistemaUniversidad.BackEnd.API.Services
{
    public class CarreraService : ICarrerasService
    {
        private IUnitOfWork BD;
        public CarreraService(IUnitOfWork unitOfWork)
        {
            BD = unitOfWork;
        }
        public void Actualizar(Carrera model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CarrerasRepository.Actualizar(model);

                bd.SaveChanges();
            }
        }

        public void Eliminar(int id)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CarrerasRepository.Eliminar(id);

                bd.SaveChanges();
            }
        }

        public void Insertar(Carrera model)
        {
            using (var bd = BD.Conectar())
            {
                bd.Repositories.CarrerasRepository.Insertar(model);

                bd.SaveChanges();
            }
        }

        public Carrera SeleccionarPorId(int id)
        {
            Carrera CarreraSeleccionada = new();

            using (var bd = BD.Conectar())
            {
                CarreraSeleccionada = bd.Repositories.CarrerasRepository.SeleccionarPorId(id);

                bd.SaveChanges();
            }

            return CarreraSeleccionada;
        }

        public List<Carrera> SeleccionarTodos()
        {
            List<Carrera> ListaTodasLasCarreras;

            using (var bd = BD.Conectar())
            {
                ListaTodasLasCarreras = bd.Repositories.CarrerasRepository.SeleccionarTodos();

                bd.SaveChanges();
            }

            return ListaTodasLasCarreras;
        }
    }
}
