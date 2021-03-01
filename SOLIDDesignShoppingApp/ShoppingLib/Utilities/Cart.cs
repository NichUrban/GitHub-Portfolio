using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class Cart : ICart
    {
        public List<IProduct> Items { get; set; }
        
        public IShopper Shopper { get; set; }

        private decimal _total;
        public decimal Total
        {
            get { return _total; }
            private set
            {
                _total = GenerateTotal();
            }
        }

        public decimal GenerateTotal()
        {
            decimal total = 0;

            foreach (var item in Items)
            {
                total += item.Price;
            }

            if (Shopper is IDiscounts discounted)
            {
                total -= (total * discounted.DiscountRate);
            }

            return total;
        }


    }
}
