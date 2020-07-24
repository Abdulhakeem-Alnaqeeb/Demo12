using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo12.Models
{
    public class TourViewModel
    {
        public int TourId { get; set; }
        public int ProjectId { get; set; }
        public int ContractorId { get; set; }
        public int CityId { get; set; }
        public DateTime Date { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreateAt { get; set; }
        public string Notes { get; set; }
        public int ServiceId { get; set; }
        public int AchievedID { get; set; }
        public int AchievedRateID { get; set; }


    }
}