using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchoolManagementSystem.Models
{
    public class SectionViewModel
    {
        [Required]
        [Display(Name = "Section Name")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string SectionName { get; set; }



    }
}