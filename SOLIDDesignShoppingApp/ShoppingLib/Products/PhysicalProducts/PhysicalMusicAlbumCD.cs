using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public class PhysicalMusicAlbumCD : BaseProduct, IPhysicalMusicAlbum
    {
        public PhysicalMusicAlbumCD(int productIDNum, decimal price) : base(productIDNum, price)
        {
        }

        public PhysicalMusicAlbumCD()
        {
        }

        public bool IsSpecialEdition { get; set; }

        public bool InStock { get; set; }
        
        public string Artist { get; set; }
        
        public string Title { get; set; }
        
        public int NumberOfTracks { get; set; }
    }
}
