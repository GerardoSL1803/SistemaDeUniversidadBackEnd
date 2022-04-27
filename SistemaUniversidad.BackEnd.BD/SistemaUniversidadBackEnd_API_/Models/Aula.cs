namespace SistemaUniversidad.BackEnd.API.Models
{
	public class Aula
	{
		public int NumeroDeAula { get; set; }

		public string NombreDeAula { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
