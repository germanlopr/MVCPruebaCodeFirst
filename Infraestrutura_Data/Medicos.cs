namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Medicos
    {
        public Medicos()
        {
            Pacientes = new HashSet<Pacientes>();
        }

        [Key]
        public long IdMedico { get; set; }

        [StringLength(12)]
        public string CodMedico { get; set; }

        [StringLength(20)]
        public string NombreMedico { get; set; }

        [StringLength(20)]
        public string ApellidoMedico { get; set; }

        [StringLength(14)]
        public string Especialidad { get; set; }

        public virtual ICollection<Pacientes> Pacientes { get; set; }
    }
}
