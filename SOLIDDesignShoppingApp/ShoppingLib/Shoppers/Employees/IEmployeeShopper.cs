using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IEmployeeShopper : IDiscounts
    {
        int EmployeeIDNumber { get; set; }
    }
}