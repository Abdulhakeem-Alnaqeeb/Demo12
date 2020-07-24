using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo12.Models
{
    public class ServiceViewModel
    {


        
       
        public List<Project> projects { get; set; }
        public List<City> Cities { get; set; }
        public List<Conractor> conractors { get; set; }
        public List<Service> Services { get; set; }
        public List<Worker> workers { get; set; }
        public List<AchievedRate> AchievedRate { get; set; }
        public List<IsAchieved> IsAchieved { get; set; }


        public DateTime Date { get; set; }

    }
}