namespace SistemaUniversidad.BackEnd.API.Models
{
	public class CursoEnAula
	{
		public int CodigoCurso { get; set; }

		public int NumeroeDeAula { get; set; }

		public int CodigoCiclo { get; set; }

		public string DiaLectivo { get; set; }

		public string HoraInicio { get; set; }

		public string HoraFin { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
