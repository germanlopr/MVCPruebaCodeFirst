namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Examenes
    {
        public Examenes()
        {
            Muestras = new HashSet<Muestras>();
            Pruebas = new HashSet<Pruebas>();
            OrdenServicio = new HashSet<OrdenServicio>();
            Resultados = new HashSet<Resultados>();
        }

        [Key]
        public long IdExamen { get; set; }

        public long? IdArea { get; set; }

        [StringLength(15)]
        public string CodigoExamen { get; set; }

        [StringLength(94)]
        public string NombreExamen { get; set; }

        public int? NivelAtencion { get; set; }

        [StringLength(30)]
        public string SignificanciaClinica { get; set; }

        public decimal? PrecioExamen { get; set; }

        [StringLength(20)]
        public string CodigoCUPS { get; set; }

        public virtual Areas Areas { get; set; }

        public virtual ICollection<Muestras> Muestras { get; set; }

        public virtual ICollection<Pruebas> Pruebas { get; set; }

        public virtual ICollection<OrdenServicio> OrdenServicio { get; set; }

        public virtual ICollection<Resultados> Resultados { get; set; }
    }
}
