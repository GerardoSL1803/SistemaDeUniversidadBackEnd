namespace SistemaUniversidad.BackEnd.API.Repository.Actions
{
    public interface IEliminarCompuestaTresRepository<T ,Y , Z , M>
    {
        void Eliminar(T id1,Y id2 , Z id3, M ModificadoPor);

    }
}
