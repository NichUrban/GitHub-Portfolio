using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class DigitalMusicAlbum : BaseProduct, IDigitalMusicAlbum
    {
        public DigitalMusicAlbum(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public DigitalMusicAlbum()
        {
        }

        public int DownloadsLeft { get; private set; } = 3;

        public string Artist { get; set; }
        
        public string Title { get; set; }
        
        public int NumberOfTracks { get; set; }

        public int Download()
        {
            if (DownloadsLeft > 0)
            {
                DownloadsLeft -= 1;
                return DownloadsLeft;
            }
            else
            {
                DownloadsLeft = 0;
                return DownloadsLeft;
            }
        }
    }
}
