using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClientModel
    {
        private string id, email, name, phone, password, address, ubication;
        //private char payMethod;
        public ClientModel(string pId, string pEmail, string pName, string pPhone, string pPassword, string pAddress, string pUbication)
        {
            this.email = pEmail;
            this.Id = pId;
            this.Name = pName;
            this.Phone = pPhone;
            this.Address = pAddress;
            this.Ubication = pUbication;
            //this.PayMethod = pPayMethod;
        }

        public string Id { get => id; set => id = value; }
        public string Email { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Phone { get => phone; set => phone = value; }
        public string Password { get => password; set => password = value; }
        public string Address { get => address; set => address = value; }
        public string Ubication { get => ubication; set => ubication = value; }
        //public char PayMethod { get => payMethod; set => payMethod = value; }
    }
}
