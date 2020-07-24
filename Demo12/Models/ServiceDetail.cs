namespace Demo12.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceDetail
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? ServiceID { get; set; }

        public int? AchievedID { get; set; }

        public int? AchievedRateID { get; set; }

        public int? TourID { get; set; }

        public virtual AchievedRate AchievedRate { get; set; }

        public virtual IsAchieved IsAchieved { get; set; }

        public virtual Service Service { get; set; }

        public virtual FieldTour FieldTour { get; set; }
    }
}
