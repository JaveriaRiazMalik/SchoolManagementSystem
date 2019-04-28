using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchoolManagementSystem.Models
{
    public class ClassViewModel
    {
        [Required]
        [Display(Name = "Class Name")]
        public string ClassName { get; set; }

        [Required]
        [Display(Name = "Teacher Name")]
        public string TeacherName { get; set; }

        [Required]
        [Display(Name = "Subject Name")]
       [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string SubjectName { get; set; }

        [Required]
        [Display(Name = "Section Name")]
        public string SectionName { get; set; }




    }
}