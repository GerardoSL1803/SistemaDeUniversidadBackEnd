using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services.Interfaces;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CursoDocenteController : ControllerBase
    {
        private readonly ICursoDocenteService ServicioDeCursoDocente;
        public CursoDocenteController(ICursoDocenteService CursoDocenteService)
        {
            ServicioDeCursoDocente = CursoDocenteService;
        }
        // GET: api/<CursoDocenteController>

        [HttpGet]
        public List<CursoDocenteDto> Get()
        {
            List<CursoDocente> ListaTodosLosCursoDocente = ServicioDeCursoDocente.SeleccionarTodos();

            List<CursoDocenteDto> ListaTodosCursoDocenteDto = new();

            foreach (var CursoDocenteSeleccionado in ListaTodosCursoDocenteDto)
            {
                CursoDocenteDto CursoDocenteDto = new();

                CursoDocenteDto.Codigo = CursoDocenteSeleccionado.Codigo;
                CursoDocenteDto.Curso = CursoDocenteSeleccionado.Curso;
                CursoDocenteDto.Identificacion = CursoDocenteSeleccionado.Identificacion;
                CursoDocenteDto.CicloLectivo = CursoDocenteSeleccionado.CicloLectivo;
                CursoDocenteDto.Activo = CursoDocenteSeleccionado.Activo;

                ListaTodosCursoDocenteDto.Add(CursoDocenteDto);
            }

            return ListaTodosCursoDocenteDto;
        }

        // GET api/<AulasController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            CursoDocente CursoDocenteSelecionado = new();

            CursoDocenteSelecionado = ServicioDeCursoDocente.SeleccionarPorId(id);

            if (CursoDocenteSelecionado.Codigo == 0)
            {
                return NotFound("Aula no encontrada");
            }

            CursoDocenteDto CursoDocenteDto = new();

            CursoDocenteDto.Codigo = CursoDocenteSelecionado.Codigo;
            CursoDocenteDto.Curso = CursoDocenteSelecionado.Curso;
            CursoDocenteDto.Identificacion = CursoDocenteSelecionado.Identificacion;
            CursoDocenteDto.CicloLectivo = CursoDocenteSelecionado.CicloLectivo;
            CursoDocenteDto.Activo = CursoDocenteSelecionado.Activo;

            return Ok(CursoDocenteDto);
        }

        // POST api/<AulasController>
        [HttpPost]
        public IActionResult Post([FromBody] CursoDocenteDto CursoDocenteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoDocente CursodocentePorInsertar = new();

                    CursodocentePorInsertar.Curso = CursoDocenteDto.Curso;
                    CursodocentePorInsertar.Identificacion = CursoDocenteDto.Identificacion;
                    CursodocentePorInsertar.CicloLectivo = CursoDocenteDto.CicloLectivo;
                    CursodocentePorInsertar.CreadoPor = "diazgs";

                    ServicioDeCursoDocente.Insertar(CursodocentePorInsertar);

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
        public IActionResult Put(int id, [FromBody] CursoDocenteDto CursoDocenteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CursoDocente CursoDocentePorActualizar = new();

                    CursoDocentePorActualizar.Codigo = CursoDocenteDto.Codigo;
                    CursoDocentePorActualizar.Curso = CursoDocenteDto.Curso;
                    CursoDocentePorActualizar.Identificacion = CursoDocenteDto.Identificacion;
                    CursoDocentePorActualizar.CicloLectivo = CursoDocenteDto.CicloLectivo;
                    CursoDocentePorActualizar.ModificadoPor = "diazgs";

                    ServicioDeCursoDocente.Actualizar(CursoDocentePorActualizar);

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