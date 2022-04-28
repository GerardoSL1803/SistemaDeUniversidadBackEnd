using Microsoft.AspNetCore.Mvc;
using SistemaUniversidad.BackEnd.API.Dtos;
using SistemaUniversidad.BackEnd.API.Models;
using SistemaUniversidad.BackEnd.API.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SistemaUniversidad.BackEnd.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DocentesController : ControllerBase
    {
        private readonly IDocentesService ServicioDeDocente;
        public DocentesController(IDocentesService DocenteService)
        {
            ServicioDeDocente = DocenteService;
        }
        // GET: api/<DocentesController>
        [HttpGet]
        public List<DocenteDto> Get()
        {
            List<Docente> ListaTodosLosDocentes = ServicioDeDocente.SeleccionarTodos();

            List<DocenteDto> ListaTodosLosDocenteDto = new();

            foreach (var DocentesSeleccionado in ListaTodosLosDocentes)
            {
                DocenteDto docenteDto = new();

                docenteDto.Identificacion = DocentesSeleccionado.Identificacion;
                docenteDto.Nombres = DocentesSeleccionado.Nombres;
                docenteDto.Apellidos = DocentesSeleccionado.Apellidos;
                docenteDto.Telefono = DocentesSeleccionado.Telefono;
                docenteDto.TelefonoSecundario = DocentesSeleccionado.TelefonoSecundario;
                docenteDto.Activo = DocentesSeleccionado.Activo;

             
                ListaTodosLosDocenteDto.Add(docenteDto);
            }
            return ListaTodosLosDocenteDto;
        }

        // GET api/<DocentesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(string id)
        {
            Docente DocenteSeleccionado = new();

            DocenteSeleccionado = ServicioDeDocente.SeleccionarPorId(id);

            if (DocenteSeleccionado.Identificacion == null)
            {
                return NotFound("Docente no encontrado");
            }

            DocenteDto docenteDto = new();

            docenteDto.Identificacion = DocenteSeleccionado.Identificacion;
            docenteDto.Nombres = DocenteSeleccionado.Nombres;
            docenteDto.Apellidos = DocenteSeleccionado.Apellidos;
            docenteDto.Telefono = DocenteSeleccionado.Telefono;
            docenteDto.TelefonoSecundario = DocenteSeleccionado.TelefonoSecundario;

            docenteDto.Activo = DocenteSeleccionado.Activo;

            return Ok(docenteDto);
        }

        // POST api/<DocentesController>
        [HttpPost]
        public IActionResult Post([FromBody] DocenteDto docenteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Docente DocentePorInsertar = new();

                    DocentePorInsertar.Identificacion = docenteDto.Identificacion;
                    DocentePorInsertar.Nombres = docenteDto.Nombres;
                    DocentePorInsertar.Apellidos = docenteDto.Apellidos;
                    DocentePorInsertar.Telefono = docenteDto.Telefono;
                    DocentePorInsertar.TelefonoSecundario = docenteDto.TelefonoSecundario;
                    DocentePorInsertar.CreadoPor = "diazgs";

                    ServicioDeDocente.Insertar(DocentePorInsertar);

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

        // PUT api/<DocentesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] DocenteDto docenteDto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Docente DocentePorActualizar = new();

                    DocentePorActualizar.Identificacion = id;
                    DocentePorActualizar.Nombres = docenteDto.Nombres;
                    DocentePorActualizar.Apellidos = docenteDto.Apellidos;
                    DocentePorActualizar.Telefono = docenteDto.Telefono;
                    DocentePorActualizar.TelefonoSecundario = docenteDto.TelefonoSecundario;
                    DocentePorActualizar.ModificadoPor = "diazgs";

                    ServicioDeDocente.Actualizar(DocentePorActualizar);

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

        // DELETE api/<DocentesController>/5
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
