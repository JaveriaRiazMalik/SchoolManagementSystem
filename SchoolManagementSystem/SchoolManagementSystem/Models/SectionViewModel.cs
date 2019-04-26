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
        [Display(Name = "SectionName")]
        public string SectionName { get; set; }

    }
}