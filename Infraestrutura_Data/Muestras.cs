namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Muestras
    {
        [Key]
        public long IdMuestra { get; set; }

        public long? IdExamen { get; set; }

        public long? IdTipoMuestra { get; set; }

        public virtual Examenes Examenes { get; set; }

        public virtual TipoMuestras TipoMuestras { get; set; }
    }
}
