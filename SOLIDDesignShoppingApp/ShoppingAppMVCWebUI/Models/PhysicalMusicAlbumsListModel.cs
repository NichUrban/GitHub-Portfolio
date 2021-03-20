using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class PhysicalMusicAlbumsListModel 
    {
        public static List<PhysicalMusicAlbumCD> GenerateSampleData()
        {
            return new List<PhysicalMusicAlbumCD>
            {
                new PhysicalMusicAlbumCD(32109, 20.95M) { IsSpecialEdition = false, InStock = true, Artist = "Propaganda Machine", Title = "Fight the Power", NumberOfTracks = 7 },
                new PhysicalMusicAlbumCD(21098, 15.98M) { IsSpecialEdition = true, InStock = true, Artist = "Billy Gilfoyle", Title = "Greatest Hits 77-92", NumberOfTracks =  25},
                new PhysicalMusicAlbumCD(10987, 26.99M) { IsSpecialEdition = false, InStock = true, Artist = "Blue Skies", Title = "A Different Day", NumberOfTracks = 7 }
            };
        }
    }
}