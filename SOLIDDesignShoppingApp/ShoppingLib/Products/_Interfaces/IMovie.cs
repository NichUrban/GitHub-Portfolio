using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IMovie : IProduct
    {
        string Title { get; set; }

        string DirectedBy { get; set; }

        double RunTimeInMinutes { get; set; }
    }
}
