using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Reserva_Turnos_Core.Models
{
    public class Turno
    {
        [Key]
        public int Id_servicio { get; set; }

        [DataType(DataType.Date)]
        [Column(TypeName = "Date")]
        public DateTime Fecha_turno { get; set; }

        public DateTime Hora_inicio { get; set; }

        public DateTime Hora_fin { get; set; }
        
        public bool Estado { get; set; }
    }
}
