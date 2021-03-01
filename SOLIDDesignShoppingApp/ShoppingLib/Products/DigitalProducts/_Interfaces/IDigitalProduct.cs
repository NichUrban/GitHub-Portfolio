using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShoppingLib
{
    public interface IDigitalProduct 
    {
        int DownloadsLeft { get; }

        int Download();
    }
}
