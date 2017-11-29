using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;
namespace Controlador
{
    public class EmailController
    {
      
      
      public void EnviarCorreo( string destino, string asunto, string contenido )
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
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        System.IO.StreamWriter writer = new System.IO.StreamWriter(ms);
        
        writer.Write("Hello its my sample file");
        writer.Flush();
        writer.Dispose();

        System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType(System.Net.Mime.MediaTypeNames.Application.Pdf);
        System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(ms, ct);
        attach.ContentDisposition.FileName = "Factura.pdf";

        // I guess you know how to send email with an attachment
        // after sending email
        ms.Close();
        
        
        //Direccion de correo electronico que queremos que reciba una copia del mensaje
        
        //Cuerpo del Mensaje
        mmsg.Body = contenido;
        mmsg.BodyEncoding = System.Text.Encoding.UTF8;
        mmsg.IsBodyHtml = false; //Si no queremos que se envíe como HTML

        //Correo electronico desde la que enviamos el mensaje
        mmsg.From = new System.Net.Mail.MailAddress("micuenta@servidordominio.com");


        /*-------------------------CLIENTE DE CORREO----------------------*/

        //Creamos un objeto de cliente de correo
        System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

        //Hay que crear las credenciales del correo emisor
        cliente.Credentials =
            new System.Net.NetworkCredential("micuenta@servidordominio.com", "micontraseña");

        //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail
        /*
        cliente.Port = 587;
        cliente.EnableSsl = true;
        */

        cliente.Host = "mail.servidordominio.com"; //Para Gmail "smtp.gmail.com";


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
    }
}
