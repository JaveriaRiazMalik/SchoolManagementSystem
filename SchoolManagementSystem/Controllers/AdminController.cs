using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using SchoolManagementSystem.Views.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;

namespace SchoolManagementSystem.Controllers
{

    public class AdminController : Controller
    {
        //Entity model
        DB31Entities db = new DB31Entities();

        // GET: Admin
        /// <summary>
        /// View of admin index page
        /// </summary>
        /// <returns>index view</returns>
        public ActionResult Index()
        {
            ViewBag.student_count = db.Students.ToList().Count; //Student count
            ViewBag.teacher_count = db.Teachers.ToList().Count; //teacher count
            ViewBag.subject_count = db.Subjects.ToList().Count; //subject count
            ViewBag.section_count = db.Sections.ToList().Count; //section count
            ViewBag.class_count = db.Classes.ToList().Count;  //class count
            ViewBag.payroll_count = db.Payrolls.ToList().Count;  //payroll count
            ViewBag.feechallan_count = db.FeeChallans.ToList().Count; //feechallan count

            return View();
        }

        /// <summary>
        /// View of second page of admin index
        /// </summary>
        /// <returns>second page of admin index</returns>
        public ActionResult Index2()
        {


            return View();
        }


        /// <summary>
        /// Shows list of all students
        /// </summary>
        /// <returns>student list</returns>
        public ActionResult Studentlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Student s in db.Students)
            {
                user.listofstudents.Add(s);

            }
            return View(user);
        }

        public ActionResult ExportStudents()
        {
            List<Student> allCustomer = new List<Student>();
            allCustomer = db.Students.ToList();


            CrystalReports rd = new CrystalReports();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReports"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Studentlist.pdf");
        }

        public ActionResult FeeChallans()
        {
            List<vwFeeChallan> allCustomer = new List<vwFeeChallan>();
            allCustomer = db.vwFeeChallans.ToList();


            CrystalReport1 rd = new CrystalReport1();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport1"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Studentlist.pdf");

        }


        public ActionResult TeacherAttendencePdf()
        {
            List<TeacherAttendance> allCustomer = new List<TeacherAttendance>();
            allCustomer = db.TeacherAttendances.ToList();


            CrystalReport3 rd = new CrystalReport3();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport3"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "TeacherAttendanceList.pdf");

        }
        /// <summary>
        /// Shows list of teachers
        /// </summary>
        /// <returns>teacher list</returns>
        public ActionResult Teacherlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Teacher t in db.Teachers)
            {
                user.listofteachers.Add(t);

            }
            return View(user);
        }

        public ActionResult ExportTeachers()
        {
            List<Teacher> allCustomer = new List<Teacher>();
            allCustomer = db.Teachers.ToList();


            CrystalReport2 rd = new CrystalReport2();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport2"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Teacherlist.pdf");
        }


        /// <summary>
        /// Shows list of subjects
        /// </summary>
        /// <returns>subject list</returns>
        public ActionResult Subjectlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Subject t in db.Subjects)
            {
                user.listofsubjects.Add(t);

            }
            return View(user);
        }


        /// <summary>
        /// Shows list of feechallans
        /// </summary>
        /// <returns>feechallan list</returns>
        public ActionResult Feechallanlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (FeeChallan t in db.FeeChallans)
            {
                user.listoffeechallans.Add(t);

            }
            return View(user);
        }

        ///Get
        /// <summary>
        /// Deletes subject
        /// </summary>
        /// <param name="id">subject id</param>
        /// <returns>delete view</returns>
        public ActionResult DeleteSubject(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes subject
        /// </summary>
        /// <param name="id">subject id</param>
        /// <param name="collection">FormCollection object</param>
        /// <returns>view of subject list</returns>
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

        ///Get
        /// <summary>
        /// Edits subject
        /// </summary>
        /// <param name="id">subject id</param>
        /// <returns>view os subject list</returns>
        public ActionResult EditSubject(string id)
        {
            SubjectViewModel collection = new SubjectViewModel();
            var p = db.Subjects.Where(x => x.SubjectID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.SubjectName = p.SubjectName;
            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edits subject
        /// </summary>
        /// <param name="collection">SubjectViewModel object</param>
        /// <param name="id">subject id</param>
        /// <returns>view os subject</returns>
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


        /// <summary>
        /// list of section
        /// </summary>
        /// <returns>view os section list</returns>
        public ActionResult Sectionlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Section t in db.Sections)
            {
                user.listofsections.Add(t);

            }
            return View(user);
        }

        ///Get
        /// <summary>
        /// Edits section
        /// </summary>
        /// <param name="id">section id</param>
        /// <returns>view of section list</returns>
        public ActionResult EditSection(string id)
        {
            SectionViewModel collection = new SectionViewModel();
            var p = db.Sections.Where(x => x.SectionID.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

            collection.SectionName = p.SectionName;
            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edits section
        /// </summary>
        /// <param name="collection">SectionViewModel object</param>
        /// <param name="id">section id</param>
        /// <returns>view of section list</returns>
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

        /// <summary>
        /// list of class
        /// </summary>
        /// <returns>view of class list</returns>
        public ActionResult Classlist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Class t in db.Classes)
            {
                user.listofclasses.Add(t);

            }
            return View(user);
        }

        /// <summary>
        /// list of payroll
        /// </summary>
        /// <returns>view of payroll list</returns>
        public ActionResult Payrollist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Payroll t in db.Payrolls)
            {
                user.listofpayrolls.Add(t);

            }
            return View(user);
        }

        ///Get
        /// <summary>
        /// Adds subject
        /// </summary>
        /// <returns>view of admin index</returns>
        public ActionResult AddSubjects()
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Adds subject
        /// </summary>
        /// <returns>view of admin index</returns>
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

        ///Get
        /// <summary>
        /// Adds Class
        /// </summary>
        /// <returns>view of admin index</returns>
        public ActionResult AddClasses()
        {
            List<string> teachername = new List<string>(); //list of teacher names from the database to be displayed in combo box
            List<string> sectionname = new List<string>(); //list of section names from the database to be displayed in combo box
            List<string> subjectname = new List<string>(); //list of subject names from the database to be displayed in combo box

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

        ///Post
        /// <summary>
        /// Adds class
        /// </summary>
        /// <param name="collection">ClassViewModel object</param>
        /// <returns>view of admin index</returns>
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
                    List<string> teachername = new List<string>(); //list of teacher names from the database to be displayed in combo box
                    List<string> sectionname = new List<string>(); //list of section names from the database to be displayed in combo box
                    List<string> subjectname = new List<string>(); //list of subject names from the database to be displayed in combo box

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

        ///Get
        /// <summary>
        /// Assign a class to a student
        /// </summary>
        /// <returns>view of admin index</returns>
        public ActionResult AssignClass()
        {
            List<string> studentname = new List<string>(); //list of student names from the database to be displayed in combo box
            List<string> sectionname = new List<string>(); //list of section names from the database to be displayed in combo box
            List<string> classname = new List<string>(); //list of class names from the database to be displayed in combo box

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

            ViewBag.studentname = studentname.Distinct();
            ViewBag.sectionname = sectionname.Distinct();
            ViewBag.classname = classname.Distinct();

            return View();
        }

        ///Post
        /// <summary>
        /// assigns a class to a student
        /// </summary>
        /// <param name="collection">StudentViewModel</param>
        /// <returns>view of admin index</returns>
        [HttpPost]
        public ActionResult AssignClass(StudentClassViewModel collection)
        {

            try
            {
                StudentClass c = new StudentClass();


                foreach (Student s in db.Students)
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
                bool flag = false;
                if (c.ClassID != 0 && c.StudentID != 0 && c.SectionID != 0)
                {
                    foreach (StudentClass s in db.StudentClasses)
                    {
                        if (s.StudentID == c.StudentID)
                        {
                            flag = true;
                        }
                    }
                    if (flag == false)
                    {

                        db.StudentClasses.Add(c); //adding into the database

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

                        ViewBag.studentname = studentname.Distinct(); //list of teacher names from the database to be displayed in combo box
                        ViewBag.sectionname = sectionname.Distinct(); //list of section names from the database to be displayed in combo box
                        ViewBag.classname = classname.Distinct();     //list of teaher names from the database to be displayed in combo box

                        return View();
                    }

                }
                else
                {
                    List<string> studentname = new List<string>(); //list of teacher names from the database to be displayed in combo box
                    List<string> sectionname = new List<string>(); //list of teaher names from the database to be displayed in combo box
                    List<string> classname = new List<string>(); //list of teaher names from the database to be displayed in combo box

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


        ///Get
        /// <summary>
        /// Deletes class
        /// </summary>
        /// <param name="id">id of class</param>
        /// <returns>view of class list</returns>
        public ActionResult DeleteClass(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes class
        /// </summary>
        /// <param name="id">id of class</param>
        /// <returns>view of class list</returns>
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

        ///Get
        /// <summary>
        /// Edits class
        /// </summary>
        /// <param name="id">class id</param>
        /// <returns>view of class list</returns>
        public ActionResult EditClass(string id)
        {
            List<string> teachername = new List<string>(); //list of teacher names from the database to be displayed in combo box
            List<string> sectionname = new List<string>();  //list of section names from the database to be displayed in combo box
            List<string> subjectname = new List<string>();  //list of subject names from the database to be displayed in combo box

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

        ///Post
        /// <summary>
        /// Edits class
        /// </summary>
        /// <param name="collection">ClassViewModel object</param>
        /// <param name="id">class id</param>
        /// <returns></returns>
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

        ///Get
        /// <summary>
        /// Adds teacher's payroll
        /// </summary>
        /// <returns>view of add payroll</returns>
        public ActionResult AddPayroll()
        {
            List<int> name = new List<int>(); //list of names of teachers

            foreach (Teacher t in db.Teachers)
            {
                name.Add(t.TeacherID);


            }

            ViewBag.name = name;
            return View();
        }
        ///Post
        /// <summary>
        /// Adds payroll of teachers
        /// </summary>
        /// <param name="collection">PayrollViewModel object</param>
        /// <returns>view of teacher index</returns>
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

                    return RedirectToAction("Index2", "Admin");
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

        ///Get
        /// <summary>
        /// edits teacher's payroll
        /// </summary>
        /// <param name="id">payroll id</param>
        /// <returns>view of edit payroll</returns>
        public ActionResult EditPayroll(string id)
        {
            List<int> name = new List<int>(); //list of teacher names

            foreach (Teacher t in db.Teachers)
            {
                name.Add(t.TeacherID);


            }

            ViewBag.name = name;

            PayrollViewModel collection = new PayrollViewModel();
            var p = db.Payrolls.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.Designation = p.Designation;
            collection.Pay = Convert.ToInt32(p.Pay);
            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edits teacher's payroll
        /// </summary>
        /// <param name="collection">PayrollViewModel object</param>
        /// <param name="id">Payroll id</param>
        /// <returns>view of payroll list</returns>
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

        ///Get
        /// <summary>
        /// Edits Student's Feechallan
        /// </summary>
        /// <param name="id">feechallan id</param>
        /// <returns>view of edit feechallan</returns>
        public ActionResult EditFeechallan(string id)
        {
            List<string> name = new List<string>();


            foreach (Class t in db.Classes)
            {
                name.Add(t.ClassName);


            }


            ViewBag.name = name;

            FeechallanViewModel collection = new FeechallanViewModel();
            var p = db.FeeChallans.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.IssueDate = p.IssueDate;
            collection.ClassName = p.Class.ClassName;
            collection.Fee = Convert.ToInt32(p.Fee);
            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edits student's feechallan
        /// </summary>
        /// <param name="collection">FeechallanViewModel</param>
        /// <param name="id">feechallan id</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult EditFeechallan(FeechallanViewModel collection, string id)
        {
            try
            {
                var p = db.FeeChallans.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

                p.Class.ClassName = collection.ClassName;
                p.IssueDate = DateTime.Now;
                p.Fee = collection.Fee;
                if (p.ClassID != 0 && p.IssueDate != null && p.Fee != 0)
                {
                    db.SaveChanges();
                    return RedirectToAction("Feechallanlist", "Admin");
                }
                else
                {
                    List<string> name = new List<string>();


                    foreach (Class t in db.Classes)
                    {
                        name.Add(t.ClassName);


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

        ///Get
        /// <summary>
        /// Edits tiemtable
        /// </summary>
        /// <param name="id">Timetable id</param>
        /// <returns>view of edit timetable</returns>
        public ActionResult EditTimetable(string id)
        {

            List<string> classname = new List<string>(); //list of class names
            List<string> sectionname = new List<string>(); //list of section names
            List<string> subjectname = new List<string>(); //list of subject names


            foreach (Class t in db.Classes)
            {
                classname.Add(t.ClassName);
            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }
            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;
            ViewBag.subjectname = subjectname;

            TimetableViewModel collection = new TimetableViewModel();
            var p = db.Timetables.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.Day = p.Day;
            collection.Lec1 = p.Lec1;
            collection.Lec2 = p.Lec2;
            collection.Lec3 = p.Lec3;
            collection.Lec4 = p.Lec4;
            collection.Lec5 = p.Lec5;
            collection.Lec6 = p.Lec6;
            collection.Lec7 = p.Lec7;
            collection.Lec8 = p.Lec8;
            collection.ClassName = p.Class.ClassName;
            collection.SectionName = p.Section.SectionName;

            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edits Timetable
        /// </summary>
        /// <param name="collection">TimetableViewModel</param>
        /// <param name="id">Timetable id</param>
        /// <returns>View of timetable list</returns>
        [HttpPost]
        public ActionResult EditTimetable(TimetableViewModel collection, string id)
        {
            try
            {
                var d = db.Timetables.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

                d.Day = collection.Day;
                d.Lec1 = collection.Lec1;
                d.Lec2 = collection.Lec2;
                d.Lec3 = collection.Lec3;
                d.Lec4 = collection.Lec4;
                d.Lec5 = "Break";
                d.Lec6 = collection.Lec6;
                d.Lec7 = collection.Lec7;
                d.Lec8 = collection.Lec8;

                d.Class.ClassName = collection.ClassName;
                d.Section.SectionName = collection.SectionName;

                if (d.ClassID != 0 && d.SectionID != 0)
                {
                   

                    db.SaveChanges();

                    return RedirectToAction("Timetable", "Admin");
                }
                else
                {
                    List<string> classname = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> subjectname = new List<string>();

                    foreach (Class t in db.Classes)
                    {
                        classname.Add(t.ClassName);
                    }
                    foreach (Section s in db.Sections)
                    {
                        sectionname.Add(s.SectionName);


                    }
                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }

                    ViewBag.classname = classname;
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

        ///Get
        /// <summary>
        /// Edits datesheet
        /// </summary>
        /// <param name="id">datesheet id</param>
        /// <returns>view of edit datesheet</returns>
        public ActionResult EditDatesheet(string id)
        {

            List<string> classname = new List<string>(); //ist of class names
            List<string> sectionname = new List<string>(); //list of section names
            List<string> subjectname = new List<string>(); //list of subject names


            foreach (Class t in db.Classes)
            {
                classname.Add(t.ClassName);
            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }
            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }


            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;
            ViewBag.subjectname = subjectname;

            DatesheetViewModel collection = new DatesheetViewModel();
            var p = db.Datesheets.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details
            collection.Day = p.Day;
            collection.Duration = p.Duration;
            collection.ClassName = p.Class.ClassName;
            collection.SectionName = p.Section.SectionName;
            collection.SubjectName = p.Subject.SubjectName;

            return View(collection);

        }

        ///Post
        /// <summary>
        /// Edit datesheet
        /// </summary>
        /// <param name="collection">DatesheetViewModel</param>
        /// <param name="id">Datesheet id</param>
        /// <returns>view of datesheet list</returns>
        [HttpPost]
        public ActionResult EditDatesheet(DatesheetViewModel collection, string id)
        {
            try
            {
                var d = db.Datesheets.Where(x => x.Id.ToString() == id).SingleOrDefault(); //Condition to check the Id of specific person to edit only his/her details

                d.Day = collection.Day;
                d.Duration = collection.Duration;

                d.Class.ClassName = collection.ClassName;
                d.Section.SectionName = collection.SectionName;
                d.Subject.SubjectName = collection.SubjectName;

                if (d.ClassID != 0 && d.SectionID != 0)
                {
                   

                    db.SaveChanges();

                    return RedirectToAction("Datesheet", "Admin");
                }
                else
                {
                    List<string> classname = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> subjectname = new List<string>();
                    foreach (Class t in db.Classes)
                    {
                        classname.Add(t.ClassName);
                    }
                    foreach (Section s in db.Sections)
                    {
                        sectionname.Add(s.SectionName);


                    }
                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }

                    ViewBag.classname = classname;
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

        ///Get
        /// <summary>
        /// Delete feechallan
        /// </summary>
        /// <param name="id">Feechallan id</param>
        /// <returns>view of edit feechallan</returns>
        public ActionResult DeleteFeechallan(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes feechallan
        /// </summary>
        /// <param name="id">feechallan id</param>
        /// <param name="collection">FormCollection</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteFeechallan(string id, FormCollection collection)
        {
            try
            {
                var item = db.FeeChallans.Where(x => x.Id.ToString() == id).SingleOrDefault();

                db.FeeChallans.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Feechallanlist");
            }
            catch
            {
                return View();
            }
        }

        ///Get
        /// <summary>
        /// Delete Timetable
        /// </summary>
        /// <param name="id">Timeyable id</param>
        /// <returns>View of timetable list</returns>
        public ActionResult DeleteTimetable(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Delete tiemtable
        /// </summary>
        /// <param name="id">timetable id</param>
        /// <param name="collection">FormCollection</param>
        /// <returns>view of timetable list</returns>
        [HttpPost]
        public ActionResult DeleteTimetable(string id, FormCollection collection)
        {
            try
            {
                var item = db.Timetables.Where(x => x.Id.ToString() == id).SingleOrDefault();

                db.Timetables.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Timetable");
            }
            catch
            {
                return View();
            }
        }

        ///Get
        /// <summary>
        /// Delete datesheet
        /// </summary>
        /// <param name="id">datesheet id</param>
        /// <returns>view of dalete datesheet</returns>
        public ActionResult DeleteDatesheet(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Delete datesheet
        /// </summary>
        /// <param name="id">datesheet id</param>
        /// <param name="collection">FormCollection</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteDatesheet(string id, FormCollection collection)
        {
            try
            {
                var item = db.Datesheets.Where(x => x.Id.ToString() == id).SingleOrDefault();

                db.Datesheets.Remove(item);
                db.SaveChanges();

                return RedirectToAction("Datesheet");
            }
            catch
            {
                return View();
            }
        }


        ///Get
        /// <summary>
        /// Deleates payroll
        /// </summary>
        /// <param name="id">payroll id</param>
        /// <returns>view of delete payroll</returns>
        public ActionResult DeletePayroll(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes Payroll
        /// </summary>
        /// <param name="id">payroll id</param>
        /// <param name="collection">FormCollection</param>
        /// <returns></returns>
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

        ///Get
        /// <summary>
        /// Adds student feechallan
        /// </summary>
        /// <returns>view of add feechallan</returns>
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

        ///Post
        /// <summary>
        /// Adds feechallan
        /// </summary>
        /// <param name="collection">FeechallanViewModel</param>
        /// <returns>view feechallan list</returns>
        [HttpPost]
        public ActionResult AddFeechallan(FeechallanViewModel collection)
        {

            try
            {

                FeeChallan p = new FeeChallan();

                p.DueDate = collection.IssueDate;
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

                    return RedirectToAction("Index2", "Admin");
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

        ///Get
        /// <summary>
        /// Deletes teacher
        /// </summary>
        /// <param name="id">teacher id</param>
        /// <returns>view of teacher delete</returns>
        public ActionResult DeleteT(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes teacher
        /// </summary>
        /// <param name="id">teacher id</param>
        /// <param name="collection">Form collection</param>
        /// <returns>view of teacher list</returns>
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

        ///Get
        /// <summary>
        /// Deletes student
        /// </summary>
        /// <param name="id"></param>
        /// <returns>view of delete student</returns>
        public ActionResult DeleteS(string id)
        {
            return View();
        }

        ///Post
        /// <summary>
        /// Deletes student
        /// </summary>
        /// <param name="id">student id</param>
        /// <param name="collection">FormCollection</param>
        /// <returns>view of student list</returns>
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

        ///Get
        /// <summary>
        /// Edits student
        /// </summary>
        /// <param name="id">student id</param>
        /// <returns>View of edit student</returns>
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

        ///Post
        /// <summary>
        /// Edits student
        /// </summary>
        /// <param name="collection">RegisterViewModel</param>
        /// <param name="id">Student id</param>
        /// <returns>view of student list</returns>
        [HttpPost]
        public ActionResult EditS(RegisterViewModel collection, string id)
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

        ///Get
        /// <summary>
        /// Edits teacher
        /// </summary>
        /// <param name="id">teacher id</param>
        /// <returns>view of Edit teacher</returns>
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

        ///Get
        /// <summary>
        /// Edits teacher
        /// </summary>
        /// <param name="collection">RegisterViewModel</param>
        /// <param name="id"Teacher id></param>
        /// <returns>view of Teacher list</returns>
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



        /// <summary>
        /// Takes attendance of students only if it is not already taken
        /// </summary>
        /// <returns>mark attendance page</returns>
        public ActionResult takeattendance()
        {
            bool flag = false;
            foreach (TeacherAttendance i in db.TeacherAttendances)
            {
                if (i.AttendanceDate == DateTime.Now.Date)
                {
                    flag = true;
                }
            }
            if (flag == false)
            {
                return makeAttendanceList();
            }
            else
            {
                TempData["msg"] = "<script>alert('You have already taken Teacher Attendance for today.');</script>";
                return RedirectToAction("Index2", "Admin");
            }
        }

        /// <summary>
        /// Shows the list of attendance
        /// </summary>
        /// <returns>view of list of students</returns>
        public ActionResult makeAttendanceList()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Teacher t in db.Teachers)
            {
                user.listofteachers.Add(t);
            }
            return View(user);
        }

        /// <summary>
        /// Marks attendance of students
        /// </summary>
        /// <param name="id">student id</param>
        /// <returns>attendance list of students</returns>
        public ActionResult MarkAttendance1(string id)
        {
            bool j = true;
            foreach (TeacherAttendance i in db.TeacherAttendances)
            {
                if (i.TeacherID == Convert.ToInt32(id) && i.AttendanceDate.Date == DateTime.Now.Date)
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
                TeacherAttendance u = new TeacherAttendance();
                u.TeacherID = Convert.ToInt32(id);
                u.AttendanceStatus = "Absent";
                u.AttendanceDate = DateTime.Now.Date;
                db.TeacherAttendances.Add(u);
                db.SaveChanges();
            }
            return RedirectToAction("makeAttendanceList", "Admin");

        }

        /// <summary>
        /// Marks attendance of students
        /// </summary>
        /// <param name="id">student id</param>
        /// <returns>attendance list of students</returns>
        public ActionResult MarkAttendance2(string id)
        {

            bool j = true;
            foreach (TeacherAttendance i in db.TeacherAttendances)
            {
                if (i.TeacherID == Convert.ToInt32(id) && i.AttendanceDate.Date == DateTime.Now.Date)
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
                TeacherAttendance u = new TeacherAttendance();
                u.TeacherID = Convert.ToInt32(id);
                u.AttendanceStatus = "Present";
                u.AttendanceDate = DateTime.Now.Date;
                db.TeacherAttendances.Add(u);
                db.SaveChanges();
            }
            return RedirectToAction("makeAttendanceList", "Admin");

        }

        /// <summary>
        /// Marks attendance of students
        /// </summary>
        /// <param name="id">student id</param>
        /// <returns>attendance list of students</returns>
        public ActionResult MarkAttendance3(string id)
        {
            bool j = true;
            foreach (TeacherAttendance i in db.TeacherAttendances)
            {
                if (i.TeacherID == Convert.ToInt32(id) && i.AttendanceDate.Date == DateTime.Now.Date)
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
                TeacherAttendance u = new TeacherAttendance();
                u.TeacherID = Convert.ToInt32(id);
                u.AttendanceStatus = "Leave";
                u.AttendanceDate = DateTime.Now.Date;
                db.TeacherAttendances.Add(u);
                db.SaveChanges();
            }
            return RedirectToAction("makeAttendanceList", "Admin");

        }

        /// <summary>
        /// Marks attendance of students
        /// </summary>
        /// <param name="id">student id</param>
        /// <returns>attendance list of students</returns>
        public ActionResult MarkAttendance4(string id)
        {

            bool j = true;
            foreach (TeacherAttendance i in db.TeacherAttendances)
            {
                if (i.TeacherID == Convert.ToInt32(id) && i.AttendanceDate.Date == DateTime.Now.Date)
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
                TeacherAttendance u = new TeacherAttendance();
                u.TeacherID = Convert.ToInt32(id);
                u.AttendanceStatus = "Late";
                u.AttendanceDate = DateTime.Now.Date;
                db.TeacherAttendances.Add(u);
                db.SaveChanges();
            }
            return RedirectToAction("makeAttendanceList", "Admin");
        }

        ///Get
        /// <summary>
        /// Creates datesheet of a particular class
        /// </summary>
        /// <returns>view of generate datesheet</returns>
        public ActionResult GenerateDatesheet()
        {
            List<string> classname = new List<string>(); //list of class names
            List<string> sectionname = new List<string>(); //list of section names
            List<string> subjectname = new List<string>(); //list of subject name

            foreach (Class t in db.Classes)
            {
                classname.Add(t.ClassName);
            }
            foreach (Section s in db.Sections)
            {
                sectionname.Add(s.SectionName);


            }
            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }

            ViewBag.classname = classname;
            ViewBag.sectionname = sectionname;
            ViewBag.subjectname = subjectname;

            return View();
        }

        ///Get
        /// <summary>
        /// Craetes datesheet of a partucular class
        /// </summary>
        /// <param name="collection"></param>
        /// <returns>view of admin index</returns>
        [HttpPost]
        public ActionResult GenerateDatesheet(DatesheetViewModel collection)
        {

            try
            {
                Datesheet d = new Datesheet();

                d.Day = collection.Day;
                d.Duration = collection.Duration;
                foreach (Class c in db.Classes)
                {
                    if (c.ClassName == collection.ClassName)
                    {
                        d.ClassID = c.ClassID;
                    }
                }

                foreach (Section s in db.Sections)
                {
                    if (s.SectionName == collection.SectionName)
                    {
                        d.SectionID = s.SectionID;
                    }
                }

                foreach (Subject su in db.Subjects)
                {
                    if (su.SubjectName == collection.SubjectName)
                    {
                        d.SubjectID = su.SubjectID;
                    }
                }

                if (d.ClassID != 0 && d.SectionID != 0)
                {
                    db.Datesheets.Add(d);

                    db.SaveChanges();

                    return RedirectToAction("Index2", "Admin");
                }
                else
                {
                    List<string> classname = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> subjectname = new List<string>();
                    foreach (Class t in db.Classes)
                    {
                        classname.Add(t.ClassName);
                    }
                    foreach (Section s in db.Sections)
                    {
                        sectionname.Add(s.SectionName);


                    }
                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }

                    ViewBag.classname = classname;
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

        ///Get
        /// <summary>
        /// showa datesheet of a particular class
        /// </summary>
        /// <returns>view of datesheet list</returns>
        public ActionResult Datesheet()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Datesheet t in db.Datesheets)
            {
                user.listofdatesheet.Add(t);


            }

            List<string> classname = new List<string>(); //list of class names
            List<string> sectionname = new List<string>(); //list of section names
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

        ///Post
        /// <summary>
        /// shows datesheet of particular class
        /// </summary>
        /// <param name="collection">AdminViewModel</param>
        /// <returns>view of datesheet</returns>
        [HttpPost]
        public ActionResult Datesheet(AdminViewModel collection)
        {

            AdminViewModel user = new AdminViewModel();

            foreach (Datesheet t in db.Datesheets)
            {
                if (t.Class.ClassName == collection.ClassName && t.Section.SectionName == collection.SectionName)
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

        
        public ActionResult ExportDatesheet()
        {
            List<Datesheet> allCustomer = new List<Datesheet>();
            allCustomer = db.Datesheets.ToList();


            CrystalReport4 rd = new CrystalReport4();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport4"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Datesheet.pdf");
        }


        public ActionResult ExportTimetable()
        {
            List<Timetable> allCustomer = new List<Timetable>();
            allCustomer = db.Timetables.ToList();


            CrystalReport6 rd = new CrystalReport6();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport6"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Timetable.pdf");
        }

        public ActionResult ExportFeeChallan()
        {
            List<FeeChallan> allCustomer = new List<FeeChallan>();
            allCustomer = db.FeeChallans.ToList();
            
            CrystalReport4 rd = new CrystalReport4();

            rd.Load(Path.Combine(Server.MapPath("~/CrystalReport4"), "ReportCustomer.rpt"));

            rd.SetDataSource(allCustomer);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Feechallan.pdf");
        }

        ///Get
        /// <summary>
        /// creates timetable of a particular class and section
        /// </summary>
        /// <returns>view of generate timetable</returns>
        public ActionResult GenerateTimetable()
        {
            List<string> classname = new List<string>(); //list of class names
            List<string> sectionname = new List<string>(); //list of section names
            List<string> subjectname = new List<string>(); //list of subject names


            foreach (Class t in db.Classes)
            {
                sectionname.Add(t.Section.SectionName);
                classname.Add(t.ClassName);
            }

            foreach (Subject su in db.Subjects)
            {
                subjectname.Add(su.SubjectName);


            }


            ViewBag.classname = classname.Distinct();
            ViewBag.sectionname = sectionname.Distinct();
            ViewBag.subjectname = subjectname;


            return View();
        }

        //Post
        /// <summary>
        /// creates tiemtable of a particular class and section
        /// </summary>
        /// <param name="collection">TimetableViewModel</param>
        /// <returns>view of index of admin</returns>
        [HttpPost]
        public ActionResult GenerateTimetable(TimetableViewModel collection)
        {

            try
            {
                Timetable d = new Timetable();

                d.Day = collection.Day;
                d.Lec1 = collection.Lec1;
                d.Lec2 = collection.Lec2;
                d.Lec3 = collection.Lec3;
                d.Lec4 = collection.Lec4;
                d.Lec5 = "Break";
                d.Lec6 = collection.Lec6;
                d.Lec7 = collection.Lec7;
                d.Lec8 = collection.Lec8;

                foreach (Class c in db.Classes)
                {
                    if (c.ClassName == collection.ClassName)
                    {
                        d.ClassID = c.ClassID;
                    }
                }

                foreach (Section s in db.Sections)
                {
                    if (s.SectionName == collection.SectionName)
                    {
                        d.SectionID = s.SectionID;
                    }
                }



                if (d.ClassID != 0 && d.SectionID != 0)
                {
                    db.Timetables.Add(d);

                    db.SaveChanges();

                    return RedirectToAction("Index2", "Admin");
                }
                else
                {
                    List<string> classname = new List<string>();
                    List<string> sectionname = new List<string>();
                    List<string> subjectname = new List<string>();

                    foreach (Class t in db.Classes)
                    {
                        classname.Add(t.ClassName);
                    }
                    foreach (Section s in db.Sections)
                    {
                        sectionname.Add(s.SectionName);


                    }
                    foreach (Subject su in db.Subjects)
                    {
                        subjectname.Add(su.SubjectName);


                    }

                    ViewBag.classname = classname;
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

        ///Get
        /// <summary>
        /// filters timetable of a particular class and section
        /// </summary>
        /// <returns>view of timetable</returns>
        public ActionResult Timetable()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (Timetable t in db.Timetables)
            {
                user.listoftimetable.Add(t);


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

        ///Post
        /// <summary>
        /// shows timetable of a particular class and section
        /// </summary>
        /// <param name="collection">AdminViewModel</param>
        /// <returns>shows timetable</returns>
        [HttpPost]
        public ActionResult Timetable(AdminViewModel collection)
        {

            AdminViewModel user = new AdminViewModel();

            foreach (Timetable t in db.Timetables)
            {
                if (t.Class.ClassName == collection.ClassName && t.Section.SectionName == collection.SectionName)
                {
                    user.listoftimetable.Add(t);
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

        /// <summary>
        /// Shows teacher attendance list
        /// </summary>
        /// <returns>view of teacher attendance list</returns>
        public ActionResult TeacherAttendancelist()
        {
            AdminViewModel user = new AdminViewModel();
            foreach (TeacherAttendance s in db.TeacherAttendances)
            {
                user.listofTattendance.Add(s);

            }
            return View(user);
        }

        ///
        /// <summary>
        /// Shows student attendance list
        /// </summary>
        /// <returns>view of student attendance list</returns>
        public ActionResult StudentAttendancelist()
        {
            AdminViewModel user = new AdminViewModel();

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
            ViewBag.classname = classname.Distinct();
            ViewBag.sectionname = sectionname.Distinct();

            return View(user);
        }

        ///Post
        /// <summary>
        /// Shows student attendance list
        /// </summary>
        /// <param name="collection">AdminViewModel</param>
        /// <returns>view of student attendance</returns>
        [HttpPost]
        public ActionResult StudentAttendancelist(AdminViewModel collection)
        {

            AdminViewModel user = new AdminViewModel();

            foreach (StudentClass i in db.StudentClasses)
            {
                if (i.Class.ClassName == collection.ClassName && i.Section.SectionName == collection.SectionName)
                {
                    foreach (StudentAttendance t in db.StudentAttendances)
                    {
                        if (i.StudentID == t.StudentID)
                        {
                            user.listofSattendance.Add(t);
                        }

                    }
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
            ViewBag.classname = classname.Distinct();
            ViewBag.sectionname = sectionname.Distinct();

            return View(user);
        }


    }
}


