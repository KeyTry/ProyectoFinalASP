using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using Modelo;
using Controlador;
using System.Web.Helpers;

// Esta librería se encarga de controlar los inicios de sesión en la App Web
using System.Web.Security;

namespace ProyectoFinal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Se valida que el paramétro email tenga un valor
            if (Request.QueryString["Email"] != null)
            {
                // Se lee el paramétro tomando el valor y se almacena en la caja texto Email
                this.txtEmail.Text = Request.QueryString["Email"].ToString();
            }
        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            try
            {
                // Se crea una instancia del controlador
                ClientsController clientADO = new ClientsController(ConfigurationManager.ConnectionStrings["Db_MotosConnectionString"].ConnectionString);

                // Se declara una variable de tipo usuario
                ClientModel cliente;

                // Se consulta la información del usuario por medio del email
                cliente = clientADO.Consultar(this.txtEmail.Text.Trim());

                // El método VerifyHashedPassword verifica que el password ingresado sea igual al valor encriptado
                if (Crypto.VerifyHashedPassword(cliente.Password, this.txtPassword.Text.Trim()))
                {
                    FormsAuthentication.SetAuthCookie(cliente.Email, this.chkRecordar.Checked);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    throw new Exception("Usuario o password incorrectos");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script languaje='Javascript'>alert('" + ex.Message + "')</script>");
            }
        }
    }
}