using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ProductosAlCarro : IEquatable<ProductosAlCarro>
    {
        public int Cantidad { get; set; }
        private int _IdProducto;
        
        public int IdProducto
        {
            get { return _IdProducto; }
            set
            {
                _IdProducto = value;
            }
        }
        public ProductosAlCarro(int pId)
        {
            IdProducto = pId;
        }
        public bool Equals(ProductosAlCarro pItem)
        {
            return pItem.IdProducto == IdProducto;
        }
    }
}