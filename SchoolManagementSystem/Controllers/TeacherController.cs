using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolManagementSystem.Controllers
{
    public class TeacherController : Controller
    {
       
        DB31Entities db = new DB31Entities();
        AdminViewModel y = new AdminViewModel();
        // GET: Teacher
        public ActionResult Index()
        {
            return View();
        }
        public void comboreload()
        {

            List<string> Sectionname = new List<string>();
            List<string> ClassName = new List<string>();

            string id = User.Identity.GetUserId();
            var p = db.AspNetUsers.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            string email = p.Email;
            var p1 = db.Teachers.Where(x => x.Email == email).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            foreach (Class t in db.Classes)
            {
                if (t.TeacherID == p1.TeacherID)
                {
                    Sectionname.Add(t.Section.SectionName);
                    ClassName.Add(t.ClassName);
                }
            }

            ViewBag.ClassName = ClassName;
            ViewBag.Sectionname = Sectionname.Distinct();

        }
        public ActionResult checkAttendanceDate()
        {
            bool flag = false;
            foreach (ClassAttendance i in db.ClassAttendances)
            {
                if (i.AttendanceDate == DateTime.Now.Date)
                {
                    flag = true;
                }
            }
            if (flag == false)
            {
                return TakeAttendance();
            }
            else
            {
                TempData["msg"] = "<script>alert('You have already taken Student Attendance for today.');</script>";
                return RedirectToAction("Index", "Teacher");
            }
        }
        public ActionResult TakeAttendance()
        {
            comboreload();
            UserAccountViewModel userL = new UserAccountViewModel();
            return View(userL);
        }
        [HttpPost]
        public ActionResult TakeAttendance(ClassViewModel collection)
        {

            string id = User.Identity.GetUserId();
            var p = db.AspNetUsers.Where(x1 => x1.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            string email = p.Email;
            var p1 = db.Teachers.Where(x1 => x1.Email == email).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            y.ClassName = collection.ClassName;
            y.SectionName = collection.SectionName;
            UserAccountViewModel userL = new UserAccountViewModel();
            var list = db.StudentClasses.ToList();

            foreach (var i in list)
            {
                if (i.Class.ClassName == collection.ClassName && i.Section.SectionName == collection.SectionName)
                {
                    RegisterViewModel v = new RegisterViewModel();
                    v.Id = i.Student.StudentID;
                    v.FirstName = i.Student.FirstName;
                    v.LastName = i.Student.LastName;
                    v.Gender = i.Student.Gender;
                    v.RegistrationNo = i.Student.RegistrationNo;
                    userL.listofusers.Add(v);
                }
            }
            comboreload();
            return View(userL);

        }


        public ActionResult MarkAttendance2(string id)
        {

            bool j = true;
            foreach (StudentAttendance i in db.StudentAttendances)
            {
                if (i.StudentID == Convert.ToInt32(id) && i.ClassAttendance.AttendanceDate.Date == DateTime.Now.Date)
                {
                    j = false;
                }
            }
            if (j == false)
            {
                ModelState.AddModelError("", "unable to save changes");

            }
            else
            {
                StudentAttendance u = new StudentAttendance();
                ClassAttendance v = new ClassAttendance();
                u.StudentID = Convert.ToInt32(id);
                u.AttendanceStatus = "Present";
                v.AttendanceDate = DateTime.Now.Date;
                db.StudentAttendances.Add(u);
                db.ClassAttendances.Add(v);
                db.SaveChanges();
            }
            return RedirectToAction("TakeAttendance", "Teacher");
        }

        public ActionResult MarkAttendance1(string id)
        {

            bool j = true;
            foreach (StudentAttendance i in db.StudentAttendances)
            {
                if (i.StudentID == Convert.ToInt32(id) && i.ClassAttendance.AttendanceDate.Date == DateTime.Now.Date)
                {
                    j = false;
                }
            }
            if (j == false)
            {
                ModelState.AddModelError("", "unable to save changes");

            }
            else
            {
                StudentAttendance u = new StudentAttendance();
                ClassAttendance v = new ClassAttendance();
                u.StudentID = Convert.ToInt32(id);
                u.AttendanceStatus = "Absent";
                v.AttendanceDate = DateTime.Now.Date;
                db.StudentAttendances.Add(u);
                db.ClassAttendances.Add(v);
                db.SaveChanges();
            }
            return RedirectToAction("TakeAttendance", "Teacher");
        }

        public ActionResult MarkAttendance4(string id)
        {

            bool j = true;
            foreach (StudentAttendance i in db.StudentAttendances)
            {
                if (i.StudentID == Convert.ToInt32(id) && i.ClassAttendance.AttendanceDate.Date == DateTime.Now.Date)
                {
                    j = false;
                }
            }
            if (j == false)
            {

                TempData["msg"] = "<script>alert('You have already taken Student Attendance for today.');</script>";

            }
            else
            {
                StudentAttendance u = new StudentAttendance();
                ClassAttendance v = new ClassAttendance();
                u.StudentID = Convert.ToInt32(id);
                u.AttendanceStatus = "Leave";
                v.AttendanceDate = DateTime.Now.Date;
                db.StudentAttendances.Add(u);
                db.ClassAttendances.Add(v);
                db.SaveChanges();
            }
            return RedirectToAction("TakeAttendance", "Teacher");
        }



        public ActionResult TeacherDetails()
        {
            RegisterViewModel loggedinuser = new RegisterViewModel();
            UserAccountViewModel user = new UserAccountViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();
            foreach (Teacher person in db.Teachers)
            {
                if (person1.Email == person.Email)
                {
                    loggedinuser.FirstName = person.FirstName;
                    loggedinuser.LastName = person.LastName;
                    loggedinuser.Address = person.Address;
                    loggedinuser.Gender = person.Gender;
                    loggedinuser.Contact = person.Contact;
                    loggedinuser.Email = person.Email;
                    loggedinuser.Password = person.Password;
                    user.listofusers.Add(loggedinuser);

                }
            }

            return View(user);

        }


        public ActionResult TeacherPayroll()
        {

            AdminViewModel user = new AdminViewModel();
            user.listoffeechallans.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();

            foreach (Teacher person in db.Teachers)
            {
                if (person1.Email == person.Email)
                {
                    foreach (Payroll p in db.Payrolls)
                    {
                        if (person.TeacherID == p.TeacherID)
                        {
                            user.listofpayrolls.Add(p);
                        }
                    }
                }
            }



            return View(user);

        }

        public ActionResult TeacherTimetable()
        {
            AdminViewModel user = new AdminViewModel();
            user.listoftimetable.Add(null);
            RegisterViewModel loggedinuser = new RegisterViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();


            List<string> classname = new List<string>();
            List<string> sectionname = new List<string>();

            foreach (Teacher person in db.Teachers)
            {
                if (person1.Email == person.Email)
                {
                    foreach (Class c in db.Classes)
                    {
                        if (person.TeacherID == c.TeacherID)
                        {
                            classname.Add(c.ClassName);
                            sectionname.Add(c.Section.SectionName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;


            return View(user);
        }

        [HttpPost]
        public ActionResult TeacherTimetable(AdminViewModel collection)
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

            foreach (Teacher person in db.Teachers)
            {
                if (person1.Email == person.Email)
                {
                    foreach (Class c in db.Classes)
                    {
                        if (person.TeacherID == c.TeacherID)
                        {
                            classname.Add(c.ClassName);
                            sectionname.Add(c.Section.SectionName);
                        }
                    }
                }
            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;




            return View(user);
        }

        public ActionResult DatesheetList()
        {

            AdminViewModel user = new AdminViewModel();

            List<string> classname = new List<string>();
            List<string> sectionname = new List<string>();
            foreach (Class t in db.Classes)
            {
                classname.Add(t.ClassName);
            }
            ViewBag.classname = classname;

            return View(user);
        }

        [HttpPost]
        public ActionResult DatesheetList(AdminViewModel collection)
        {

            AdminViewModel user = new AdminViewModel();
            foreach (Datesheet t in db.Datesheets)
            {
                if (t.Class.ClassName == collection.ClassName)
                {
                    user.listofdatesheet.Add(t);
                }

            }

            List<string> classname = new List<string>();
            List<string> sectionname = new List<string>();

            foreach (Class t in db.Classes)
            {
                classname.Add(t.ClassName);
            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }

            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;


            return View(user);

        }


        public ActionResult ViewStudentList()
        {
            comboreload();
            UserAccountViewModel userL = new UserAccountViewModel();
            return View(userL);
        }
        [HttpPost]
        public ActionResult ViewStudentList(ClassViewModel collection)
        {

            string id = User.Identity.GetUserId();
            var p = db.AspNetUsers.Where(x1 => x1.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            string email = p.Email;
            var p1 = db.Teachers.Where(x1 => x1.Email == email).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            y.ClassName = collection.ClassName;
            y.SectionName = collection.SectionName;
            UserAccountViewModel userL = new UserAccountViewModel();
            var list = db.StudentClasses.ToList();

            foreach (var i in list)
            {
                if (i.Class.ClassName == collection.ClassName && i.Section.SectionName == collection.SectionName)
                {
                    RegisterViewModel v = new RegisterViewModel();
                    v.Id = i.Student.StudentID;
                    v.FirstName = i.Student.FirstName;
                    v.LastName = i.Student.LastName;
                    v.Gender = i.Student.Gender;
                    v.RegistrationNo = i.Student.RegistrationNo;
                    userL.listofusers.Add(v);
                }
            }
            comboreload();
            return View(userL);

        }

        public ActionResult GenerateResult(string id)
        {

            List<string> subjectname = new List<string>();

            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }

            ViewBag.subjectname = subjectname;

            return View();
        }

        [HttpPost]
        public ActionResult GenerateResult(ReportViewModel collection, string id)
        {

            try
            {

                Report c = new Report();
                c.TotalMarks = collection.TotalMarks;
                c.ObtainedMarks = collection.ObtainedMarks;

                var p1 = db.Subjects.Where(x => x.SubjectName == collection.SubjectName).SingleOrDefault();
                c.SubjectID = p1.SubjectID;
                c.StudentID = Convert.ToInt32(id);


                if (c.StudentID != 0 && c.ObtainedMarks != 0 && c.TotalMarks != 0 && c.ObtainedMarks < c.TotalMarks)
                {
                    db.Reports.Add(c);

                    db.SaveChanges();
                    return RedirectToAction("Index", "Teacher");
                   // return GenerateResult(id);
                }
                else
                {

                    List<string> subjectname = new List<string>();


                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }


                    ViewBag.subjectname = subjectname;

                    return View();

                }
            }


            catch
            {
                return View();
            }

        }


        public ActionResult ViewResult(string id)
        {
            AdminViewModel user = new AdminViewModel();
            var p1 = db.Students.Where(x => x.StudentID.ToString() == id).SingleOrDefault();
            // user.listofreports.Add(null);
            bool flag = false;
                foreach (Report r in db.Reports)
                {
                    if (p1.StudentID == r.StudentID)
                    {
                        user.total_marks += Convert.ToInt32(r.TotalMarks);
                        user.total_obtained_marks += Convert.ToInt32(r.ObtainedMarks);
                        user.listofreports.Add(r);
                        flag = true;
                    }

                }
            if (flag)
            {
            //    user.percentage = ((user.total_obtained_marks/ user.total_marks) * 100);
            //        if (user.percentage < 35)
            //        {
            //            user.grade = "F";
            //        }
            //        if (user.percentage >= 35 && user.percentage < 69)
            //        {
            //            user.grade = "D";
            //        }
            //        if (user.percentage >= 69 && user.percentage < 79)
            //        {
            //            user.grade = "C";
            //        }

            //        if (user.percentage >= 79 && user.percentage < 89)
            //        {
            //            user.grade = "B";
            //        }

            //        if (user.percentage >= 89 && user.percentage <= 100)
            //        {
            //            user.grade = "A";
            //        }

                    return View(user);
                
               
            }
            else
            {
                return RedirectToAction("ViewStudentList", "Teacher");
            }

        }

        public ActionResult EditResult(string id)
        {
            List<string> subjectname = new List<string>();

            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }

            ViewBag.subjectname = subjectname;

            


            return View();

        }

        [HttpPost]
        public ActionResult EditResult(ReportViewModel collection, string id)
        {
            try
            {
                
                var c = db.Reports.Where(x => x.ReportID.ToString() == id).SingleOrDefault();

                c.TotalMarks = collection.TotalMarks;
                c.ObtainedMarks = collection.ObtainedMarks;

               var p1 = db.Subjects.Where(x => x.SubjectName == collection.SubjectName).SingleOrDefault();
                c.SubjectID = p1.SubjectID;

                foreach (Report r in db.Reports)
                {
                    if(r.ReportID.ToString() == id)
                    {
                        c.StudentID = r.SubjectID;

                    }
                }

              


                if (c.StudentID != 0 && c.ObtainedMarks != 0 && c.TotalMarks != 0 && c.ObtainedMarks < c.TotalMarks)
                {
                    db.Reports.Add(c);

                    db.SaveChanges();
                    return RedirectToAction("ViewStudentList", "Teacher");
                    // return GenerateResult(id);
                }
                else
                {

                    List<string> subjectname = new List<string>();


                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }


                    ViewBag.subjectname = subjectname;

                    return View();

                }
            }


            catch
            {
                return View();
            }
        }

        public ActionResult DeleteResult(string id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult DeleteResult(string id, FormCollection collection)
        {
            try
            {
                var item = db.Reports.Where(x => x.ReportID.ToString() == id).SingleOrDefault();
                db.Reports.Remove(item);
                db.SaveChanges();

                return RedirectToAction("ViewStudentList");
            }
            catch
            {
                return View();
            }
        }

    }
}