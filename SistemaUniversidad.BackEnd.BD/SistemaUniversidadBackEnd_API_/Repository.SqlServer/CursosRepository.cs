using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class CursosRepository : ConexionBD, ICursosRepository
    {
        public CursosRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(Curso curso)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_Cursos_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("CodigoCurso", curso.CodigoCurso);
            command.Parameters.AddWithValue("@Nombre", curso.Nombre);
            command.Parameters.AddWithValue("@MontoCurso", curso.MontoCurso);
            command.Parameters.AddWithValue("@ModificadoPor", curso.ModificadoPor);

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

        public void Insertar(Curso curso)
        {
            var query = "SP_Cursos_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            
            command.Parameters.AddWithValue("@Nombre", curso.Nombre);
            command.Parameters.AddWithValue("@MontoCurso", curso.MontoCurso);
            command.Parameters.AddWithValue("@CreadoPor", curso.CreadoPor);

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

        public Curso SeleccionarPorId(int CodigoCurso)
        {
            var query = "SELECT * FROM FN_Cursos_SeleccionarPorId(@CodigoCurso)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@CodigoCurso", CodigoCurso);

            SqlDataReader reader = command.ExecuteReader();

            Curso CursoSeleccionado = new();

            while (reader.Read())
            {
                CursoSeleccionado.CodigoCurso = ((int)reader["CodigoCurso"]);
                CursoSeleccionado.Nombre = ((string)reader["Nombre"]);
                CursoSeleccionado.MontoCurso = ((decimal)reader["MontoCurso"]);

                CursoSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CursoSeleccionado;
        }

        public List<Curso> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_Cursos_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<Curso> ListaTodosLosCursos = new List<Curso>();

            while (reader.Read())
            {
                Curso CursoSeleccionada = new();

                CursoSeleccionada.CodigoCurso = ((int)reader["CodigoCurso"]);
                CursoSeleccionada.Nombre = ((string)reader["Nombre"]);
                CursoSeleccionada.MontoCurso = ((decimal)reader["MontoCurso"]);

                CursoSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosLosCursos.Add(CursoSeleccionada);
            }

            reader.Close();

            return ListaTodosLosCursos;
        }
    }
}
