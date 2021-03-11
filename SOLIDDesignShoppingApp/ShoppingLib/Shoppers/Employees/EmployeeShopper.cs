using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class EmployeeShopper : BaseShopper, IEmployeeShopper
    {
        public decimal DiscountRate { get; } = .03M;
        
        public int EmployeeIDNumber { get; set; }
    }
}
