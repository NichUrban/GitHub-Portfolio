using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class DigitalMusicAlbumsListModel
    {
        public static List<DigitalMusicAlbum> GenerateSampleData()
        {
            return new List<DigitalMusicAlbum>
            {
                new DigitalMusicAlbum(78901, 19.99M) { Artist = "Mettalico", Title = "Unjustice for All", NumberOfTracks = 7 },
                new DigitalMusicAlbum(89012, 5.45M) { Artist = "Horus Baker", Title = "Soothing Guitar", NumberOfTracks = 12 },
                new DigitalMusicAlbum(90123, 15.98M) { Artist = "Ice Cold", Title = "Best Beats vol III", NumberOfTracks = 10 }
            };
        }
    }
}