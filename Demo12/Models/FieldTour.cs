namespace Demo12.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FieldTour")]
    public partial class FieldTour
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? ProjectID { get; set; }

        public int? ContractorID { get; set; }


        public int? City { get; set; }

        public DateTime? Date { get; set; }

        [StringLength(100)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedAt { get; set; }

        public string Notes { get; set; }

        public virtual City CityName { get; set; }

        public virtual Conractor Conractor { get; set; }

        public virtual Project Project { get; set; }

    }
}
