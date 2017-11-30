using Controlador;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
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
                e.Row.Cells[3].Text = "Total: " + CarritoController.CapturarProducto().Total().ToString("C");
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

            //ventaADO.Pagar(CarritoController.CapturarProducto());

            GenerarPDF();

            CarritoController.BorrarCarrito();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        private void GenerarPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Factura.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gvCaritoCompras.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();

            EnviarCorreo("itmnettest@gmail.com", "Factura compra motos", "Se adjunto la factura de la compra", pdfDoc);

            Response.Write(pdfDoc);
            Response.End();
            gvCaritoCompras.AllowPaging = true;
            gvCaritoCompras.DataBind();
        }

        public void EnviarCorreo(string destino, string asunto, string contenido, Document pdfDoc)
        {
            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add(destino);

            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = asunto;
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            //agregar pdf
            MemoryStream ms = new MemoryStream();

            PdfWriter.GetInstance(pdfDoc, ms);

            System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType(System.Net.Mime.MediaTypeNames.Application.Pdf);
            System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(ms, ct);
            attach.ContentDisposition.FileName = "Factura.pdf";

            // I guess you know how to send email with an attachment
            // after sending email
            ms.Close();


            //Direccion de correo electronico que queremos que reciba una copia del mensaje
            //mmsg.Attachments.Add(attach);

            //Cuerpo del Mensaje
            mmsg.Body = contenido;
            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML

            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress("itmnettest@gmail.com");


            /*-------------------------CLIENTE DE CORREO----------------------*/
            
            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials =
                new System.Net.NetworkCredential("itmnettest@gmail.com", "NoTengo01");

            //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail

            cliente.Port = 587;
            cliente.EnableSsl = true;


            cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";

            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                throw ex;
                //Aquí gestionamos los errores al intentar enviar el correo
            }
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