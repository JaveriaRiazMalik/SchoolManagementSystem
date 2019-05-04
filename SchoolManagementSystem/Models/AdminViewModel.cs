using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SchoolManagementSystem.Models
{
    public class AdminViewModel
    {
        public List<Student> listofstudents = new List<Student>();
        public List<Teacher> listofteachers = new List<Teacher>();
        public List<Subject> listofsubjects = new List<Subject>();
        public List<Section> listofsections = new List<Section>();
        public List<Class> listofclasses = new List<Class>();
        public List<Payroll> listofpayrolls = new List<Payroll>();
        public List<FeeChallan> listoffeechallans = new List<FeeChallan>();
        public List<Datesheet> listofdatesheet = new List<Datesheet>();
        public List<Timetable> listoftimetable = new List<Timetable>();
        public List<TeacherAttendance> listofTattendance = new List<TeacherAttendance>();
        public List<StudentAttendance> listofSattendance = new List<StudentAttendance>();
        public List<Report> listofreports = new List<Report>();

        public string grade { get; set; }
        public float percentage { get; set; }
        public int total_marks { get; set; }
        public int total_obtained_marks { get; set; }
        public string ClassName { get; set; }
        public string SectionName { get; set; }
    }
}