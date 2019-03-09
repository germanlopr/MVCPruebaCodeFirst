namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Facturas
    {
        [Key]
        public long IdFactura { get; set; }

        [StringLength(30)]
        public string NroFactura { get; set; }

        public decimal? Pago { get; set; }

        public long? IdOrdenServicio { get; set; }

        public virtual OrdenServicio OrdenServicio { get; set; }
    }
}
