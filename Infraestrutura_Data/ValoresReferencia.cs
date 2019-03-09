namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ValoresReferencia")]
    public partial class ValoresReferencia
    {
        public ValoresReferencia()
        {
            Pruebas = new HashSet<Pruebas>();
        }

        [Key]
        public long IdValorReferencia { get; set; }

        public decimal? LimiteInferiorEdad { get; set; }

        public decimal? LimiteSuperiorEdad { get; set; }

        public decimal? LimiteInferiorSexo { get; set; }

        public decimal? LimiteSuperiorSexo { get; set; }

        [StringLength(20)]
        public string unidad { get; set; }

        [StringLength(20)]
        public string TipoValor1 { get; set; }

        [StringLength(20)]
        public string TipoValor2 { get; set; }

        public virtual ICollection<Pruebas> Pruebas { get; set; }
    }
}
