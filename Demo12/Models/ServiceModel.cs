namespace Demo12.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ServiceModel : DbContext
    {
        public ServiceModel()
            : base("name=ServiceModel")
        {
        }

        public virtual DbSet<AchievedRate> AchievedRates { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Conractor> Conractors { get; set; }
        public virtual DbSet<FieldTour> FieldTours { get; set; }
        public virtual DbSet<IsAchieved> IsAchieveds { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ServiceDetail> ServiceDetails { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<Worker> Workers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AchievedRate>()
                .Property(e => e.Rate)
                .IsFixedLength();

            modelBuilder.Entity<City>()
                .Property(e => e.CityName)
                .IsFixedLength();

            modelBuilder.Entity<City>()
                .HasMany(e => e.FieldTours)
                .WithOptional(e => e.CityName)
                .HasForeignKey(e => e.City);

            modelBuilder.Entity<Conractor>()
                .Property(e => e.ConractorSupervisor)
                .IsFixedLength();

            modelBuilder.Entity<Conractor>()
                .HasMany(e => e.FieldTours)
                .WithOptional(e => e.Conractor)
                .HasForeignKey(e => e.ContractorID);

            modelBuilder.Entity<Conractor>()
                .HasMany(e => e.Projects)
                .WithRequired(e => e.Conractor)
                .HasForeignKey(e => e.ContractorID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<IsAchieved>()
                .Property(e => e.Result)
                .IsFixedLength();

            modelBuilder.Entity<IsAchieved>()
                .HasMany(e => e.ServiceDetails)
                .WithOptional(e => e.IsAchieved)
                .HasForeignKey(e => e.AchievedID);

            modelBuilder.Entity<Project>()
                .Property(e => e.EngProjectName)
                .IsFixedLength();

            modelBuilder.Entity<Project>()
                .Property(e => e.IsActive)
                .IsFixedLength();

            modelBuilder.Entity<Service>()
                .Property(e => e.ServiceName)
                .IsFixedLength();

            modelBuilder.Entity<Worker>()
                .Property(e => e.Name)
                .IsFixedLength();

            //modelBuilder.Entity<Worker>()
            //    .HasMany(e => e.ServiceDetails)
            //    .WithOptional(e => e.Worker)
            //    .HasForeignKey(e => e.WorkID);
        }
    }
}
