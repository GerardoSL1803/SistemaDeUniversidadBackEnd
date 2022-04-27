namespace SistemaUniversidad.BackEnd.API.Models
{
	public class CursoDocente
	{
		public int Codigo { get; set; }

		public int Curso { get; set; }

		public string Identificacion { get; set; }

		public int CicloLectivo { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
