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

        public ClientModel Consultar(string pEmail)
        {
            try
            {
                ClientModel cliente = null;
                // Creación de Conexión
                this.conexion = new SqlConnection(this.stringConexion);

                // Se abre la conexión
                this.conexion.Open();

                // Se construye el comando
                this.comando = new SqlCommand();

                // Asignamos la conexión al comando
                this.comando.Connection = this.conexion;

                // Definimos el texto el comando, en este caso es un procedimiento almacenado
                this.comando.CommandText = "[Sp_Cns_Cliente]";

                // Indicar el tipo de comando
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;

                // Se debe asignar el valor del email al paramétro
                this.comando.Parameters.AddWithValue("@email", pEmail);

                // Lector de datos
                SqlDataReader lector;

                // El lector recibe los datos del comando
                lector = this.comando.ExecuteReader();

                // Validamos que se contenga datos en el lector
                if (lector.Read())
                {
                    // Se crea la instancia del usuario
                    // Lector es un vector
                    // Lector[0] = email
                    // Lectro[1] = password

                    cliente = new ClientModel(lector.GetValue(0).ToString(),
                        lector.GetValue(1).ToString(),
                        lector.GetValue(2).ToString(),
                        lector.GetValue(3).ToString(),
                        lector.GetValue(4).ToString(),
                        lector.GetValue(5).ToString(),
                        lector.GetValue(6).ToString());
                }
                else
                {
                    throw new Exception("Usuario o password incorrecto");
                }

                // Recordar cerrar y liberar la memoria
                this.conexion.Close();
                this.conexion.Dispose();
                this.comando.Dispose();
                lector.Close();

                // Se retorna la instancia
                return cliente;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
