namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Pruebas
    {
        [Key]
        public long IdPrueba { get; set; }

        public long? IdExamen { get; set; }

        [StringLength(50)]
        public string NombrePrueba { get; set; }

        public long? IdValorReferencia { get; set; }

        public virtual Examenes Examenes { get; set; }

        public virtual ValoresReferencia ValoresReferencia { get; set; }
    }
}
