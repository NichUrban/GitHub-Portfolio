using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IMusicAlbum : IProduct
    {
        string Artist { get; set; }

        string Title { get; set; }

        int NumberOfTracks { get; set; }
    }
}
