using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IProduct
    {
        int ProductIDNum { get; }

        decimal Price { get; }
    }
}
