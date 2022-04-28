using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursosController : ControllerBase
    {
        private readonly ICursosService ServicioDeCursos;
        public CursosController(ICursosService cursoService)
        {
            ServicioDeCursos = cursoService;
        }

        // GET: api/<CursosController>
        [HttpGet]
        public List<CursoDto> Get()
        {
            List<Curso> ListaTodosLosCursos = ServicioDeCursos.SeleccionarTodos();

            List<CursoDto> ListaTodosLosCursosDto = new();

            foreach (var CursoSeleccionada in ListaTodosLosCursos)
            {
                CursoDto cursoDto = new();

                cursoDto.Nombre = CursoSeleccionada.Nombre;
                cursoDto.MontoCurso = CursoSeleccionada.MontoCurso;
                cursoDto.Activo = CursoSeleccionada.Activo;

                ListaTodosLosCursosDto.Add(cursoDto);
            }

            return ListaTodosLosCursosDto;
        }

        // GET api/<CursosController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            Curso CursoSeleccionada = new();

            CursoSeleccionada = ServicioDeCursos.SeleccionarPorId(id);

            
            if (CursoSeleccionada.CodigoCurso == 0)
            {
                return NotFound("Curso no encontrada");
            }

            CursoDto cursoDto = new();

            cursoDto.Nombre = CursoSeleccionada.Nombre;
            cursoDto.MontoCurso = CursoSeleccionada.MontoCurso;
            cursoDto.Activo = CursoSeleccionada.Activo;

            return Ok(cursoDto);
        }

        // POST api/<CursosController>
        [HttpPost]
        public IActionResult Post([FromBody] CursoDto cursoDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Curso CursoPorInsertar = new();

                    CursoPorInsertar.Nombre = cursoDto.Nombre;
                    CursoPorInsertar.MontoCurso = cursoDto.MontoCurso;
                    CursoPorInsertar.CreadoPor = "diazgs";

                    ServicioDeCursos.Insertar(CursoPorInsertar);

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

        // PUT api/<CursosController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CursoDto cursoDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Curso CursoPorActualizar = new();

                    CursoPorActualizar.CodigoCurso = id;
                    CursoPorActualizar.Nombre = cursoDto.Nombre;
                    CursoPorActualizar.MontoCurso = cursoDto.MontoCurso;
                    CursoPorActualizar.ModificadoPor = "diazgs";

                    ServicioDeCursos.Actualizar(CursoPorActualizar);

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

        // DELETE api/<CursosController>/5
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
