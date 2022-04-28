using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AulasController : ControllerBase
    {
        private readonly IAulasService ServicioDeAulas;
        public AulasController(IAulasService AulasService)
        {
            ServicioDeAulas = AulasService;
        }
        // GET: api/<AulasController>
        [HttpGet]
        public List<AulaDto> Get()
        {
            List<Aula> ListaTodasLasAulas = ServicioDeAulas.SeleccionarTodos();

            List<AulaDto> ListaTodasLasAulasDto = new();

            foreach (var Aulaseleccionada in ListaTodasLasAulas)
            {
                AulaDto AulaDTO = new();

                AulaDTO.NumeroDeAula = Aulaseleccionada.NumeroDeAula;
                AulaDTO.NombreDeAula = Aulaseleccionada.NombreDeAula;
                AulaDTO.Activo = Aulaseleccionada.Activo;

                ListaTodasLasAulasDto.Add(AulaDTO);
            }

            return ListaTodasLasAulasDto;
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Aula Aulaseleccionada = new();

            Aulaseleccionada = ServicioDeAulas.SeleccionarPorId(id);

            if (Aulaseleccionada.NumeroDeAula == 0)
            {
                return NotFound("Aula no encontrada");
            }

            AulaDto AulaDTO = new();

            AulaDTO.NumeroDeAula = Aulaseleccionada.NumeroDeAula;
            AulaDTO.NombreDeAula = Aulaseleccionada.NombreDeAula;
            AulaDTO.Activo = Aulaseleccionada.Activo;

            return Ok(AulaDTO);
        }

        // POST api/<AulasController>
        [HttpPost]
        public IActionResult Post([FromBody] AulaDto AulaDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Aula AulaPorInsertar = new();

                    AulaPorInsertar.NumeroDeAula = AulaDTO.NumeroDeAula;
                    AulaPorInsertar.NombreDeAula = AulaDTO.NombreDeAula;
                    AulaPorInsertar.CreadoPor = "diazgs";

                    ServicioDeAulas.Insertar(AulaPorInsertar);

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
        public IActionResult Put(int id, [FromBody] AulaDto AulaDTO)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Aula AulaPorActualizar = new();

                    AulaPorActualizar.NumeroDeAula = AulaDTO.NumeroDeAula;
                    AulaPorActualizar.NombreDeAula = AulaDTO.NombreDeAula;
                    AulaPorActualizar.ModificadoPor = "diazgs";

                    ServicioDeAulas.Actualizar(AulaPorActualizar);

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