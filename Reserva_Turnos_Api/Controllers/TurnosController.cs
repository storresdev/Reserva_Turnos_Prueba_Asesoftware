using Microsoft.AspNetCore.Mvc;
using Reserva_Turnos_Core.Models;
using Reserva_Turnos_Core.Repositories;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Reserva_Turnos_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TurnosController : ControllerBase
    {
        private readonly ITurnoRepository _turnoRepository;

        public TurnosController(ITurnoRepository turnoRepository)
        {
            _turnoRepository = turnoRepository;
        }

        [HttpPost]
        public async Task<ActionResult<IEnumerable<Turno>>> GetTurnos(Input input)
        {
            var turnos = await _turnoRepository.GetTurnosSP(input);
            return Ok(turnos);
        }
    }
}
