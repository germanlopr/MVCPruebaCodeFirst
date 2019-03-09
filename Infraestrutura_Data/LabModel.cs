namespace Infraestrutura_Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class LabModel : DbContext
    {
        public LabModel()
            : base("name=LabCnx")
        {
        }

        public virtual DbSet<Areas> Areas { get; set; }
        public virtual DbSet<Aseguradoras> Aseguradoras { get; set; }
        public virtual DbSet<Examenes> Examenes { get; set; }
        public virtual DbSet<Facturas> Facturas { get; set; }
        public virtual DbSet<Laboratoristas> Laboratoristas { get; set; }
        public virtual DbSet<Medicos> Medicos { get; set; }
        public virtual DbSet<Muestras> Muestras { get; set; }
        public virtual DbSet<OrdenServicio> OrdenServicio { get; set; }
        public virtual DbSet<OrdenServicioDetalle> OrdenServicioDetalle { get; set; }
        public virtual DbSet<Pacientes> Pacientes { get; set; }
        public virtual DbSet<Pruebas> Pruebas { get; set; }
        public virtual DbSet<Resultados> Resultados { get; set; }
        public virtual DbSet<ResultadosDetalle> ResultadosDetalle { get; set; }
        public virtual DbSet<TipoMuestras> TipoMuestras { get; set; }
        public virtual DbSet<ValoresReferencia> ValoresReferencia { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Aseguradoras>()
                .Property(e => e.CodigoAseguradora)
                .IsUnicode(false);

            modelBuilder.Entity<Aseguradoras>()
                .Property(e => e.NombreAseguradora)
                .IsUnicode(false);

            modelBuilder.Entity<Examenes>()
                .Property(e => e.CodigoExamen)
                .IsUnicode(false);

            modelBuilder.Entity<Examenes>()
                .Property(e => e.NombreExamen)
                .IsUnicode(false);

            modelBuilder.Entity<Examenes>()
                .Property(e => e.SignificanciaClinica)
                .IsUnicode(false);

            modelBuilder.Entity<Examenes>()
                .Property(e => e.CodigoCUPS)
                .IsUnicode(false);

            modelBuilder.Entity<Laboratoristas>()
                .Property(e => e.NombreLaboratorista)
                .IsUnicode(false);

            modelBuilder.Entity<Laboratoristas>()
                .Property(e => e.Apellido)
                .IsUnicode(false);

            modelBuilder.Entity<Laboratoristas>()
                .Property(e => e.Clave)
                .IsUnicode(false);

            modelBuilder.Entity<Medicos>()
                .Property(e => e.CodMedico)
                .IsUnicode(false);

            modelBuilder.Entity<Medicos>()
                .Property(e => e.NombreMedico)
                .IsUnicode(false);

            modelBuilder.Entity<Medicos>()
                .Property(e => e.ApellidoMedico)
                .IsUnicode(false);

            modelBuilder.Entity<Medicos>()
                .Property(e => e.Especialidad)
                .IsUnicode(false);

            modelBuilder.Entity<OrdenServicio>()
                .Property(e => e.IngresoPor)
                .IsUnicode(false);

            modelBuilder.Entity<OrdenServicio>()
                .HasMany(e => e.Resultados)
                .WithOptional(e => e.OrdenServicio)
                .HasForeignKey(e => e.IdRegistro);

            modelBuilder.Entity<OrdenServicioDetalle>()
                .Property(e => e.EstadoMuestra)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.Nombres)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.PrimerApellido)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.SegundoApellido)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.Hclinica)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.FechaNacimiento)
                .IsUnicode(false);

            modelBuilder.Entity<Pacientes>()
                .Property(e => e.Direccion)
                .IsUnicode(false);

            modelBuilder.Entity<ResultadosDetalle>()
                .Property(e => e.ValorResultado)
                .IsUnicode(false);

            modelBuilder.Entity<TipoMuestras>()
                .Property(e => e.NombreTipoMuestra)
                .IsUnicode(false);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.LimiteInferiorEdad)
                .HasPrecision(10, 2);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.LimiteSuperiorEdad)
                .HasPrecision(10, 2);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.LimiteInferiorSexo)
                .HasPrecision(10, 2);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.LimiteSuperiorSexo)
                .HasPrecision(10, 2);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.unidad)
                .IsUnicode(false);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.TipoValor1)
                .IsUnicode(false);

            modelBuilder.Entity<ValoresReferencia>()
                .Property(e => e.TipoValor2)
                .IsUnicode(false);
        }
    }
}
