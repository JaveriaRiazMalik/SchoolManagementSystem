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
    }
}