using Microsoft.AspNet.Identity;
using SchoolManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolManagementSystem.Controllers
{
    public class StuddentController : Controller
    {
        DB31Entities db = new DB31Entities();
        // GET: Studdent
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult StudentDetails()
        {
            RegisterViewModel loggedinuser = new RegisterViewModel();
            UserAccountViewModel user = new UserAccountViewModel();
            string userid = User.Identity.GetUserId();
            var person1 = db.AspNetUsers.Where(y => y.Id.ToString() == userid).First();
            foreach(Student person in db.Students)
            {
                if(person1.Email == person.Email)
                {
                    loggedinuser.FirstName = person.FirstName;
                    loggedinuser.LastName = person.LastName;
                    loggedinuser.Address = person.Address;
                    loggedinuser.Gender = person.Gender;
                    loggedinuser.Contact = person.Contact;
                    loggedinuser.Guardian = person.Guardian;
                    loggedinuser.Email = person.Email;
                    loggedinuser.RegistrationNo = person.RegistrationNo;
                    loggedinuser.Password = person.Password;
                    user.listofusers.Add(loggedinuser);

                }
            }
            
            return View(user);

        }

    }
}