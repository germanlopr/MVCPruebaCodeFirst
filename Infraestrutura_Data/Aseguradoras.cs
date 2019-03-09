namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Aseguradoras
    {
        public Aseguradoras()
        {
            OrdenServicio = new HashSet<OrdenServicio>();
        }

        [Key]
        public long IdAseguradora { get; set; }

        [StringLength(8)]
        public string CodigoAseguradora { get; set; }

        [StringLength(120)]
        public string NombreAseguradora { get; set; }

        public virtual ICollection<OrdenServicio> OrdenServicio { get; set; }
    }
}
