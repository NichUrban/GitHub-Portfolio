using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface ICart
    {
        decimal Total { get; }

        List<IProduct> Items { get; set; }

        IShopper Shopper { get; set; }

        decimal GenerateTotal();

    }
}