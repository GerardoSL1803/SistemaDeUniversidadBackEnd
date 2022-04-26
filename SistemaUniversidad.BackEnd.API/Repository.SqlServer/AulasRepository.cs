using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class AulasRepository : ConexionBD, IAulasRepository
    {
        public AulasRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Aula aula)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Aulas_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@NumeroDeAula", aula.NumeroDeAula);
            command.Parameters.AddWithValue("@NombreDeAula", aula.NombreDeAula);
            command.Parameters.AddWithValue("@ModificadoPor", aula.ModificadoPor);

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

        public void Insertar(Aula aula)
        {
            var query = "SP_Aulas_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@NumeroDeAula", aula.NumeroDeAula);
            command.Parameters.AddWithValue("@NombreDeAula", aula.NombreDeAula);
            command.Parameters.AddWithValue("@CreadoPor", aula.CreadoPor);

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

        public Aula SeleccionarPorId(int NumeroDeAula)
        {
            var query = "SELECT * FROM FN_Aulas_SeleccionarPorId(@NumeroDeAula)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@NumeroDeAula", NumeroDeAula);

            SqlDataReader reader = command.ExecuteReader();

            Aula AulaSeleccionada = new();

            while (reader.Read())
            {
                AulaSeleccionada.NumeroDeAula = Convert.ToInt32(reader["NumeroDeAula"]);
                AulaSeleccionada.NombreDeAula = Convert.ToString(reader["NombreDeAula"]);

                AulaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                AulaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                AulaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                AulaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                AulaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return AulaSeleccionada;
        }

        public List<Aula> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Aulas_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Aula> ListaTodasLasAulas = new List<Aula>();

            while (reader.Read())
            {
                Aula AulaSeleccionada = new();

                AulaSeleccionada.NumeroDeAula = Convert.ToInt32(reader["NumeroDeAula"]);
                AulaSeleccionada.NombreDeAula = Convert.ToString(reader["NombreDeAula"]);

                AulaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                AulaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                AulaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                AulaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                AulaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLasAulas.Add(AulaSeleccionada);
            }

            reader.Close();

            return ListaTodasLasAulas;
        }
    }
}

