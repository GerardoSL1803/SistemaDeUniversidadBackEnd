using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursoEnAulaController : ControllerBase
    {
        private readonly ICursoEnAulaService ServicoDeCursoEnAula;
        public CursoEnAulaController(ICursoEnAulaService CursoEnAulaService)
        {
            ServicoDeCursoEnAula = CursoEnAulaService;
        }
        // GET: api/<AulasController>
        [HttpGet]
        public List<CursoEnAulaDto> Get()
        {
            List<CursoEnAula> ListaTodoCursoEnAula = ServicoDeCursoEnAula.SeleccionarTodos();

            List<CursoEnAulaDto> ListaTodoCursoEnAulaDto = new();

            foreach (var CursoEnAulaSeleccionado in ListaTodoCursoEnAula)
            {
                CursoEnAulaDto cursoEnAulaDto = new();

                cursoEnAulaDto.CodigoCurso = CursoEnAulaSeleccionado.CodigoCurso;
                cursoEnAulaDto.NumeroDeAula = CursoEnAulaSeleccionado.NumeroeDeAula;
                cursoEnAulaDto.CodigoCiclo = CursoEnAulaSeleccionado.CodigoCiclo;
                cursoEnAulaDto.DiaLectivo = CursoEnAulaSeleccionado.DiaLectivo;
                cursoEnAulaDto.HoraInicio = CursoEnAulaSeleccionado.HoraInicio;
                cursoEnAulaDto.HoraFin = CursoEnAulaSeleccionado.HoraFin;
                cursoEnAulaDto.Activo = CursoEnAulaSeleccionado.Activo;

                ListaTodoCursoEnAulaDto.Add(cursoEnAulaDto);
            }

            return ListaTodoCursoEnAulaDto;
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            CursoEnAula CursoEnAulaSeleccionado = new();

            CursoEnAulaSeleccionado = ServicoDeCursoEnAula.SeleccionarPorId(id);

            if (CursoEnAulaSeleccionado.CodigoCurso == 0 && CursoEnAulaSeleccionado.CodigoCiclo ==0 && CursoEnAulaSeleccionado.NumeroeDeAula ==0)
            {
                return NotFound("CursosEnAulas no encontrada");
            }

            CursoEnAulaDto CursoEnAulaDto = new();

            CursoEnAulaDto.CodigoCurso = CursoEnAulaSeleccionado.CodigoCurso;
            CursoEnAulaDto.NumeroDeAula = CursoEnAulaSeleccionado.NumeroeDeAula;
            CursoEnAulaDto.CodigoCiclo = CursoEnAulaSeleccionado.CodigoCiclo;
            CursoEnAulaDto.DiaLectivo = CursoEnAulaSeleccionado.DiaLectivo;
            CursoEnAulaDto.HoraInicio = CursoEnAulaSeleccionado.HoraInicio;
            CursoEnAulaDto.HoraFin = CursoEnAulaSeleccionado.HoraFin;

            CursoEnAulaDto.Activo = CursoEnAulaSeleccionado.Activo;

            return Ok(CursoEnAulaDto);
        }

        // POST api/<AulasController>
        [HttpPost]
        public IActionResult Post([FromBody] CursoEnAulaDto CursoEnAulaDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoEnAula CursoEnAulaPorInsertar = new();

                    CursoEnAulaPorInsertar.CodigoCurso = CursoEnAulaDto.CodigoCurso;
                    CursoEnAulaPorInsertar.NumeroeDeAula = CursoEnAulaDto.NumeroDeAula;
                    CursoEnAulaPorInsertar.CodigoCiclo = CursoEnAulaDto.CodigoCiclo;
                    CursoEnAulaPorInsertar.DiaLectivo = CursoEnAulaDto.DiaLectivo;
                    CursoEnAulaPorInsertar.HoraInicio = CursoEnAulaDto.HoraInicio;
                    CursoEnAulaPorInsertar.HoraFin = CursoEnAulaDto.HoraFin;
                    CursoEnAulaPorInsertar.CreadoPor = "diazgs";

                    ServicoDeCursoEnAula.Insertar(CursoEnAulaPorInsertar);

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
        public IActionResult Put(int id, [FromBody] CursoEnAulaDto CursoEnAulaDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoEnAula CursoEnAulaPorActualizar = new();

                    CursoEnAulaPorActualizar.CodigoCurso = CursoEnAulaDto.CodigoCurso;
                    CursoEnAulaPorActualizar.NumeroeDeAula = CursoEnAulaDto.NumeroDeAula;
                    CursoEnAulaPorActualizar.CodigoCiclo = CursoEnAulaDto.CodigoCiclo;
                    CursoEnAulaPorActualizar.DiaLectivo = CursoEnAulaDto.DiaLectivo;
                    CursoEnAulaPorActualizar.HoraInicio = CursoEnAulaDto.HoraInicio;
                    CursoEnAulaPorActualizar.HoraFin = CursoEnAulaDto.HoraFin;
                    CursoEnAulaPorActualizar.ModificadoPor = "diazgs";

                    ServicoDeCursoEnAula.Actualizar(CursoEnAulaPorActualizar);

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