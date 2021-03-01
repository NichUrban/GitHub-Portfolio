using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IShopper 
    {
        string FirstName { get; set; }

        string LastName { get; set; }

        string Address { get; set; }

        string PhoneNumber { get; set; }
    }
}
