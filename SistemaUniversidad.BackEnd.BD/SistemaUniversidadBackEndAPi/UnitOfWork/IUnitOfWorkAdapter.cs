namespace SistemaUniversidad.BackEnd.API.UnitOfWork
{
    public interface IUnitOfWorkAdapter : IDisposable
    {
        IUnitOfWorkRepository Repositories { get; }

        void SaveChanges();
    }
}
