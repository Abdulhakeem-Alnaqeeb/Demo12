namespace Demo12.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Project
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            FieldTours = new HashSet<FieldTour>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProjectID { get; set; }

        [Required]
        [StringLength(255)]
        public string ARProjectName { get; set; }

        [Required]
        [StringLength(255)]
        public string EngProjectName { get; set; }

        [StringLength(10)]
        public string IsActive { get; set; }

        public int ContractorID { get; set; }

        public virtual Conractor Conractor { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FieldTour> FieldTours { get; set; }
    }
}
