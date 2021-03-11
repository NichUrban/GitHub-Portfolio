using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class MemberShopper : BaseShopper, IMemberShopper
    {
        public decimal DiscountRate { get; } = .02M;
        
        public int MemberIDNumber { get; set; }
    }
}
