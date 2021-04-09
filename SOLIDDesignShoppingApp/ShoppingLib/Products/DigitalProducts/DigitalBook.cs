using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class DigitalBook : BaseProduct, IDigitalBook
    {
        public DigitalBook(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public DigitalBook()
        {
        }

        public int DownloadsLeft { get; private set; } = 3;

        public string Title { get; set; }
        
        public string Author { get; set; }

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
