using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public abstract class BaseProduct : IProduct
    {
        public BaseProduct(int productIDNum, decimal price)
        {
            _productIDNum = productIDNum;
            _price = price;
        }

        private int _productIDNum;
        public int ProductIDNum
        {
            get { return _productIDNum; }
        }

        private decimal _price;
        public decimal Price
        {
            get { return _price; }
        }
    }
}
