using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class EstudiantesRepository : ConexionBD, IEstudiantesRepository
    {
        public EstudiantesRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Estudiante estudiante)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Estudiantes_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Nombres", estudiante.Nombres);
            command.Parameters.AddWithValue("@Apellidos", estudiante.Apellidos);
            command.Parameters.AddWithValue("@Telefono", estudiante.Telefono);
            command.Parameters.AddWithValue("@TelefonoSecundario", estudiante.TelefonoSecundario);
            command.Parameters.AddWithValue("@ModificadoPor", estudiante.ModificadoPor);

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

        public void Insertar(Estudiante estudiante)
        {
            var query = "SP_Aulas_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Identificacion", estudiante.Identificacion);
            command.Parameters.AddWithValue("@Nombres", estudiante.Nombres);
            command.Parameters.AddWithValue("@Apellidos", estudiante.Apellidos);
            command.Parameters.AddWithValue("@Telefono", estudiante.Telefono);
            command.Parameters.AddWithValue("@TelefonoSecundario", estudiante.TelefonoSecundario);
            command.Parameters.AddWithValue("@CreadoPor", estudiante.CreadoPor);

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

        public Estudiante SeleccionarPorId(String Identificacion)
        {
            var query = "SELECT * FROM FN_Estudiantes_SeleccionarPorId(@Identificacion)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Identificacion", Identificacion);

            SqlDataReader reader = command.ExecuteReader();

            Estudiante EstudianteSeleccionado = new();

            while (reader.Read())
            {
                EstudianteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);// Convert.ToInt32(reader["NumeroDeAula"]);
                EstudianteSeleccionado.Nombres = Convert.ToString(reader["Nombres"]);
                EstudianteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                EstudianteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                EstudianteSeleccionado.TelefonoSecundario = Convert.ToString(reader["TelefonoSecundario"]);

                EstudianteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                EstudianteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EstudianteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EstudianteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EstudianteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return EstudianteSeleccionado;
        }

        public List<Estudiante> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Estudiantes_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Estudiante> ListaTodosEstudiantes = new List<Estudiante>();

            while (reader.Read())
            {
                Estudiante EstudianteSeleccionado = new();

                EstudianteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);// Convert.ToInt32(reader["NumeroDeAula"]);
                EstudianteSeleccionado.Nombres = Convert.ToString(reader["Nombres"]);
                EstudianteSeleccionado.Apellidos = Convert.ToString(reader["Apellidos"]);
                EstudianteSeleccionado.Telefono = Convert.ToString(reader["Telefono"]);
                EstudianteSeleccionado.TelefonoSecundario = Convert.ToString(reader["TelefonoSecundario"]);

                EstudianteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                EstudianteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                EstudianteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                EstudianteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                EstudianteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosEstudiantes.Add(EstudianteSeleccionado);
            }

            reader.Close();

            return ListaTodosEstudiantes;
        }
    }
}

