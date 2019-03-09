namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Pacientes
    {
        public Pacientes()
        {
            OrdenServicio = new HashSet<OrdenServicio>();
        }

        [Key]
        public long IdPaciente { get; set; }

        public long? IdMedico { get; set; }

        public long? IdExamen { get; set; }

        public int? NroIdentificacionPaciente { get; set; }

        [StringLength(12)]
        public string Nombres { get; set; }

        [StringLength(7)]
        public string PrimerApellido { get; set; }

        [StringLength(7)]
        public string SegundoApellido { get; set; }

        public int? Sexo { get; set; }

        [StringLength(9)]
        public string Hclinica { get; set; }

        [StringLength(19)]
        public string FechaNacimiento { get; set; }

        public int? Edad { get; set; }

        [StringLength(21)]
        public string Direccion { get; set; }

        public int? Telefono { get; set; }

        public virtual Medicos Medicos { get; set; }

        public virtual ICollection<OrdenServicio> OrdenServicio { get; set; }
    }
}
