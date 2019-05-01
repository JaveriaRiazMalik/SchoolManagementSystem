using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace SchoolManagementSystem.Models
{
    public class DatesheetViewModel
    {
        [Required]
        [Display(Name = "Class Name")]
        public string ClassName { get; set; }

        [Required]
        [Display(Name = "Section Name")]
        public string SectionName { get; set; }

        [Required]
        [Display(Name = "Subject Name")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string SubjectName { get; set; }

        [Required]
        [Display(Name = "Day")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Day should be in Alphabets")]
        public string Day { get; set; }

        [Required]
        [Display(Name = "Duration")]
        public DateTime Duration { get; set; }

    }
}