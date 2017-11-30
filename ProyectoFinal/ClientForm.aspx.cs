using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System.Drawing;
using System.Text;
using GMap.NET;
using Modelo;
using Controlador;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web.Helpers;
namespace ProyectoFinal
{

    public partial class ClientForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //// GMap1.Version = "2.43";
                //GMap1.enableDragging = false;
                //GMap1.enableGoogleBar = true;
                GMap1.Language = "es";
                GMap1.Add(new GControl(GControl.preBuilt.LargeMapControl));
                GLatLng latlong = new GLatLng(10.856522627179888, -84.59865722656251);//LATITUD Y LONGITUD POR DEFECTO DEL MAPA
                GMap1.setCenter(latlong);
                GCustomCursor customCursor = new GCustomCursor(cursor.crosshair, cursor.text);//CURSOR POR DEFECTO
                GMap1.Add(customCursor);


                GMap1.Add(new GListener(GMap1.GMap_Id, GListener.Event.click,
                                string.Format(@"
        function(event)
        {{
            if (!event) return;
            var ev = new serverEvent('Click', {0});
            ev.addArg({0}.getDiv().offsetWidth);
            ev.addArg({0}.getDiv().offsetHeight);
            ev.addArg(event.latLng.lat());
            ev.addArg(event.latLng.lng());
            ev.send();
       }}
       ", GMap1.GMap_Id)));

                //guargar estado original
                Session["lat"] = latlong.lat.ToString();
                Session["lng"] = latlong.lng.ToString();
            }

        }

        protected string GMap1_ServerEvent(object s, GAjaxServerEventOtherArgs e)
        {

            string js = string.Empty;

            switch (e.eventName)
            {
                case "Click":
                    GLatLng latlng = new GLatLng(
                Convert.ToDouble(e.eventArgs[2], new System.Globalization.CultureInfo("en-US", false)),
                Convert.ToDouble(e.eventArgs[3], new System.Globalization.CultureInfo("en-US", false)));

                    GInfoWindowOptions options = new GInfoWindowOptions();
                    options.onCloseFn = string.Format(@"
                function()
                {{
                    var ev = new serverEvent('InfoWindowClose', {0});
                    ev.addArg('My Argument');
                    ev.send();
                }}
            ", GMap1.GMap_Id);
                    GInfoWindow window = new GInfoWindow(latlng, string.Format("Window Size (px): ({0},{1}). Close Me.", e.eventArgs[0], e.eventArgs[1]), options);

                    //guardar punto
                    Session["lat"] = latlng.lat.ToString();
                    Session["lng"] = latlng.lng.ToString();

                    js = window.ToString(e.who);
                    break;
            }
            return js;
        }



        protected void btnBuscar_Click(object sender, EventArgs e)
        {



        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ClientsController clienteADO = new ClientsController(ConfigurationManager.ConnectionStrings["Db_MotosConnectionString"].ConnectionString);//PONER STRING DE CONEXION
            try
            {
                if (this.txtPassword.Text.Equals(this.txtConPassword.Text))
                {
                    var lat = Session["lat"];//recuperar Coordenadas
                    var lng = Session["lng"];
                    ClientModel nuevoCliente = new ClientModel(this.txtId.Text,this.txtEmail.Text, this.txtNombreCompleto.Text, txtPhone.Text, Crypto.HashPassword(this.txtPassword.Text), this.txtAddress.ToString(), "" + lat + "," + lng);
                    clienteADO.RegistrarCliente(nuevoCliente);
                    Response.Write("<script lenguaje ='javascript'> alert('Usuario Registrado, Gracias');</script>");
                }
                else
                {
                    Response.Write("<script lenguaje ='javascript'> alert('Las contraseñas ingresadas no coinciden');</script>");
                    this.txtPassword.Text = "";
                    this.txtConPassword.Text = "";
                }

            }
            catch (Exception)
            {

                throw;
            }
            
            
        }

        
    }
}