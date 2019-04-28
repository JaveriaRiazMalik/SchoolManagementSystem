using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchoolManagementSystem.Models
{
    public class FeechallanViewModel
    {
        [Required]
        [Display(Name = "Class Name")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Name should be in Alphabets")]
        public string ClassName { get; set; }

        [Required(ErrorMessage = "Pleasee enter Valid Expense")]
        [DataType(DataType.Currency)]
        [Range(1, 9999, ErrorMessage = "Enter Fee between 1 and 999")]
        [RegularExpression(@"^(((\d{1})*))$", ErrorMessage = "Enter Valid Expense")]
        public int Fee { get; set; }

        [Required]
        [Display(Name = "IssueDate")]
        public DateTime IssueDate { get; set; }

    }
}