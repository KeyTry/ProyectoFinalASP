using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoFinal
{
    public partial class VerCarrito : System.Web.UI.Page
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
                e.Row.Cells[3].Text = “Total: “ + CarritoController.CapturarProducto().SubTotal().ToString(“C”);
            }
        }
        protected void gvCaritoCompras_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == “Eliminar”)
            {
                int productId = Convert.ToInt32(e.CommandArgument);
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
                        int productoId = Convert.ToInt32(gvCaritoCompras.DataKeys[row.RowIndex].Value);
                        int cantidad = int.Parse(((TextBox)row.Cells[1].FindControl(“txtCantidad”)).Text);
                        CarritoController.CapturarProducto().CantidadDeProductos(productoId, cantidad);
                    }
                    catch (FormatException) { }
                }
            }
            BindData();
        }
    }
}