using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;
namespace Controlador
{
    public class VentasController
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringConexion;

        public VentasController(string pStringConexion)
        {
            this.stringConexion = pStringConexion;
        }
        
        public MotoModel[] Motos(string tipoMotos)
        {

            return null;
        }
        public void RegistrarVenta(VentaModel venta)
        {
            try
            {

                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Ins_Venta]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@idCliente", venta.IdCliente);
                this.comando.Parameters.AddWithValue("@idMoto", venta.IdMoto);
                this.comando.Parameters.AddWithValue("@MotoType", venta.MotoType);
                this.comando.Parameters.AddWithValue("@payMethod", venta.PayMethod);
                this.comando.Parameters.AddWithValue("@totalPrice", venta.TotalPrice);

                this.comando.ExecuteNonQuery();


                this.conexion.Close();
                this.conexion.Dispose();
                this.comando.Dispose();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }//FIN REGI VENTA
        public System.Data.DataSet motosPorTipo(string tipo)
        {
            try
            {
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Cons_Moto_Tipo]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@tipo", tipo);
                System.Data.DataSet datos = new System.Data.DataSet();
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = this.comando;
                adaptador.Fill(datos);

                this.conexion.Close();
                this.comando.Dispose();
                this.conexion.Dispose();

                return datos;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
