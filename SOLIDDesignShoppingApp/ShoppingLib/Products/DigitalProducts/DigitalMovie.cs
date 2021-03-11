using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class DigitalMovie : BaseProduct, IDigitalMovie
    {
        public DigitalMovie(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public int DownloadsLeft { get; private set; } = 3;
        
        public string Title { get; set; }
        
        public string DirectedBy { get; set; }
        
        public double RunTimeInMinutes { get; set; } 

        public int Download()
        {
            if (DownloadsLeft > 0)
            {
                DownloadsLeft -= 1;
                return DownloadsLeft;
            }
            else
            {
                DownloadsLeft = 0;
                return DownloadsLeft;
            }
        }
    }
}
