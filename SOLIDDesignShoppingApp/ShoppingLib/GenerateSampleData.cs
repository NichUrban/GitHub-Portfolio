using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public static class GenerateSampleData
    {
        public static List<IProduct> SampleProductList()
        {
            // a digital book and physical book
            IDigitalBook digiBook = new DigitalBook(12345, 20M)
            {
                Author = "John Smith",
                Title = "Digital Book keeping"
            };
            IPhysicalBook book = new PhysicalBook(23456, 30M)
            {
                Author = "Virginia Woolf",
                Title = "The Written Word",
                Pages = 536
            };

            // a digital movie and physical movie
            IDigitalMovie digiMovie = new DigitalMovie(34567, 10M)
            {
                DirectedBy = "Coen Brothers",
                Title = "Somewhere in the Desert",
                RunTimeInMinutes = 93.75
            };
            IPhysicalMovie movie = new PhysicalMovieDVD(45678, 10M)
            {
                DirectedBy = "John Hughes",
                Title = "80's High School",
                NumberOfDisks = 2,
                RunTimeInMinutes = 75.5
            };

            // a digital music album and physical music album
            IDigitalMusicAlbum digiAlbum = new DigitalMusicAlbum(56789, 10M)
            {
                Artist = "Brian Wilson",
                Title = "California Beaches",
                NumberOfTracks = 8
            };
            IPhysicalMusicAlbum album = new PhysicalMusicAlbumCD(67890, 20M)
            {
                Artist = "Bruce Springsteen",
                Title = "Running Down the Backstreets",
                NumberOfTracks = 7,
                IsSpecialEdition = true
            };

            // all the products together in one list
            List<IProduct> sampleItems = new List<IProduct>()
            {
                digiBook, book, digiMovie, movie, digiAlbum, album
            };

            return sampleItems;
        }
    }
}
