using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstudiantesController : ControllerBase
    {
        private readonly IEstudiantesService ServicioDeEstudiantes;
        public EstudiantesController(IEstudiantesService EstudiantesService)
        {
            ServicioDeEstudiantes = EstudiantesService;
        }

        [HttpGet]
        public List<EstudianteDto> Get()
        {
            List<Estudiante> ListaTodosLosEstudiantes = ServicioDeEstudiantes.SeleccionarTodos();

            List<EstudianteDto> ListaTodosLosEstudiantesDto = new();

            foreach (var EstudianteSeleccionado in ListaTodosLosEstudiantes)
            {
                EstudianteDto EstudianteDto = new();

                EstudianteDto.Idetificacion = EstudianteSeleccionado.Identificacion;
                EstudianteDto.Nombres = EstudianteSeleccionado.Nombres;
                EstudianteDto.Apellidos = EstudianteSeleccionado.Apellidos;
                EstudianteDto.Telefono = EstudianteSeleccionado.Telefono;
                EstudianteDto.TelefonoSecundario = EstudianteSeleccionado.TelefonoSecundario;

                EstudianteDto.Activo = EstudianteSeleccionado.Activo;

                ListaTodosLosEstudiantesDto.Add(EstudianteDto);
            }

            return ListaTodosLosEstudiantesDto;
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(string id)
        {
            Estudiante EstudianteSeleccionado = new();

            EstudianteSeleccionado = ServicioDeEstudiantes.SeleccionarPorId(id);

            if (EstudianteSeleccionado.Identificacion == null)
            {
                return NotFound("Estudiante no encontrado");
            }

            EstudianteDto EstudianteDto = new();

            EstudianteDto.Idetificacion = EstudianteSeleccionado.Identificacion;
            EstudianteDto.Nombres = EstudianteSeleccionado.Nombres;
            EstudianteDto.Apellidos = EstudianteSeleccionado.Apellidos;
            EstudianteDto.Telefono = EstudianteSeleccionado.Telefono;
            EstudianteDto.TelefonoSecundario = EstudianteSeleccionado.TelefonoSecundario;
            EstudianteDto.Activo = EstudianteSeleccionado.Activo;

            return Ok(EstudianteDto);
        }

        // POST api/<AulasController>
        [HttpPost]
        public IActionResult Post([FromBody] EstudianteDto EstudianteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Estudiante EstudiantePorInsertar = new();

                    EstudiantePorInsertar.Identificacion = EstudianteDto.Idetificacion;
                    EstudiantePorInsertar.Nombres = EstudianteDto.Nombres;
                    EstudiantePorInsertar.Apellidos = EstudianteDto.Apellidos;
                    EstudiantePorInsertar.Telefono = EstudianteDto.Telefono;
                    EstudiantePorInsertar.TelefonoSecundario = EstudianteDto.TelefonoSecundario;
                    EstudiantePorInsertar.CreadoPor = "diazgs";

                    ServicioDeEstudiantes.Insertar(EstudiantePorInsertar);

                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();

                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // PUT api/<AulasController>/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] EstudianteDto EstudianteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Estudiante EstudiantePorActualizar = new();

                    EstudiantePorActualizar.Nombres = EstudianteDto.Nombres;
                    EstudiantePorActualizar.Apellidos = EstudianteDto.Apellidos;
                    EstudiantePorActualizar.Telefono = EstudianteDto.Telefono;
                    EstudiantePorActualizar.TelefonoSecundario = EstudianteDto.TelefonoSecundario;
                    EstudiantePorActualizar.ModificadoPor = "diazgs";

                    ServicioDeEstudiantes.Actualizar(EstudiantePorActualizar);

                    return Ok();
                }
                else
                {
                    string ErroreEnElModelo = ObtenerErroresDeModeloInvalido();

                    return BadRequest(ErroreEnElModelo);
                }
            }
            catch (Exception Ex)
            {
                return BadRequest(Ex.Message);
            }
        }

        // DELETE api/<AulasController>/5
        [HttpDelete("{id}")]
        public void Delete(String id)
        {

        }

        private string ObtenerErroresDeModeloInvalido()
        {

            var ListaDeErroresEnModelo = ModelState.Keys.Where(i => ModelState[i].Errors.Count > 0)
                                                     .Select(k => ModelState[k].Errors.First().ErrorMessage);

            string ListaDeErroresEnModeloConcatenados = string.Join("\n", ListaDeErroresEnModelo);

            return ListaDeErroresEnModeloConcatenados;
        }
    }
}