using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchoolManagementSystem.Views.Admin
{
    public class PayrollViewModel
    {
        [Required]
        [Display(Name = "Teacher Id")]
        public int TeacherID { get; set; }

        [Required(ErrorMessage = "Pleasee enter Valid Expense")]
        [DataType(DataType.Currency)]
        [Range(1, 9999, ErrorMessage = "Enter Range between 1 and 999")]
        [RegularExpression(@"^(((\d{1})*))$", ErrorMessage = "Enter Valid Expense")]
        public int Pay { get; set; }

        [Required]
        [Display(Name = "Designation")]
        [RegularExpression(@"^[a-zA-Z ]*$", ErrorMessage = "Designation should be in Alphabets")]
        public string Designation { get; set; }
    }
}