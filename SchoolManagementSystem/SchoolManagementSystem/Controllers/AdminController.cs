using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolManagementSystem.Controllers
{
    
    public class AdminController : Controller
    {
        DB31Entities1 db = new DB31Entities1();
        // GET: Admin
        public ActionResult Index()
        {
            ViewBag.student_count = db.Students.ToList().Count;
            ViewBag.teacher_count = db.Teachers.ToList().Count;
            return View();
        }

        public ActionResult Studentlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Student s in db.Students)
            {
                user.listofstudents.Add(s);
                
            }
            return View(user);
        }

        public ActionResult Teacherlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Teacher t in db.Teachers)
            {
                user.listofteachers.Add(t);

            }
            return View(user);
        }

        [HttpPost]
        public ActionResult AddSections(SectionViewModel collection)
        {

            try
            {

                Section p = new Section();

                p.SectionName = collection.SectionName;
                if (p.SectionName != null)
                {
                    db.Sections.Add(p);

                    db.SaveChanges();

                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    return View();
                }
            }
            catch
            {
                return View();
            }

        }

        public ActionResult DeleteT(string id)
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult DeleteT(string id, FormCollection collection)
        {
            try
            {
                var item = db.Teachers.Where(x => x.TeacherID.ToString() == id).SingleOrDefault();
                string e = item.Email;
                db.Teachers.Remove(item);
                var item1 = db.AspNetUsers.Where(x => x.Email == e).SingleOrDefault();
                db.AspNetUsers.Remove(item1);
                db.SaveChanges();

                return RedirectToAction("Teacherlist");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult DeleteS(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult DeleteS(string id, FormCollection collection)
        {
            try
            {
                var item = db.Students.Where(x => x.StudentID.ToString() == id).SingleOrDefault();
                string e = item.Email;
                db.Students.Remove(item);
                var item1 = db.AspNetUsers.Where(x => x.Email == e).SingleOrDefault();
                db.AspNetUsers.Remove(item1);
                db.SaveChanges();

                return RedirectToAction("Studentlist");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditS(string id)
        {
            RegisterViewModel collection = new RegisterViewModel();
            var p = db.Students.Where(x => x.StudentID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            collection.FirstName = p.FirstName;
            collection.LastName = p.LastName;
            collection.Address = p.Address;
            collection.Contact = p.Contact;
            collection.Email = p.Email;
            collection.RegistrationNo = p.RegistrationNo;
            collection.Guardian = p.Guardian;
            return View(collection);
            
        }

        [HttpPost]
        public ActionResult EditS(RegisterViewModel collection,string id)
        {
            try
            {
                var p = db.Students.Where(x => x.StudentID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
                var p1 = db.AspNetUsers.Where(x => x.Email == p.Email).First();
                p1.Email = collection.Email;
                p1.UserName = collection.Email;
                p.FirstName = collection.FirstName;
                p.LastName = collection.LastName;
                p.Email = collection.Email;
                p.Address = collection.Address;
                p.Guardian = collection.Guardian;
                p.RegistrationNo = collection.RegistrationNo;
                p.Contact = collection.Contact;
                db.SaveChanges();

                return RedirectToAction("Studentlist", "Admin");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult EditT(string id)
        {
            RegisterViewModel collection = new RegisterViewModel();
            var p = db.Teachers.Where(x => x.TeacherID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            collection.FirstName = p.FirstName;
            collection.LastName = p.LastName;
            collection.Address = p.Address;
            collection.Contact = p.Contact;
            collection.Email = p.Email;
            return View(collection);


        }

        [HttpPost]
        public ActionResult EditT(RegisterViewModel collection, string id)
        {
            try
            {
                var p = db.Teachers.Where(x => x.TeacherID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
                var p1 = db.AspNetUsers.Where(x => x.Email == p.Email).First();
                
                p1.Email = collection.Email;
                p1.UserName = collection.Email;
                p.FirstName = collection.FirstName;
                p.LastName = collection.LastName;
                p.Email = collection.Email;
                p.Address = collection.Address;
                p.Contact = collection.Contact;
                
                db.SaveChanges();

                return RedirectToAction("Teacherlist", "Admin");
            }
            catch
            {
                return View();
             }
            }


    }


}