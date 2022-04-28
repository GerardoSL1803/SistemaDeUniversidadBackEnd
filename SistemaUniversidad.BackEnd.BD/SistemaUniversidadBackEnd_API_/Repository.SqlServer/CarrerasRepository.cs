using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class CarrerasRepository : ConexionBD, ICarrerasRepository
    {
        public CarrerasRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Carrera carrera)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Carreras_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoCarrera", carrera.CodigoCarrera);
            command.Parameters.AddWithValue("@Nombre", carrera.Nombre);
            command.Parameters.AddWithValue("@ModificadoPor", carrera.ModificadoPor);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public void Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public void Insertar(Carrera carrera)
        {
            var query = "SP_Carreras_Insertar";

            var command = CreateCommand(query);

            command.CommandType = System.Data.CommandType.StoredProcedure;

           
            command.Parameters.AddWithValue("@Nombre", carrera.Nombre);
            command.Parameters.AddWithValue("@CreadoPor", carrera.CreadoPor);

            command.Parameters.Add("@DetalleError", SqlDbType.VarChar, 60).Direction = ParameterDirection.Output;
            command.Parameters.Add("@ExisteError", SqlDbType.Bit).Direction = ParameterDirection.Output;

            command.ExecuteNonQuery();

            bool ExisteError = Convert.ToBoolean(command.Parameters["@ExisteError"].Value);
            string? DetalleError = Convert.ToString(command.Parameters["@DetalleError"].Value);

            if (ExisteError)
            {
                throw new Exception(DetalleError);
            }
        }

        public Carrera SeleccionarPorId(int CodigoCarrera)
        {
            var query = "SELECT * FROM FN_Carreras_SeleccionarPorId(@CodigoCarrera)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@CodigoCarrera", CodigoCarrera);

            SqlDataReader reader = command.ExecuteReader();

            Carrera CarreraSeleccionada = new();

            while (reader.Read())
            {
                CarreraSeleccionada.CodigoCarrera = Convert.ToInt32(reader["CodigoCarrera"]);
                CarreraSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                CarreraSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CarreraSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CarreraSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CarreraSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CarreraSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CarreraSeleccionada;
        }

        public List<Carrera> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Carreras_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Carrera> ListaTodasLasCarreras = new List<Carrera>();

            while (reader.Read())
            {
                Carrera CarreraSeleccionada = new();

                CarreraSeleccionada.CodigoCarrera = Convert.ToInt32(reader["CodigoCarrera"]);
                CarreraSeleccionada.Nombre = Convert.ToString(reader["Nombre"]);

                CarreraSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CarreraSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CarreraSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CarreraSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CarreraSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasCarreras.Add(CarreraSeleccionada);
            }

            reader.Close();

            return ListaTodasLasCarreras;
        }
    }
}
