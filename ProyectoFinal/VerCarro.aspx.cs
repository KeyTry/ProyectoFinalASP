using Controlador;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal
{
    public partial class VerCarro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindData();
        }
        protected void BindData()
        {
            gvCaritoCompras.DataSource = CarritoController.CapturarProducto().ListaProductos;
            gvCaritoCompras.DataBind();
        }
        protected void gvCaritoCompras_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "SubTotal: " + CarritoController.CapturarProducto().SubTotal().ToString("C");
                e.Row.Cells[3].Text = "Total: " + CarritoController.CapturarProducto().Total("").ToString("C");
            }
        }
        protected void gvCaritoCompras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                string productId = e.CommandArgument.ToString();
                CarritoController.CapturarProducto().EliminarProductos(productId);
            }
            BindData();
        }
        protected void btActulizar_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvCaritoCompras.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    try
                    {
                        string productoId = gvCaritoCompras.DataKeys[row.RowIndex].Value.ToString();
                        int cantidad = int.Parse(((TextBox)row.Cells[1].FindControl("txtCantidad")).Text);
                        CarritoController.CapturarProducto().CantidadDeProductos(productoId, cantidad);
                    }
                    catch (FormatException) { }
                }
            }
            BindData();
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            VentasController ventaADO = new VentasController(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);

            if (CarritoController.CapturarProducto().TipoPago == "Cheque")
            {
                CarritoController.CapturarProducto().Banco = this.NombreBanco.Text;
                CarritoController.CapturarProducto().NumeroCheque = this.Cheque.Text;
            }
            else
            {
                CarritoController.CapturarProducto().Banco = "";
                CarritoController.CapturarProducto().NumeroCheque = "";
            }

            ventaADO.Pagar(CarritoController.CapturarProducto());

            CarritoController.BorrarCarrito();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarritoController.CapturarProducto().TipoPago = this.cbxTipoPago.SelectedValue;

            if (cbxTipoPago.SelectedValue == "Cheque")
            {
                //mostrar datos de cheque

            }
            else
            {
                //ocultar

            }
        }
    }
}