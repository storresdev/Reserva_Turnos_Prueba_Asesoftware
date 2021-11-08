using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Reserva_Turnos_Core.Models;
using Reserva_Turnos_Core.Repositories;
using Reserva_Turnos_Data;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Reserva_Turnos_Services
{
    public class TurnosService : ITurnoRepository
    {
        private readonly CallSPDBContext _callSPDBContext;
        public TurnosService(CallSPDBContext callSPDB)
        {
            _callSPDBContext = callSPDB;
        }

        public async Task<IEnumerable<Turno>> GetTurnosSP(Input input)
        {
            try
            {
                var parameter = new List<SqlParameter>
                {
                    new SqlParameter("@fecha_inicio", input.FechaInicio),
                    new SqlParameter("@fecha_fin", input.FechaFin),
                    new SqlParameter("@id_servicio", input.IdServicio)
                };

                return await Task.Run(() => _callSPDBContext.Turnos.FromSqlRaw(@"exec sp_genera_turnos_diarios @fecha_inicio, @fecha_fin, @id_servicio", parameter.ToArray()).ToListAsync());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
}
