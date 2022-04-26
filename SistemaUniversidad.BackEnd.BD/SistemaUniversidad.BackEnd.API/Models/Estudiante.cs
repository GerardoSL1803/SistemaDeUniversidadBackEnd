namespace SistemaUniversidad.BackEnd.API.Models
{
    public class Estudiante
    {

        public string Identificacion { get; set; }

        public string Nombres { get; set; }

        public string Apellidos { get; set; }

        public string Telefono { get; set; }

        public string TelefonoSecundario { get; set; }

        public DateTime FechaIngreso { get; set; }

        public bool? Activo { get; set; }

        public DateTime FechaCreacion { get; set; }

        public DateTime? FechaModificacion { get; set; }

        public string CreadoPor { get; set; }

        public string ModificadoPor { get; set; }

    }
}
