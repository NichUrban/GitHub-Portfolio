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


            IDigitalBook digiBook = new DigitalBook(1, 20M);
            IPhysicalBook book = new PhysicalBook(2, 30M);

            IDigitalMovie digiMovie = new DigitalMovie(3, 10M);
            IPhysicalMovie movie = new PhysicalMovieDVD(4, 10M);

            IDigitalMusicAlbum digiAlbum = new DigitalMusicAlbum(5, 10M);
            IPhysicalMusicAlbum album = new PhysicalMusicAlbumCD(6, 20M);

            List<IProduct> items = new List<IProduct>();
            items.Add(digiBook);
            items.Add(book);
            items.Add(digiMovie);
            items.Add(movie);
            items.Add(digiAlbum);
            items.Add(album);


            ICart cart = new Cart();

            cart.Items = items;

            IShopper employee = new EmployeeShopper();
            cart.Shopper = employee;
            Console.WriteLine($"Employee total: ${cart.GenerateTotal()}");

            IShopper member = new MemberShopper();
            cart.Shopper = member;
            Console.WriteLine($"Member total: ${cart.GenerateTotal()}");

            IShopper guest = new NonMemberShopper();
            cart.Shopper = guest;
            Console.WriteLine($"Guest total: ${cart.GenerateTotal()}");


            Console.ReadLine();
        }
    }
}
