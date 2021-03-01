using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IBook : IProduct
    {
        string Title { get; set; }

        string Author { get; set; }
    }
}
