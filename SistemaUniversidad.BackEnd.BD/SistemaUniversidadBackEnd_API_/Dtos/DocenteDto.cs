using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class DocenteDto
	{
		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

		public string Identificacion { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

		public string Nombres { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

		public string Apellidos { get; set; }


		[Required(ErrorMessage = "{0} es un campo obligatorio")]
		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

		public string Telefono { get; set; }


		[MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

		public string TelefonoSecundario { get; set; }


		public bool? Activo { get; set; }
	}
}
