namespace SistemaUniversidad.BackEnd.API.Repository
{
    public interface IObtenerRepository<T,Y> where T : class 
    {
        List<T> SeleccionarTodos();
        T SeleccionarPorId(Y Id);
    }
    
}
