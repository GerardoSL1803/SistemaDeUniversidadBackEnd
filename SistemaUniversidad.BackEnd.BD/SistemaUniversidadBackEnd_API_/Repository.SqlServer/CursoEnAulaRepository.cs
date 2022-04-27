using SistemaUniversidad.BackEnd.API.Models;
using System.Data;
using System.Data.SqlClient;

namespace SistemaUniversidad.BackEnd.API.Repository.SqlServer
{
    public class CursoEnAulaRepository : ConexionBD, ICursoEnAulaRepository
    {
        public CursoEnAulaRepository(SqlConnection context, SqlTransaction transaction)
        {
            this._context = context;
            this._transaction = transaction;
        }
        public void Actualizar(CursoEnAula CursoEnAula)
        {
            //Asi se hace cuando son consultas planas, que no se usa SPs ni Funciones
            //var query = "UPDATE Aula SET Horario = @Horario, CodigoCurso  = @CodigoCurso, FechaModificacion = @FechaModificacion, ModificadoPor = @ModificadoPor WHERE NumeroAula = @NumeroAula";
            //var command = CreateCommand(query);

            var query = "SP_CursosEnAulas_Actualizar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CodigoCurso", CursoEnAula.CodigoCurso);
            command.Parameters.AddWithValue("@NumeroDeAula", CursoEnAula.NumeroeDeAula);
            command.Parameters.AddWithValue("@CodigoCiclo", CursoEnAula.CodigoCiclo);
            command.Parameters.AddWithValue("@DiaLectivo", CursoEnAula.DiaLectivo);
            command.Parameters.AddWithValue("@HoraInicio", CursoEnAula.HoraInicio);
            command.Parameters.AddWithValue("@HoraFin", CursoEnAula.HoraFin);

            command.Parameters.AddWithValue("@ModificadoPor", CursoEnAula.ModificadoPor);

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

        public void Insertar(CursoEnAula CursoEnAula)
        {
            var query = "SP_CursosEnAulas_Insertar";
            var command = CreateCommand(query);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@CodigoCurso", CursoEnAula.CodigoCurso);
            command.Parameters.AddWithValue("@NumeroDeAula", CursoEnAula.NumeroeDeAula);
            command.Parameters.AddWithValue("@CodigoCiclo", CursoEnAula.CodigoCiclo);
            command.Parameters.AddWithValue("@DiaLectivo", CursoEnAula.DiaLectivo);
            command.Parameters.AddWithValue("@HoraInicio", CursoEnAula.HoraInicio);
            command.Parameters.AddWithValue("@HoraFin", CursoEnAula.HoraFin);

            command.Parameters.AddWithValue("@CreadoPor", CursoEnAula.CreadoPor);

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

        public CursoEnAula SeleccionarPorId(int CodigoCurso, int NumeroDeAula, int CodigoCiclo)
        {
            var query = "SELECT * FROM FN_CursosEnAulas_SeleccionarPorId(@CodigoCurso,@NumeroDeAula,@CodigoCiclo)";

            var command = CreateCommand(query);

            command.Parameters.AddWithValue("@CodigoCurso", CodigoCurso);
            command.Parameters.AddWithValue("@NumeroDeAula", NumeroDeAula);
            command.Parameters.AddWithValue("@CodigoCiclo", CodigoCiclo);

            SqlDataReader reader = command.ExecuteReader();

            CursoEnAula CursoEnAulaSeleccionada = new();

            while (reader.Read())
            {
                CursoEnAulaSeleccionada.CodigoCurso= Convert.ToInt32(reader["CodigoCurso"]);
                CursoEnAulaSeleccionada.NumeroeDeAula = Convert.ToInt32(reader["NumeroDeAula"]);
                CursoEnAulaSeleccionada.CodigoCiclo = Convert.ToInt32(reader["CodigoCiclo"]);
                CursoEnAulaSeleccionada.DiaLectivo = Convert.ToString(reader["DiaLectivo"]);
                CursoEnAulaSeleccionada.HoraInicio = Convert.ToString(reader["HoraInicio"]);
                CursoEnAulaSeleccionada.HoraFin = Convert.ToString(reader["HoraFin"]);

                CursoEnAulaSeleccionada.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoEnAulaSeleccionada.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoEnAulaSeleccionada.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoEnAulaSeleccionada.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoEnAulaSeleccionada.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);
            }

            reader.Close();

            return CursoEnAulaSeleccionada;
        }

        public CursoEnAula SeleccionarPorId(int Id)
        {
            throw new NotImplementedException();
        }

        public List<CursoEnAula> SeleccionarTodos()
        {
            var query = "SELECT * FROM FN_CursosEnAulas_SeleccionarTodos()";
            var command = CreateCommand(query);

            SqlDataReader reader = command.ExecuteReader();

            List<CursoEnAula> ListaTodosCursoEnAulas = new List<CursoEnAula>();

            while (reader.Read())
            {
                CursoEnAula CursoEnAulaSeleccionado = new();

                CursoEnAulaSeleccionado.CodigoCurso = Convert.ToInt32(reader["CodigoCurso"]);
                CursoEnAulaSeleccionado.NumeroeDeAula = Convert.ToInt32(reader["NumeroDeAula"]);
                CursoEnAulaSeleccionado.CodigoCiclo = Convert.ToInt32(reader["CodigoCiclo"]);
                CursoEnAulaSeleccionado.DiaLectivo = Convert.ToString(reader["DiaLectivo"]);
                CursoEnAulaSeleccionado.HoraInicio = Convert.ToString(reader["HoraInicio"]);
                CursoEnAulaSeleccionado.HoraFin = Convert.ToString(reader["HoraFin"]);

                CursoEnAulaSeleccionado.Activo = Convert.ToBoolean(reader["Activo"]);
                CursoEnAulaSeleccionado.FechaCreacion = Convert.ToDateTime(reader["FechaCreacion"]);
                CursoEnAulaSeleccionado.FechaModificacion = (DateTime?)(reader.IsDBNull("FechaModificacion") ? null : reader["FechaModificacion"]);
                CursoEnAulaSeleccionado.CreadoPor = Convert.ToString(reader["CreadoPor"]);
                CursoEnAulaSeleccionado.ModificadoPor = Convert.ToString(reader["ModificadoPor"]);

                ListaTodosCursoEnAulas.Add(CursoEnAulaSeleccionado);
            }

            reader.Close();

            return ListaTodosCursoEnAulas;
        }
    }
}


