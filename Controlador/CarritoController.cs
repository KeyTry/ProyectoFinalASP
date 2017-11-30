using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Controlador
{
    public class CarritoController
    {
        public List<ProductosAlCarro> ListaProductos { get; private set; }
        public string TipoPago { get => tipoPago; set => tipoPago = value; }
        public string Banco { get; set; }
        public string NumeroCheque { get; set; }

        private VentasController ventaADO;

        private string tipoPago;

        public static CarritoController CapturarProducto()
        {
            CarritoController _carrito = (CarritoController)HttpContext.Current.Session["ASPCarritoController"];
            if (_carrito == null)
            {
                HttpContext.Current.Session["ASPCarritoController"] = _carrito = new CarritoController();
            }
            return _carrito;
        }

        public static void BorrarCarrito()
        {
            HttpContext.Current.Session["ASPCarritoController"] = null;
        }

        protected CarritoController()
        {

            ventaADO = new VentasController(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
            ListaProductos = new List<ProductosAlCarro>();
        }

        public void Agregar(string pIdProducto)
        {

            MotoModel model = ventaADO.motoPorId(pIdProducto);

            ProductosAlCarro NuevoProducto = new ProductosAlCarro(model);

            if (ListaProductos.Contains(NuevoProducto))
            {
                foreach (ProductosAlCarro item in ListaProductos)
                {
                    if (item.Equals(NuevoProducto))
                    {
                        item.Cantidad++;
                        return;
                    }
                }
            }
            else
            {
                NuevoProducto.Cantidad = 1;
                ListaProductos.Add(NuevoProducto);
            }
        }
        public void EliminarProductos(string pIdProducto)
        {
            MotoModel model = ventaADO.motoPorId(pIdProducto);

            ProductosAlCarro eliminaritems = new ProductosAlCarro(model);
            ListaProductos.Remove(eliminaritems);
        }
        public void CantidadDeProductos(string pIdProducto, int pCantidad)
        {
            if (pCantidad == 0)
            {
                EliminarProductos(pIdProducto);
                return;
            }
            MotoModel model = ventaADO.motoPorId(pIdProducto);

            ProductosAlCarro updateProductos = new ProductosAlCarro(model);
            foreach (ProductosAlCarro item in ListaProductos)
            {
                if (item.Equals(updateProductos))
                {
                    item.Cantidad = pCantidad;
                    return;
                }
            }
        }

        public double SubTotal()
        {
            double subtotal = 0;

            foreach (ProductosAlCarro item in ListaProductos)
            {
                subtotal += item.Total;
            }
            return subtotal;
        }

        public double Total()
        {
            double total = SubTotal();

            if (TipoPago == "EFECTIVO")
            {
                total = total - (total * 0.02);
            }

            double i = 0;
            foreach (ProductosAlCarro item in ListaProductos)
            {
                i += item.Cantidad;
                if (i >= 3)
                {
                    total = total - (total * 0.1);
                    break;
                }
            }

            return total;
        }
    }
}