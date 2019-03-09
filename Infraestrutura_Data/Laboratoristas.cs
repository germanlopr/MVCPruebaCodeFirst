namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Laboratoristas
    {
        public Laboratoristas()
        {
            Resultados = new HashSet<Resultados>();
        }

        [Key]
        public long IdLaboratorista { get; set; }

        [StringLength(10)]
        public string NombreLaboratorista { get; set; }

        [StringLength(8)]
        public string Apellido { get; set; }

        public int? NroRegistro { get; set; }

        [StringLength(7)]
        public string Clave { get; set; }

        public virtual ICollection<Resultados> Resultados { get; set; }
    }
}
