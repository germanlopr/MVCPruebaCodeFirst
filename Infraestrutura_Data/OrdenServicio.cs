namespace Infraestrutura_Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrdenServicio")]
    public partial class OrdenServicio
    {
        public OrdenServicio()
        {
            Facturas = new HashSet<Facturas>();
            Resultados = new HashSet<Resultados>();
            OrdenServicioDetalle = new HashSet<OrdenServicioDetalle>();
        }

        [Key]
        public long IdOrdenServicio { get; set; }

        public long? IdPaciente { get; set; }

        public long? IdAseguradora { get; set; }

        public long? IdExamen { get; set; }

        public int? NroRegistro { get; set; }

        [StringLength(16)]
        public string IngresoPor { get; set; }

        public int? IdMedico { get; set; }

        public DateTime? FechaEntrega { get; set; }

        public DateTime? FechaRecepcion { get; set; }

        public virtual Aseguradoras Aseguradoras { get; set; }

        public virtual Examenes Examenes { get; set; }

        public virtual ICollection<Facturas> Facturas { get; set; }

        public virtual Pacientes Pacientes { get; set; }

        public virtual ICollection<Resultados> Resultados { get; set; }

        public virtual ICollection<OrdenServicioDetalle> OrdenServicioDetalle { get; set; }
    }
}
