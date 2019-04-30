using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolManagementSystem.Controllers
{
    public class StuddentController : Controller
    {
        DB31Entities db = new DB31Entities();
        // GET: Studdent
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult StudentDetails()
        {
            RegisterViewModel loggedinuser = new RegisterViewModel();
            UserAccountViewModel user = new UserAccountViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();
            foreach(Student person in db.Students)
            {
                if(person1.Email == person.Email)
                {
                    loggedinuser.FirstName = person.FirstName;
                    loggedinuser.LastName = person.LastName;
                    loggedinuser.Address = person.Address;
                    loggedinuser.Gender = person.Gender;
                    loggedinuser.Contact = person.Contact;
                    loggedinuser.Guardian = person.Guardian;
                    loggedinuser.Email = person.Email;
                    loggedinuser.RegistrationNo = person.RegistrationNo;
                    loggedinuser.Password = person.Password;
                    user.listofusers.Add(loggedinuser);

                }
            }
            
            return View(user);

        }

        public ActionResult StudentFeeChallan()
        {
            AdminViewModel user = new AdminViewModel();
            user.listoffeechallans.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();


            List<string> classname = new List<string>();

            foreach (Student person in db.Students)
            {
                if (person1.Email == person.Email)
                {
                    foreach (StudentClass stdclass in db.StudentClasses)
                    {
                        if (person.StudentID == stdclass.StudentID)
                        {
                            classname.Add(stdclass.Class.ClassName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;


            return View(user);
        }

        [HttpPost]
        public ActionResult StudentFeeChallan(AdminViewModel collection)
        {
            AdminViewModel user = new AdminViewModel();

            foreach (FeeChallan f in db.FeeChallans)
            {
                if (f.Class.ClassName == collection.ClassName)
                {
                    user.listoffeechallans.Add(f);
                }

            }

            user.listoffeechallans.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();


            List<string> classname = new List<string>();

            foreach (Student person in db.Students)
            {
                if (person1.Email == person.Email)
                {
                    foreach (StudentClass stdclass in db.StudentClasses)
                    {
                        if (person.StudentID == stdclass.StudentID)
                        {
                            classname.Add(stdclass.Class.ClassName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;

            return View(user);

        }

        public ActionResult StudentTimetable()
        {
            AdminViewModel user = new AdminViewModel();
            user.listoftimetable.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();


            List<string> classname = new List<string>();
            List<string> sectionname = new List<string>();

            foreach (Student person in db.Students)
            {
                if (person1.Email == person.Email)
                {
                    foreach (StudentClass stdclass in db.StudentClasses)
                    {
                        if (person.StudentID == stdclass.StudentID)
                        {
                            classname.Add(stdclass.Class.ClassName);
                            sectionname.Add(stdclass.Section.SectionName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;


            return View(user);
        }

        [HttpPost]
        public ActionResult StudentTimetable(AdminViewModel collection)
        {
            AdminViewModel user = new AdminViewModel();

            foreach (Timetable t in db.Timetables)
            {
                if (t.Class.ClassName == collection.ClassName && t.Section.SectionName == collection.SectionName)
                {
                    user.listoftimetable.Add(t);
                }

            }

            user.listoftimetable.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();


            List<string> classname = new List<string>();
            List<string> sectionname = new List<string>();

            foreach (Student person in db.Students)
            {
                if (person1.Email == person.Email)
                {
                    foreach (StudentClass stdclass in db.StudentClasses)
                    {
                        if (person.StudentID == stdclass.StudentID)
                        {
                            classname.Add(stdclass.Class.ClassName);
                            sectionname.Add(stdclass.Section.SectionName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;



            return View(user);
        }


    }
}