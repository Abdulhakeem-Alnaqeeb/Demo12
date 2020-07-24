using Demo12.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Demo12.Controllers
{
    public class ReportController : Controller

    {
        ServiceModel db = new ServiceModel();
        // GET: Service
        public ActionResult Index()
        {
            var viewModel = new ServiceViewModel();
            viewModel.projects = db.Projects.ToList();
            viewModel.Cities = db.Cities.ToList();
            viewModel.conractors = db.Conractors.ToList();
            viewModel.Date = DateTime.Now;
            viewModel.Services = db.Services.ToList();
            viewModel.AchievedRate = db.AchievedRates.ToList();
            viewModel.IsAchieved = db.IsAchieveds.ToList();
            viewModel.workers = db.Workers.ToList();

           // ViewBag.city = new SelectList(db.Cities, "CityID", "CityName");
            


            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Index (FieldTour fieldTour,ServiceDetail serviceDetail)
        {
            db.FieldTours.Add(fieldTour);
            db.SaveChanges();

            db.ServiceDetails.Add(serviceDetail);
            db.SaveChanges();


            return View();

        }

        public ActionResult admin ()
        {
            var viewModel = new ServiceViewModel();
           viewModel.projects = db.Projects.ToList();
            viewModel.Cities = db.Cities.ToList();
            viewModel.conractors = db.Conractors.ToList();
            viewModel.Date = DateTime.Now;
            viewModel.Services = db.Services.ToList();
            viewModel.AchievedRate = db.AchievedRates.ToList();
            viewModel.IsAchieved = db.IsAchieveds.ToList();
            viewModel.workers = db.Workers.ToList();
            return View(viewModel);
    }

    }
}
