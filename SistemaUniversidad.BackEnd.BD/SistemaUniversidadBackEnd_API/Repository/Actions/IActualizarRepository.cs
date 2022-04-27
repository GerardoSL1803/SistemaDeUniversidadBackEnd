namespace SistemaUniversidad.BackEnd.API.Repository.Actions
{
    public interface IActulizarRepository<T> where T : class
    {
        void Actualizar (T t);    
    }
}
