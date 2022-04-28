using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class DocentesRepository : ConexionBD, IDocentesRepository
    {
        public DocentesRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Docente docente)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Docentes_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificacion", docente.Identificacion);
            command.Parameters.AddWithValue("@Nombres", docente.Nombres);
            command.Parameters.AddWithValue("@Apellidos", docente.Apellidos);
            command.Parameters.AddWithValue("@Telefono", docente.Telefono);
            command.Parameters.AddWithValue("@TelefonoSecundario", docente.TelefonoSecundario);
            command.Parameters.AddWithValue("@ModificadoPor", docente.ModificadoPor);

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

        public void Insertar(Docente docente)
        {
            var query = "SP_Docentes_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificacion", docente.Identificacion);
            command.Parameters.AddWithValue("@Nombres", docente.Nombres);
            command.Parameters.AddWithValue("@Apellidos", docente.Apellidos);
            command.Parameters.AddWithValue("@Telefono", docente.Telefono);
            command.Parameters.AddWithValue("@TelefonoSecundario", docente.TelefonoSecundario);
            command.Parameters.AddWithValue("@CreadoPor", docente.CreadoPor);

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

        public Docente SeleccionarPorId(string Identificacion)
        {
            var query = "SELECT * FROM FN_Docentes_SeleccionarPorId(@Identificacion)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Identificacion", Identificacion);

            SqlDataReader reader = command.ExecuteReader();

            Docente DocenteSeleccionado = new();

            while (reader.Read())
            {
                DocenteSeleccionado.Identificacion = ((string)reader["Identificacion"]);
                DocenteSeleccionado.Nombres = Convert.ToString(reader["Nombres"]);
                DocenteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                DocenteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                DocenteSeleccionado.TelefonoSecundario = Convert.ToString(reader["TelefonoSecundario"]);

                DocenteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                DocenteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DocenteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DocenteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DocenteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return DocenteSeleccionado;
        }

        public List<Docente> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Docentes_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Docente> ListaTodasLosDocentes = new List<Docente>();

            while (reader.Read())
            {
                Docente DocenteSeleccionado = new();

                DocenteSeleccionado.Identificacion = ((string)reader["Identificacion"]);
                DocenteSeleccionado.Nombres = Convert.ToString(reader["Nombres"]);
                DocenteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                DocenteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                DocenteSeleccionado.TelefonoSecundario = Convert.ToString(reader["TelefonoSecundario"]);

                DocenteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                DocenteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                DocenteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                DocenteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                DocenteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasLosDocentes.Add(DocenteSeleccionado);
            }

            reader.Close();

            return ListaTodasLosDocentes;
        }
    }
}
