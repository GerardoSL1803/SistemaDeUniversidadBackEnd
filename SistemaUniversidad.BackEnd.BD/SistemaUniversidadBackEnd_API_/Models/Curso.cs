namespace SistemaUniversidad.BackEnd.API.Models
{
    public class Curso
	{
		public int CodigoCurso { get; set; }

		public string Nombre { get; set; }

		public decimal MontoCurso { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }
	}
}
