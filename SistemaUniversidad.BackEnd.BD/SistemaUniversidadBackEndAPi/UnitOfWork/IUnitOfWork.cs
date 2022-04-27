namespace SistemaUniversidad.BackEnd.API.UnitOfWork
{
    public interface IUnitOfWork
    {
        IUnitOfWorkAdapter Conectar();
    }
}
