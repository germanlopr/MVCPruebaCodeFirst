namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ResultadosDetalle")]
    public partial class ResultadosDetalle
    {
        [Key]
        public long IdResultadoDetalle { get; set; }

        public long? IdResultado { get; set; }

        public long? IdExamen { get; set; }

        public long? IdPrueba { get; set; }

        public long? IdValorReferencia { get; set; }

        [StringLength(15)]
        public string ValorResultado { get; set; }

        public virtual Resultados Resultados { get; set; }
    }
}
