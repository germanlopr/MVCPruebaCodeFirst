namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Areas
    {
        public Areas()
        {
            Examenes = new HashSet<Examenes>();
        }

        [Key]
        public long IdArea { get; set; }

        [StringLength(4)]
        public string CodigoArea { get; set; }

        [StringLength(50)]
        public string NombreAreas { get; set; }

        public int? Categoria { get; set; }

        public int? SubCategoria { get; set; }

        public virtual ICollection<Examenes> Examenes { get; set; }
    }
}
