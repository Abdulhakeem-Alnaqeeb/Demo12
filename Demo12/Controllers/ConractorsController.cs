using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Demo12.Models;

namespace Demo12.Controllers
{
    public class ConractorsController : Controller
    {
        private ServiceModel db = new ServiceModel();

        // GET: Conractors
        public ActionResult Index()
        {
            return View(db.Conractors.ToList());
        }

        // GET: Conractors/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conractor conractor = db.Conractors.Find(id);
            if (conractor == null)
            {
                return HttpNotFound();
            }
            return View(conractor);
        }

        // GET: Conractors/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Conractors/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CotractorID,ContractorName,ConractorSupervisor")] Conractor conractor)
        {
            if (ModelState.IsValid)
            {
                db.Conractors.Add(conractor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(conractor);
        }

        // GET: Conractors/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conractor conractor = db.Conractors.Find(id);
            if (conractor == null)
            {
                return HttpNotFound();
            }
            return View(conractor);
        }

        // POST: Conractors/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CotractorID,ContractorName,ConractorSupervisor")] Conractor conractor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(conractor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(conractor);
        }

        // GET: Conractors/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Conractor conractor = db.Conractors.Find(id);
            if (conractor == null)
            {
                return HttpNotFound();
            }
            return View(conractor);
        }

        // POST: Conractors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Conractor conractor = db.Conractors.Find(id);
            db.Conractors.Remove(conractor);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
