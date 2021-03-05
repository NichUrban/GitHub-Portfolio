using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShoppingLib;

namespace ConsoleUI
{
    class Program
    {
        static void Main(string[] args)
        {
            // creates a shopping cart, which can be assigned a shopper
            ICart cart = new Cart();
            cart.Items = GenerateSampleData.SampleProductList(); // fills contents of cart with sample data (see: GenerateSampleData class)

            Checkout virtualRegister = new Checkout(cart);

            // creates a new Guest shopper
            IShopper guest = new GuestShopper();
            cart.Shopper = guest;
            Console.WriteLine($"Guest shopper:\n{ virtualRegister.DisplayCheckOutMessage() }\n"); // generates total for cart

            // creates a new Member shopper with member discount
            IShopper member = new MemberShopper();
            cart.Shopper = member;
            Console.WriteLine($"Member shopper:\n{ virtualRegister.DisplayCheckOutMessage() }\n"); // generates total for cart with member discount

            //creates a new Employee shopper with employee discount
            IShopper employee = new EmployeeShopper();
            cart.Shopper = employee;
            Console.WriteLine($"Employee shopper:\n{ virtualRegister.DisplayCheckOutMessage() }\n"); // generates total for cart with employee discount


            // END of Main
            Console.ReadLine();
        }
    }
}
