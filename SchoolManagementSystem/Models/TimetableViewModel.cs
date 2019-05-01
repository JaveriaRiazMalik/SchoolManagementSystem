using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace SchoolManagementSystem.Models
{
    public class TimetableViewModel
    {
        [Required]
        [Display(Name = "Class Name")]
        public string ClassName { get; set; }

        [Required]
        [Display(Name = "Section Name")]
        public string SectionName { get; set; }

        [Required]
        [Display(Name = "Day")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Day should be in Alphabets")]
        public string Day { get; set; }

        [Required]
        [Display(Name = "8 am")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec1 { get; set; }

        [Required]
        [Display(Name = "Lecture 2")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec2 { get; set; }

        [Required]
        [Display(Name = "Lecture 3")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec3 { get; set; }

        [Required]
        [Display(Name = "Lecture 4")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec4 { get; set; }

        [Required]
        [Display(Name = "Lecture 5")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec5 { get; set; }

        [Required]
        [Display(Name = "Lecture 6")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec6 { get; set; }

        [Required]
        [Display(Name = "Lecture 7")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec7 { get; set; }

        [Required]
        [Display(Name = "Lecture 8")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string Lec8 { get; set; }

    }
}