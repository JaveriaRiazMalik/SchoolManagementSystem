using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Views.Admin;
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
            ViewBag.subject_count = db.Subjects.ToList().Count;
            ViewBag.section_count = db.Sections.ToList().Count;
            ViewBag.class_count = db.Classes.ToList().Count;
            ViewBag.payroll_count = db.Payrolls.ToList().Count;
            ViewBag.feechallan_count = db.FeeChallans.ToList().Count;

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

        public ActionResult Subjectlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Subject t in db.Subjects)
            {
                user.listofsubjects.Add(t);

            }
            return View(user);
        }

        public ActionResult Sectionlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Section t in db.Sections)
            {
                user.listofsections.Add(t);

            }
            return View(user);
        }

        public ActionResult Classlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Class t in db.Classes)
            {
                user.listofclasses.Add(t);

            }
            return View(user);
        }

        public ActionResult Payrolllist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Payroll t in db.Payrolls)
            {
                user.listofpayrolls.Add(t);

            }
            return View(user);
        }

        public ActionResult AddSections()
        {
            return View();
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


        public ActionResult AddSubjects()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddSubjects(SubjectViewModel collection)
        {

            try
            {

                Subject p = new Subject();

                p.SubjectName = collection.SubjectName;
                if (p.SubjectName != null)
                {
                    db.Subjects.Add(p);

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

        public ActionResult AddClasses()
        {
            List<int> teachername = new List<int>();
            List<string> sectionname = new List<string>();
            List<string> subjectname = new List<string>();

            foreach (Teacher t in db.Teachers)
            {
                    teachername.Add(t.TeacherID);


            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }
            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);

                
            }

            ViewBag.teachername = teachername;
           ViewBag.sectionname = sectionname;
           ViewBag.subjectname = subjectname;

            return View();
        }

        [HttpPost]
        public ActionResult AddClasses(ClassViewModel collection)
        {

            try
            {

                Class c = new Class();

                c.ClassName = collection.ClassName;
                c.TeacherID = collection.TeacherID;
                foreach (Section s in db.Sections)
                {
                    if (s.SectionName == collection.SectionName)
                    {
                        c.SectionID = s.SectionID;
                    }
                }

                foreach (Subject su in db.Subjects)
                {
                    if (su.SubjectName == collection.SubjectName)
                    {
                        c.SubjectID = su.SubjectID;
                    }
                }

                if (c.ClassName != null)
                {
                    db.Classes.Add(c);

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

        public ActionResult AddPayroll()
        {
            List<int> name = new List<int>(); 

            foreach (Teacher t in db.Teachers)
            {
                name.Add(t.TeacherID);


            }

            ViewBag.name = name;
            return View();
        }

        [HttpPost]
        public ActionResult AddPayroll(PayrollViewModel collection)
        {

            try
            {

                Payroll p = new Payroll();

                p.TeacherID = collection.TeacherID;
                p.Designation = collection.Designation;
                p.Pay = collection.Pay;
                if (p.TeacherID != 0 && p.Designation != null && p.Pay != 0)
                {
                    db.Payrolls.Add(p);

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

        //public ActionResult AddFeechallan()
        //{
        //    List<int> name = new List<int>();

        //    foreach (Te t in db.Teachers)
        //    {
        //        name.Add(t.TeacherID);


        //    }

        //    ViewBag.name = name;
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult Add(PayrollViewModel collection)
        //{

        //    try
        //    {

        //        Payroll p = new Payroll();

        //        p.TeacherID = collection.TeacherID;
        //        p.Designation = collection.Designation;
        //        p.Pay = collection.Pay;
        //        if (p.TeacherID != 0 && p.Designation != null && p.Pay != 0)
        //        {
        //            db.Payrolls.Add(p);

        //            db.SaveChanges();

        //            return RedirectToAction("Index", "Admin");
        //        }
        //        else
        //        {
        //            return View();
        //        }
        //    }
        //    catch
        //    {
        //        return View();
        //    }

        //}




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