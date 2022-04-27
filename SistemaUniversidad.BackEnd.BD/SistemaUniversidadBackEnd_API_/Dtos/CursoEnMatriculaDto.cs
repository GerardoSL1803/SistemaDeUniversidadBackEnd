using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class CursoEnMatriculaDto
	{
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int CodigoMatricula { get; set; }
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int CodigoCurso { get; set; }
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public decimal MontoDeCurso { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(1, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]		
			public bool? Activo { get; set; }
	}
}
