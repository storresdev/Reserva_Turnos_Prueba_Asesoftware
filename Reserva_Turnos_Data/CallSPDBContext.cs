using Microsoft.EntityFrameworkCore;
using Reserva_Turnos_Core.Models;

namespace Reserva_Turnos_Data
{
    public class CallSPDBContext : DbContext
    {        
        public CallSPDBContext(DbContextOptions<CallSPDBContext> options) : base(options)
        {

        }
        public DbSet<Turno> Turnos { get; set; }
    }
}
