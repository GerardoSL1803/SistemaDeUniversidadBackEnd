using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class CursoDocenteDto
    {
			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int Codigo { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int Curso { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(20, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]
			public string Identificacion { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			public int CicloLectivo { get; set; }

			[Required(ErrorMessage = "{0} es un campo obligatorio")]
			[MaxLength(1, ErrorMessage = "{0} tiene que tener maximo {1} caracteres")]		
			public bool? Activo { get; set; }
	}
}
