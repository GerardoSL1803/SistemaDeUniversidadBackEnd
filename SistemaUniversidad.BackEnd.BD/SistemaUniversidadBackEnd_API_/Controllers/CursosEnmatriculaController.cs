using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursosEnmatriculaController : ControllerBase
    {
        private readonly ICursoEnMatriculaService ServicioDeCursoEnMatricula;
        public CursosEnmatriculaController(ICursoEnMatriculaService CursoEnMatriculaService)
        {
            ServicioDeCursoEnMatricula = CursoEnMatriculaService;
        }
        // GET: api/<AulasController>
        [HttpGet]
        public List<CursoEnMatriculaDto> Get()
        {
            List<CursoEnMatricula> ListaTodasCursoEnMatricula = ServicioDeCursoEnMatricula.SeleccionarTodos();

            List<CursoEnMatriculaDto> ListaTodasLasAulasDto = new();

            foreach (var CursoEnMatriculaseleccionada in ListaTodasCursoEnMatricula)
            {
                CursoEnMatriculaDto CursoEnMatriculaDto = new();
                CursoEnMatriculaDto.CodigoMatricula = CursoEnMatriculaseleccionada.CodigoMatricula;
                CursoEnMatriculaDto.CodigoCurso = CursoEnMatriculaseleccionada.CodigoCurso;
                CursoEnMatriculaDto.MontoDeCurso = CursoEnMatriculaseleccionada.MontoDeCurso;

                CursoEnMatriculaDto.Activo = CursoEnMatriculaseleccionada.Activo;

                ListaTodasLasAulasDto.Add(CursoEnMatriculaDto);
            }

            return ListaTodasLasAulasDto;
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            CursoEnMatricula CursoEnMatriculaseleccionada = new();

            CursoEnMatriculaseleccionada = ServicioDeCursoEnMatricula.SeleccionarPorId(id);

            if (CursoEnMatriculaseleccionada.CodigoMatricula == 0 && CursoEnMatriculaseleccionada.CodigoCurso == 0)
            {
                return NotFound("CursoEnMatricula no encontrada");
            }

            CursoEnMatriculaDto CursoEnMatriculaDto = new();

            CursoEnMatriculaDto.CodigoMatricula = CursoEnMatriculaseleccionada.CodigoMatricula;
            CursoEnMatriculaDto.CodigoCurso = CursoEnMatriculaseleccionada.CodigoCurso;
            CursoEnMatriculaDto.MontoDeCurso = CursoEnMatriculaseleccionada.MontoDeCurso;
            CursoEnMatriculaDto.Activo = CursoEnMatriculaseleccionada.Activo;

            return Ok(CursoEnMatriculaDto);
        }

        // POST api/<AulasController>
        [HttpPost]
        public IActionResult Post([FromBody] CursoEnMatriculaDto CursoEnMatriculaDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoEnMatricula CursoEnMatriculaPorInsertar = new();

                    CursoEnMatriculaPorInsertar.CodigoMatricula = CursoEnMatriculaDto.CodigoMatricula;
                    CursoEnMatriculaPorInsertar.CodigoCurso = CursoEnMatriculaDto.CodigoCurso;
                    CursoEnMatriculaPorInsertar.MontoDeCurso = CursoEnMatriculaDto.MontoDeCurso;
                    CursoEnMatriculaPorInsertar.CreadoPor = "diazgs";

                    ServicioDeCursoEnMatricula.Insertar(CursoEnMatriculaPorInsertar);

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
        public IActionResult Put(int id, [FromBody] CursoEnMatriculaDto CursoEnMatriculaDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoEnMatricula CursoEnMatriculaPorActualizar = new();

                    CursoEnMatriculaPorActualizar.CodigoMatricula = CursoEnMatriculaDto.CodigoMatricula;
                    CursoEnMatriculaPorActualizar.CodigoCurso = CursoEnMatriculaDto.CodigoCurso;
                    CursoEnMatriculaPorActualizar.ModificadoPor = "diazgs";
                    ServicioDeCursoEnMatricula.Actualizar(CursoEnMatriculaPorActualizar);

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