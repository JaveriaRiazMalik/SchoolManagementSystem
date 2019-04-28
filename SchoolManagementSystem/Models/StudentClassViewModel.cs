using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchoolManagementSystem.Models
{
    public class StudentClassViewModel
    {

        [Required]
        [Display(Name = "Class Name")]
        public string ClassName { get; set; }

        [Required]
        [Display(Name = "Section Name")]
        public string SectionName { get; set; }

        [Required]
        [Display(Name = "Registration No")]
        public string RegistrationNo { get; set; }



    }
}