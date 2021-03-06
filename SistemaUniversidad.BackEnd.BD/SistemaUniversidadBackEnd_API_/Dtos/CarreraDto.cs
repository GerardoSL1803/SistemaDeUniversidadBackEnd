using System.ComponentModel.DataAnnotations;

namespace SistemaUniversidad.BackEnd.API.Dtos
{
    public class CarreraDto
    {
        public int CodigoSede { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [MaxLength(50, ErrorMessage = "{0} tiene que tener máximo {1} caracteres")]

        public string Nombre { get; set; }

        public bool? Activo { get; set; }
    }
}
