using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class CursoDto
    {
     
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(20, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

        public string Nombre { get; set; }


        [Required(ErrorMessage = "{0} es un campo obligatorio")]

        public decimal MontoCurso { get; set; }

        public bool? Activo { get; set; }
    }
}
