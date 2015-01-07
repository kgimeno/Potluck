using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Potluck.Models;

namespace Potluck.Controllers
{
    public class EventController : ApiController
    {
        private PotluckContext db = new PotluckContext();

        // GET api/Event
        public IEnumerable<Event> GetEvents()
        {
            return db.Events.AsEnumerable();
        }

        // GET api/Event/5
        public Event GetEvent(int id)
        {
            Event anEvent = db.Events.Find(id);
            if (anEvent == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return anEvent;
        }

        // PUT api/Event/5
        public HttpResponseMessage PutEvent(int id, Event anEvent)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }

            if (id != anEvent.eventId)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

            db.Entry(anEvent).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK);
        }

        // POST api/Event
        public HttpResponseMessage PostEvent(Event anEvent)
        {
            if (ModelState.IsValid)
            {
                db.Events.Add(anEvent);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, anEvent);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = anEvent.eventId }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        // DELETE api/Event/5
        public HttpResponseMessage DeleteEvent(int id)
        {
            //Menu menu = new Menu();             // NEW
            //int numOfMenuItems = 0;             // NEW
            Event anEvent = db.Events.Find(id);
            if (anEvent == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            //menu.Event_eventId = id;            // NEW
            //while (anEvent < 6)                       // NEW
            //{                                   // NEW
            //    db.Menus.Remove(menu);          // NEW
            //}                                   // NEW

            db.Events.Remove(anEvent);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
            }

            return Request.CreateResponse(HttpStatusCode.OK, anEvent);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}