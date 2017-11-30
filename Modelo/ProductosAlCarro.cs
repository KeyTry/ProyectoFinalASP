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
        private MotoModel _producto = null;

        public MotoModel Producto
        {
            get
            {
                return _producto;
            }
        }

        public string IdProducto
        {
            get { return _producto.Model; }

        }
        public string Descripcion
        {
            get { return "Fabricada: " + Producto.AnnoModelo + ", Motor: " + Producto.MotorType + ", " + Producto.MotorSize + " CC, " + "Tipo: " + Producto.Type; }
        }
        public float PrecioUnitario
        {
            get { return Producto.Price; }
        }

        public float Total
        {
            get { return PrecioUnitario * Cantidad; }
        }

        public ProductosAlCarro(MotoModel model)
        {
            _producto = model;
        }

        public bool Equals(ProductosAlCarro pItem)
        {
            return pItem.Producto.Model == Producto.Model;
        }

    }
}