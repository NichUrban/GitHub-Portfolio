﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class MemberShopper : BaseShopper, IDiscounts
    {
        public decimal DiscountRate { get; } = .02M;
    }
}