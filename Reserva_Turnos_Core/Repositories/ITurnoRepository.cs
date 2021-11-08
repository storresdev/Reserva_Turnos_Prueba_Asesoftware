using Reserva_Turnos_Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Reserva_Turnos_Core.Repositories
{
    public interface ITurnoRepository
    {
        public Task<IEnumerable<Turno>> GetTurnosSP(Input input);
    }
}
