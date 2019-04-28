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

        public ActionResult Feechallanlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (FeeChallan t in db.FeeChallans)
            {
                user.listoffeechallans.Add(t);

            }
            return View(user);
        }

        public ActionResult DeleteSubject(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult DeleteSubject(string id, FormCollection collection)
        {
            try
            {
                var item = db.Subjects.Where(x => x.SubjectID.ToString() == id).SingleOrDefault();
                db.Subjects.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Subjectlist");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditSubject(string id)
        {
            SubjectViewModel collection = new SubjectViewModel();
            var p = db.Subjects.Where(x => x.SubjectID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.SubjectName = p.SubjectName;
            return View(collection);

        }

        [HttpPost]
        public ActionResult EditSubject(SubjectViewModel collection, string id)
        {
            try
            {
                var p = db.Subjects.Where(x => x.SubjectID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
                p.SubjectName = collection.SubjectName;
                db.SaveChanges();

                return RedirectToAction("Subjectlist", "Admin");
            }
            catch
            {
                return View();
            }
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


        public ActionResult EditSection(string id)
        {
            SectionViewModel collection = new SectionViewModel();
            var p = db.Sections.Where(x => x.SectionID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            collection.SectionName = p.SectionName;
            return View(collection);

        }

        [HttpPost]
        public ActionResult EditSection(SectionViewModel collection, string id)
        {
            try
            {
                var p = db.Sections.Where(x => x.SectionID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
                p.SectionName = collection.SectionName;
                db.SaveChanges();

                return RedirectToAction("Sectionlist", "Admin");
            }
            catch
            {
                return View();
            }
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

        public ActionResult Payrollist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Payroll t in db.Payrolls)
            {
                user.listofpayrolls.Add(t);

            }
            return View(user);
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
            List<string> teachername = new List<string>();
            List<string> sectionname = new List<string>();
            List<string> subjectname = new List<string>();

            foreach (Teacher t in db.Teachers)
            {
                teachername.Add(t.FirstName);
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
                foreach (Teacher sT in db.Teachers)
                {
                    if (sT.FirstName == collection.TeacherName)
                    {
                        c.TeacherID = sT.TeacherID;
                    }
                }

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
                    List<string> teachername = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> subjectname = new List<string>();

                    foreach (Teacher t in db.Teachers)
                    {
                        teachername.Add(t.FirstName);
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
            }
            catch
            {
                return View();
            }

        }

        public ActionResult AssignClass()
        {
            List<string> studentname = new List<string>();
            List<string> sectionname = new List<string>();
            List<string> classname = new List<string>();

            foreach (Student t in db.Students)
            {
                studentname.Add(t.RegistrationNo);
            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }
            foreach (Class su in db.Classes)
            {
                classname.Add(su.ClassName);


            }

            ViewBag.studentname = studentname;
            ViewBag.sectionname = sectionname;
            ViewBag.classname = classname;

            return View();
        }

        [HttpPost]
        public ActionResult AssignClass(StudentClassViewModel collection)
        {

            try
            {
                StudentClass c = new StudentClass();

               
                foreach ( Student s in db.Students)
                {
                    if (s.RegistrationNo == collection.RegistrationNo)
                    {
                        c.StudentID = s.StudentID;
                    }
                }

                foreach (Section se in db.Sections)
                {
                    if (se.SectionName == collection.SectionName)
                    {
                        c.SectionID = se.SectionID;
                    }
                }

                foreach (Class cl in db.Classes)
                {
                    if (cl.ClassName == collection.ClassName)
                    {
                         c.ClassID = cl.ClassID;
                    }
                }

                if (c.ClassID != 0 && c.StudentID != 0 && c.SectionID != 0)
                {
                    db.StudentClasses.Add(c);

                    db.SaveChanges();

                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    List<string> studentname = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> classname = new List<string>();

                    foreach (Student t in db.Students)
                    {
                        studentname.Add(t.RegistrationNo);
                    }
                    foreach (Section s in db.Sections)
                    {
                        sectionname.Add(s.SectionName);


                    }
                    foreach (Class su in db.Classes)
                    {
                        classname.Add(su.ClassName);


                    }

                    ViewBag.studentname = studentname;
                    ViewBag.sectionname = sectionname;
                    ViewBag.classname = classname;

                    return View();
                }
            }
            catch
            {
                return View();
            }

        }




        public ActionResult DeleteClass(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult DeleteClass(string id, FormCollection collection)
        {
            try
            {
                var item = db.Classes.Where(x => x.ClassID.ToString() == id).SingleOrDefault();
                db.Classes.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Classlist");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult EditClass(string id)
        {
            List<string> teachername = new List<string>();
            List<string> sectionname = new List<string>();
            List<string> subjectname = new List<string>();

            foreach (Teacher t in db.Teachers)
            {
                teachername.Add(t.FirstName);
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

            ClassViewModel collection = new ClassViewModel();
            var p = db.Classes.Where(x => x.ClassID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.ClassName = p.ClassName;
            return View(collection);

        }

        [HttpPost]
        public ActionResult EditClass(ClassViewModel collection, string id)
        {
            try
            {
                var p = db.Classes.Where(x => x.ClassID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
                p.ClassName = collection.ClassName;
                foreach (Teacher sT in db.Teachers)
                {
                    if (sT.FirstName == collection.TeacherName)
                    {
                        p.TeacherID = sT.TeacherID;
                    }
                }

                foreach (Section s in db.Sections)
                {
                    if (s.SectionName == collection.SectionName)
                    {
                        p.SectionID = s.SectionID;
                    }
                }

                foreach (Subject su in db.Subjects)
                {
                    if (su.SubjectName == collection.SubjectName)
                    {
                        p.SubjectID = su.SubjectID;
                    }
                }

                if (p.ClassName != null)
                {
                    db.SaveChanges();

                    return RedirectToAction("Classlist", "Admin");
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


        public ActionResult EditPayroll(string id)
        {
            List<int> name = new List<int>();

            foreach (Teacher t in db.Teachers)
            {
                name.Add(t.TeacherID);


            }

            ViewBag.name = name;

            PayrollViewModel collection = new PayrollViewModel();
            var p = db.Payrolls.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.Designation = p.Designation;
            collection.Pay =Convert.ToInt32( p.Pay);
            return View(collection);

        }

        [HttpPost]
        public ActionResult EditPayroll(PayrollViewModel collection, string id)
        {
            try
            {
                var p = db.Payrolls.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

                p.TeacherID = collection.TeacherID;
                p.Designation = collection.Designation;
                p.Pay = collection.Pay;
                if (p.TeacherID != 0 && p.Designation != null && p.Pay != 0)
                {
                    db.SaveChanges();
                    return RedirectToAction("Payrollist", "Admin");
                }
                else
                {
                    List<int> name = new List<int>();

                    foreach (Teacher t in db.Teachers)
                    {
                        name.Add(t.TeacherID);


                    }

                    ViewBag.name = name;

                    return View();

                }
            }
            catch
            {
                return View();
            }
        }




        public ActionResult DeletePayroll(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult DeletePayroll(string id, FormCollection collection)
        {
            try
            {
                var item = db.Payrolls.Where(x => x.Id.ToString() == id).SingleOrDefault();
                
                db.Payrolls.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Payrollist");
            }
            catch
            {
                return View();
            }
        }


        public ActionResult AddFeechallan()
        {
            List<string> name = new List<string>();

            foreach (Class t in db.Classes)
            {
                name.Add(t.ClassName);


            }

            ViewBag.name = name;
            return View();
        }

        [HttpPost]
        public ActionResult AddFeechallan(FeechallanViewModel collection)
        {

            try
            {

                FeeChallan p = new FeeChallan();

                p.IssueDate = collection.IssueDate;
                p.Fee = collection.Fee;
                p.IssueDate = DateTime.Now;

                foreach (Class c in db.Classes)
                {
                    if (c.ClassName == collection.ClassName)
                    {
                        p.ClassID = c.ClassID;
                    }
                }
                if (p.ClassID != 0 && p.Fee != 0)
                {
                    db.FeeChallans.Add(p);

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