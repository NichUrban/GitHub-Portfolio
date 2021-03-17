using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmailAddressGeneratorLib
{
    public static class EmailAddressGenerator 
    {
        public static string GenerateEmailAddress(UserModel user) // generates an email address based on a users name and if they're a manager
        {
            if (string.IsNullOrWhiteSpace(user.FirstName))
            {
                throw new ArgumentException("Invalid or Empty First Name.", "FirstName");
            }
            
            if (string.IsNullOrWhiteSpace(user.LastName))
            {
                throw new ArgumentException("Invalid or Empty Last Name.", "LastName");
            }


            string email = "";

            // the code below appends text to an email address for a user, and checks for certain conditions to add/omit certain strings of text to the email address
            email += user.FirstName.Substring(0, 1).ToLower();
            if (string.IsNullOrWhiteSpace(user.MiddleName) != true)
            {
                email += user.MiddleName.Substring(0, 1).ToLower();
            }
            email += user.LastName.ToLower();
            if (user.IsManager == true)
            {
                email += ".mgmt";
            }
            email += "@sharpmail.org";

            return email;
        }
    }
}
