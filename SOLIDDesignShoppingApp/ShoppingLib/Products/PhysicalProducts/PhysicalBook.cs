using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class PhysicalBook : BaseProduct, IPhysicalBook
    {
        public PhysicalBook(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public int Pages { get; set; }

        public bool InStock { get; set; }
        
        public string Title { get; set; }
        
        public string Author { get; set; }
    }
}
