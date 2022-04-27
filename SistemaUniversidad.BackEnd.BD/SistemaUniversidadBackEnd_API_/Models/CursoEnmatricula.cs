namespace SistemaUniversidad.BackEnd.API.Models
{
	public class CursoEnMatricula
	{
		public int CodigoMatricula { get; set; }

		public int CodigoCurso { get; set; }

		public decimal MontoDeCurso { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
