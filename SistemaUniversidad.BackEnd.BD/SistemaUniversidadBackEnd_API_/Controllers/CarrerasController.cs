using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarrerasController : ControllerBase
    {
        private readonly ICarrerasService ServicioDeCarreras;
        public CarrerasController(ICarrerasService carreraService)
        {
            ServicioDeCarreras = carreraService;
        }

        // GET: api/<CarrerasController>
        [HttpGet]
        public List<CarreraDto> Get()
        {
            List<Carrera> ListaTodasLasCarreras = ServicioDeCarreras.SeleccionarTodos();

            List<CarreraDto> ListaTodasLasCarrerasDto = new();

            foreach (var CarrerasSeleccionada in ListaTodasLasCarreras)
            {
                CarreraDto carreraDto = new();
                
                carreraDto.CodigoSede = CarrerasSeleccionada.CodigoSede;
                carreraDto.Nombre = CarrerasSeleccionada.Nombre;
                carreraDto.Activo = CarrerasSeleccionada.Activo;

                ListaTodasLasCarrerasDto.Add(carreraDto);
            }

            return ListaTodasLasCarrerasDto;
        }

        // GET api/<CarrerasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
           Carrera CarrerasSeleccionada = new();

            CarrerasSeleccionada = ServicioDeCarreras.SeleccionarPorId(id);

            if (CarrerasSeleccionada.CodigoCarrera == 0)
            {
                return NotFound("Carrera no encontrada");
            }

            CarreraDto carreraDto = new();

            carreraDto.CodigoSede = CarrerasSeleccionada.CodigoSede;
            carreraDto.Nombre = CarrerasSeleccionada.Nombre;
            carreraDto.Activo = CarrerasSeleccionada.Activo;

            return Ok(carreraDto);
        }

        // POST api/<CarrerasController>
        [HttpPost]
        public IActionResult Post([FromBody] CarreraDto carreraDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Carrera CarreraPorInsertar = new();
                    CarreraPorInsertar.CodigoSede = carreraDto.CodigoSede;
                    CarreraPorInsertar.Nombre = carreraDto.Nombre;
                    CarreraPorInsertar.CreadoPor = "diazgs";

                    ServicioDeCarreras.Insertar(CarreraPorInsertar);

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

        // PUT api/<CarrerasController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CarreraDto carreraDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Carrera CarreraPorActualizar = new();

                    CarreraPorActualizar.CodigoCarrera = id;
                    CarreraPorActualizar.CodigoSede = carreraDto.CodigoSede;
                    CarreraPorActualizar.Nombre = carreraDto.Nombre;
                    CarreraPorActualizar.ModificadoPor = "diazgs";

                    ServicioDeCarreras.Actualizar(CarreraPorActualizar);

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

        // DELETE api/<CarrerasController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
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
