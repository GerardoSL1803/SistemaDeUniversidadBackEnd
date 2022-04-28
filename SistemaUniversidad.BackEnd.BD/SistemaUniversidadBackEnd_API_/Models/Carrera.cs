namespace SistemaUniversidad.BackEnd.API.Models
{
    public class Carrera
	{		
		public int CodigoCarrera { get; set; }

		public string Nombre { get; set; }

		public bool? Activo { get; set; }

		public DateTime FechaCreacion { get; set; }

		public DateTime? FechaModificacion { get; set; }

		public string CreadoPor { get; set; }

		public string ModificadoPor { get; set; }

	}
}
