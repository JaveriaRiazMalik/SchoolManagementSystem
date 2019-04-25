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
        DB31Entities db = new DB31Entities();
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
    }

    
}