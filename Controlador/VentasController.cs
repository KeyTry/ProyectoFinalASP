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

        public void Pagar(CarritoController carrito)
        {
            try
            {
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Pagar_Factura]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;


                this.comando.Parameters.AddWithValue("@subTotal", carrito.SubTotal());
                this.comando.Parameters.AddWithValue("@total", carrito.Total());

                this.comando.Parameters.AddWithValue("@banco", carrito.Banco);
                this.comando.Parameters.AddWithValue("@numeroCheque", carrito.NumeroCheque);


                this.comando.ExecuteNonQuery();

                this.conexion.Close();
                this.conexion.Dispose();
                this.comando.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public MotoModel motoPorId(string id)
        {
            MotoModel moto = new MotoModel();
            try
            {
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Ver_MotoPorId]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@id", id);
                SqlDataReader lector = null;

                lector = this.comando.ExecuteReader();

                if (lector.Read())
                {
                    moto.Model = id;
                    moto.AnnoModelo = lector.GetValue(0).ToString();
                    moto.MotorSize = lector.GetValue(1).ToString();
                    moto.Cylinders = lector.GetValue(2).ToString();
                    moto.MotorType = lector.GetValue(3).ToString();
                    moto.Type = lector.GetValue(4).ToString();
                    moto.ImgUrl = lector.GetValue(5).ToString();
                    moto.Price = float.Parse(lector.GetValue(6).ToString());

                    lector.Close();
                }
                else
                    throw new Exception("No existe ninguna moto con el ID #" + id);

                lector = null;
                conexion.Close();
                conexion.Dispose();

                return moto;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
