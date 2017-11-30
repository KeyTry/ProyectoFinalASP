using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controlador;
using System.Configuration;

namespace ProyectoFinal
{
    public partial class _Default : Page
    {
        private string currentMotoType;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentMotoType = "Pandilleras";//PUEDE QUE ESTO SE REINICIE EN EL POSTBACK PONERLE EL OJO!!!!!

        }
        public void cambiarTipoMotos(string tipoMotos)
        {
            if (!tipoMotos.Equals(currentMotoType))
            {
                VentasController ventaADO = new VentasController(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
                System.Data.DataSet motosTabla = ventaADO.motosPorTipo(tipoMotos);
                MotoModel[] motos = new MotoModel[10];
                string[] datos = new string[10];
                for (int i = 0; i < 10; i++)
                {
                    motos[i] = new MotoModel();
                    motos[i].Model = motosTabla.Tables[0].Rows[i][0].ToString();
                    motos[i].AnnoModelo = motosTabla.Tables[0].Rows[i][1].ToString();
                    motos[i].MotorSize = motosTabla.Tables[0].Rows[i][2].ToString();
                    motos[i].Cylinders = motosTabla.Tables[0].Rows[i][3].ToString();
                    motos[i].MotorType = motosTabla.Tables[0].Rows[i][4].ToString();
                    motos[i].Type = motosTabla.Tables[0].Rows[i][5].ToString();
                    motos[i].ImgUrl = motosTabla.Tables[0].Rows[i][6].ToString();
                    motos[i].Price = float.Parse(motosTabla.Tables[0].Rows[i][7].ToString());

                }

                this.modelo1.InnerText = motos[0].Model;
                this.annoModelo1.InnerText = motos[0].AnnoModelo;
                this.cantCilindros1.InnerText = motos[0].Cylinders;
                this.tipoMotor1.InnerText = motos[0].MotorType;
                this.img1.Src = motos[0].ImgUrl;
                this.precio1.InnerText = "₡" + motos[0].Price;
                this.btnComprar1.CommandArgument = motos[0].Model;//Envia el modelo a la hora del click

                this.modelo2.InnerText = motos[1].Model;
                this.annoModelo2.InnerText = motos[1].AnnoModelo;
                this.cantCilindros2.InnerText = motos[1].Cylinders;
                this.tipoMotor2.InnerText = motos[1].MotorType;
                this.img2.Src = motos[1].ImgUrl;
                this.precio2.InnerText = "₡" + motos[1].Price;
                this.btnComprar2.CommandArgument = motos[1].Model;//Envia el modelo a la hora del click

                this.modelo3.InnerText = motos[2].Model;
                this.annoModelo3.InnerText = motos[2].AnnoModelo;
                this.cantCilindros3.InnerText = motos[2].Cylinders;
                this.tipoMotor3.InnerText = motos[2].MotorType;
                this.img3.Src = motos[2].ImgUrl;
                this.precio3.InnerText = "₡" + motos[2].Price;
                this.btnComprar3.CommandArgument = motos[2].Model;//Envia el modelo a la hora del click

                this.modelo4.InnerText = motos[3].Model;
                this.annoModelo4.InnerText = motos[3].AnnoModelo;
                this.cantCilindros4.InnerText = motos[3].Cylinders;
                this.tipoMotor4.InnerText = motos[3].MotorType;
                this.img4.Src = motos[3].ImgUrl;
                this.precio4.InnerText = "₡" + motos[3].Price;
                this.btnComprar4.CommandArgument = motos[3].Model;//Envia el modelo a la hora del click

                this.modelo5.InnerText = motos[4].Model;
                this.annoModelo5.InnerText = motos[4].AnnoModelo;
                this.cantCilindros5.InnerText = motos[4].Cylinders;
                this.tipoMotor5.InnerText = motos[4].MotorType;
                this.img5.Src = motos[4].ImgUrl;
                this.precio5.InnerText = "₡" + motos[4].Price;
                this.btnComprar5.CommandArgument = motos[4].Model;//Envia el modelo a la hora del click

                this.modelo6.InnerText = motos[5].Model;
                this.annoModelo6.InnerText = motos[5].AnnoModelo;
                this.cantCilindros6.InnerText = motos[5].Cylinders;
                this.tipoMotor6.InnerText = motos[5].MotorType;
                this.img6.Src = motos[5].ImgUrl;
                this.precio6.InnerText = "₡" + motos[5].Price;
                this.btnComprar6.CommandArgument = motos[5].Model;//Envia el modelo a la hora del click

                this.modelo7.InnerText = motos[6].Model;
                this.annoModelo7.InnerText = motos[6].AnnoModelo;
                this.cantCilindros7.InnerText = motos[6].Cylinders;
                this.tipoMotor7.InnerText = motos[6].MotorType;
                this.img7.Src = motos[6].ImgUrl;
                this.precio7.InnerText = "₡" + motos[6].Price;
                this.btnComprar7.CommandArgument = motos[6].Model;//Envia el modelo a la hora del click

                this.modelo8.InnerText = motos[7].Model;
                this.annoModelo8.InnerText = motos[7].AnnoModelo;
                this.cantCilindros8.InnerText = motos[7].Cylinders;
                this.tipoMotor8.InnerText = motos[7].MotorType;
                this.img8.Src = motos[7].ImgUrl;
                this.precio8.InnerText = "₡" + motos[7].Price;
                this.btnComprar8.CommandArgument = motos[7].Model;//Envia el modelo a la hora del click

                this.modelo9.InnerText = motos[8].Model;
                this.annoModelo9.InnerText = motos[8].AnnoModelo;
                this.cantCilindros9.InnerText = motos[8].Cylinders;
                this.tipoMotor9.InnerText = motos[8].MotorType;
                this.img9.Src = motos[8].ImgUrl;
                this.precio9.InnerText = "₡" + motos[8].Price;
                this.btnComprar9.CommandArgument = motos[8].Model;//Envia el modelo a la hora del click

                this.modelo10.InnerText = motos[9].Model;
                this.annoModelo10.InnerText = motos[9].AnnoModelo;
                this.cantCilindros10.InnerText = motos[9].Cylinders;
                this.tipoMotor10.InnerText = motos[9].MotorType;
                this.img10.Src = motos[9].ImgUrl;
                this.precio10.InnerText = "₡" + motos[9].Price;
                this.btnComprar10.CommandArgument = motos[9].Model;//Envia el modelo a la hora del click
            }

        }

        protected void btnCuadras_Click(object sender, EventArgs e)
        {
            cambiarTipoMotos("Cuadraciclo");
            currentMotoType = "Cuadraciclo";
        }

        protected void btnMontanneras_Click(object sender, EventArgs e)
        {
            cambiarTipoMotos("Montannera");
            currentMotoType = "Montannera";
        }

        protected void btnScooters_Click(object sender, EventArgs e)
        {
            cambiarTipoMotos("Scooter");
            currentMotoType = "Scooter";
        }

        protected void btnPandilleras_Click(object sender, EventArgs e)
        {
            cambiarTipoMotos("Pandillera");
            currentMotoType = "Pandillera";
        }

        protected void agregarACarritoCompra(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            //clickedButton.Text = "Quitar Del Carrito";
            //clickedButton.CommandArgument;//De aca se obtiene el ID de la moto a comprar

            CarritoController.CapturarProducto().Agregar(clickedButton.CommandArgument);
        }
    }
}