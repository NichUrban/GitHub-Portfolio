using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public abstract class BaseProduct : IProduct
    {
        public int ProductIDNum { get; set; }
        
        public decimal Price { get; set; }

        public BaseProduct()
        {
        }

        public BaseProduct(int productIDNum, decimal price)
        {
            ProductIDNum = productIDNum;
            Price = price;
        }        
    }
}
