using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class CursoDocenteRepository : ConexionBD, ICursoDocente
    {
        public CursoDocenteRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(CursoDocente CursoDocente)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_CursosDocentes_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Codigo", CursoDocente.Codigo);
            command.Parameters.AddWithValue("@Curso", CursoDocente.Curso);
            command.Parameters.AddWithValue("@Identificacion", CursoDocente.Identificacion);
            command.Parameters.AddWithValue("@CicloLectivo", CursoDocente.CicloLectivo);
            command.Parameters.AddWithValue("@ModificadoPor", CursoDocente.ModificadoPor);

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

        public void Insertar(CursoDocente CursoDocente)
        {
            var query = "SP_CursosDocentes_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Curso", CursoDocente.Curso);
            command.Parameters.AddWithValue("@Identificaion", CursoDocente.Identificacion);
            command.Parameters.AddWithValue("@CicloLectivo", CursoDocente.CicloLectivo);
            command.Parameters.AddWithValue("@CreadoPor", CursoDocente.CreadoPor);

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

        public CursoDocente SeleccionarPorId(int Codigo)
        {
            var query = "SELECT * FROM FN_CursosDocentes_SeleccionarPorId(@Codigo)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@Codigo", Codigo);

            SqlDataReader reader = command.ExecuteReader();

            CursoDocente CursoDocenteSeleccionado = new();

            while (reader.Read())
            {
                CursoDocenteSeleccionado.Codigo = Convert.ToInt32(reader["Codigo"]);
                CursoDocenteSeleccionado.Curso = Convert.ToInt32(reader["Curso"]);
                CursoDocenteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);
                CursoDocenteSeleccionado.CicloLectivo = Convert.ToInt32(reader["CicloLectivo"]);

                CursoDocenteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoDocenteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoDocenteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoDocenteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoDocenteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CursoDocenteSeleccionado;
        }

        public List<CursoDocente> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_CursosDocentes_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<CursoDocente> ListaTodoCursoDocente = new List<CursoDocente>();

            while (reader.Read())
            {
                CursoDocente CursoDocenteSeleccionado = new();

                CursoDocenteSeleccionado.Codigo = Convert.ToInt32(reader["Codigo"]);
                CursoDocenteSeleccionado.Curso = Convert.ToInt32(reader["Curso"]);
                CursoDocenteSeleccionado.Identificacion = Convert.ToString(reader["Identificacion"]);
                CursoDocenteSeleccionado.CicloLectivo = Convert.ToInt32(reader["CicloLectivo"]);

                CursoDocenteSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoDocenteSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoDocenteSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoDocenteSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoDocenteSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodoCursoDocente.Add(CursoDocenteSeleccionado);
            }

            reader.Close();

            return ListaTodoCursoDocente ;
        }
    }
}

