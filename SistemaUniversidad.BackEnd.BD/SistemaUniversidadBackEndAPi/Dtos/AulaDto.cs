using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class AulaDto
    {
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int NumeroDeAula { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(20, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string NombreDeAula { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(1, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]		
			public bool? Activo { get; set; }
	}
}
