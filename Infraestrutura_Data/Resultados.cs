namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Resultados
    {
        public Resultados()
        {
            ResultadosDetalle = new HashSet<ResultadosDetalle>();
        }

        [Key]
        public long IdResultado { get; set; }

        public long? IdRegistro { get; set; }

        public long? IdLaboratorista { get; set; }

        public long? IdExamen { get; set; }

        public virtual Examenes Examenes { get; set; }

        public virtual Laboratoristas Laboratoristas { get; set; }

        public virtual OrdenServicio OrdenServicio { get; set; }

        public virtual ICollection<ResultadosDetalle> ResultadosDetalle { get; set; }
    }
}
