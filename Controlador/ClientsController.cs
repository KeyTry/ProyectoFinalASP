using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;
namespace Controlador
{
    public class ClientsController
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringConexion;
        public ClientsController(string pStringConexion)
        {
            this.stringConexion = pStringConexion;
        }

        public void RegistrarCliente(ClientModel client)
        {
            try
            {

                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Ins_Clientes]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@idCliente", client.Id);
                this.comando.Parameters.AddWithValue("@email",client.Email);
                this.comando.Parameters.AddWithValue("@nombre", client.Name);
                this.comando.Parameters.AddWithValue("@telefono", client.Phone);
                this.comando.Parameters.AddWithValue("@password", client.Password);
                this.comando.Parameters.AddWithValue("@direccion", client.Address);
                this.comando.Parameters.AddWithValue("@ubicacion", client.Ubication);

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
    }
}
