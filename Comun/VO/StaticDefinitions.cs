using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    public class StaticDefinitions
    {
        public enum eStockStatus
        {
            IN_STOCK = 1,
            OUT_STOCK = 2,
            LOW_STOCK = 3,
        }

        public enum eDbAction
        {
            Insert = 1,
            Update = 2, 
            Delete = 3,
        }
    }
}
