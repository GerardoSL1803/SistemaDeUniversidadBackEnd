using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class CursoEnMatriculaRepository : ConexionBD, ICursoEnMatriculaRepository
    {
        public CursoEnMatriculaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(CursoEnMatricula CursoEnMatricula)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_CursosEnMatricula_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoMatricula", CursoEnMatricula.CodigoMatricula);
            command.Parameters.AddWithValue("@CodigoCurso", CursoEnMatricula.CodigoCurso);
            command.Parameters.AddWithValue("@ModificadoPor", CursoEnMatricula.ModificadoPor);

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

        public void Insertar(CursoEnMatricula CursoEnMatricula)
        {
            var query = "SP_CursosEnMatricula_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoMatricula", CursoEnMatricula.CodigoMatricula);
            command.Parameters.AddWithValue("@CodigoCurso", CursoEnMatricula.CodigoCurso);
            command.Parameters.AddWithValue("@MontoCurso", CursoEnMatricula.MontoDeCurso);
            command.Parameters.AddWithValue("@CreadoPor", CursoEnMatricula.CreadoPor);

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

        public CursoEnMatricula SeleccionarPorId(int CodigoMatricula,int CodigoCurso)
        {
            var query = "SELECT * FROM FN_CursosEnMatricula_SeleccionarPorId(@CodigoMatricula,@Codigocurso)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@CodigoMatricula", CodigoMatricula);
            command.Parameters.AddWithValue("@Codigocurso", CodigoCurso);

            SqlDataReader reader = command.ExecuteReader();

            CursoEnMatricula CursoEnMatriculaSeleccionada = new();

            while (reader.Read())
            {
                CursoEnMatriculaSeleccionada.CodigoMatricula = Convert.ToInt32(reader["CodigoMatricula"]);
                CursoEnMatriculaSeleccionada.CodigoCurso = Convert.ToInt32(reader["CodigoCurso"]);
                CursoEnMatriculaSeleccionada.MontoDeCurso = Convert.ToDecimal(reader["MontoDeCurso"]);

                CursoEnMatriculaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoEnMatriculaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoEnMatriculaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoEnMatriculaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoEnMatriculaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CursoEnMatriculaSeleccionada;
        }

        public CursoEnMatricula SeleccionarPorId(int Id)
        {
            throw new NotImplementedException();
        }

        public List<CursoEnMatricula> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_CursosEnMatricula_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<CursoEnMatricula> ListaTodasCursoEnMatricula = new List<CursoEnMatricula>();

            while (reader.Read())
            {
                CursoEnMatricula CursoEnMatriculaSeleccionada = new();

                CursoEnMatriculaSeleccionada.CodigoMatricula = Convert.ToInt32(reader["CodigoMatricula"]);
                CursoEnMatriculaSeleccionada.CodigoCurso = Convert.ToInt32(reader["CodigoCurso"]);
                CursoEnMatriculaSeleccionada.MontoDeCurso = Convert.ToDecimal(reader["MontoDeCurso"]);

                CursoEnMatriculaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoEnMatriculaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoEnMatriculaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoEnMatriculaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoEnMatriculaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodasCursoEnMatricula.Add(CursoEnMatriculaSeleccionada);
            }

            reader.Close();

            return ListaTodasCursoEnMatricula;
        }
    }
}

