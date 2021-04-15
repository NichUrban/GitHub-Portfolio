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

        
        public decimal Total 
        {
            get 
            { 
                return GenerateTotal();
            } 
        }

        public decimal GenerateSubTotal()
        {
            decimal total = 0;

            if (Items != null)
            {
                foreach (var item in Items)
                {
                    total += item.Price;
                }
            }
            return total;
        }

        public decimal GenerateTotal()
        {
            decimal total = 0;

            if (Items != null)
            {
                total = GenerateSubTotal();

                if (Shopper is IDiscounts discounted)
                {
                    total -= (total * discounted.DiscountRate);
                }
            }

            return total;
        }
    }
}
