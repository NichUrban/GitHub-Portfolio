using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class PhysicalMovieDVD : BaseProduct, IPhysicalMovie
    {
        public PhysicalMovieDVD(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public int NumberOfDisks { get; set; }
        
        public bool InStock { get; set; }
        
        public string Title { get; set; }
        
        public string DirectedBy { get; set; }
        
        public double RunTimeInMinutes { get; set; }
    }
}
