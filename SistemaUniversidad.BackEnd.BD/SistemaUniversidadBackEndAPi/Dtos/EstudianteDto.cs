using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class EstudianteDto
    {
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(20, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string Idetificacion { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(50, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string Nombres { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(50, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string Apellidos { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(20, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string Telefono { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(20, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string TelefonoSecundario { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(1, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]		
			public bool? Activo { get; set; }
	}
}
