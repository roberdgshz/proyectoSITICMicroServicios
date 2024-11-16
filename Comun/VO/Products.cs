using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Threading.Tasks;
using static VO.StaticDefinitions;

namespace VO
{
    [DataContract]
    public class Products
    {
        [DataMember (EmitDefaultValue = false)]
        public int Id { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public string Name { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public string Description { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public double Price { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public int CurrentStock { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public int MaxStock { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public int MinStock { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public int StockCount { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public eStockStatus StockStatusId { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public string Imagepath { get; set; }
        
        [DataMember(EmitDefaultValue = false)]
        public DateTime CreateAt { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public DateTime UpdateAt { get; set; }

    }
}
