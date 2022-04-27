using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class CursoEnAulaDto
    {
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int CodigoCurso { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int NumeroDeAula { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int CodigoCiclo { get ; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(10, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string DiaLectivo { get; set; }

		[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(10, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string HoraInicio { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(10, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string HoraFin { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(1, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]		
			public bool? Activo { get; set; }
	}
}
