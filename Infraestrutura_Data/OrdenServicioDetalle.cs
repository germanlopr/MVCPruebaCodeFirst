namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrdenServicioDetalle")]
    public partial class OrdenServicioDetalle
    {
        [Key]
        public long IdOrdenServicioDetalle { get; set; }

        public long? IdOrdenServicio { get; set; }

        public long? IdExamen { get; set; }

        public string EstadoMuestra { get; set; }

        public virtual OrdenServicio OrdenServicio { get; set; }
    }
}
