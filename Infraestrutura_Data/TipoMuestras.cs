namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class TipoMuestras
    {
        public TipoMuestras()
        {
            Muestras = new HashSet<Muestras>();
        }

        [Key]
        public long IdTipoMuestra { get; set; }

        [StringLength(40)]
        public string NombreTipoMuestra { get; set; }

        public virtual ICollection<Muestras> Muestras { get; set; }
    }
}
