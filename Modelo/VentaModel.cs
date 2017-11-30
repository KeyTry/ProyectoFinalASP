using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class VentaModel
    {
        
        private string idCliente;
        private string idMoto;
        private char motoType;
        private char payMethod;
        private float totalPrice;

        public VentaModel(string pIdCliente, string pIdMoto, char pPayMethod, float pGrossPrice, char pMotoType)
        {
            this.IdCliente = pIdCliente;
            this.idMoto = pIdMoto;
            this.PayMethod = pPayMethod;
            this.MotoType = pMotoType;
            this.TotalPrice = pGrossPrice;
        }
        public float TotalPrice
        {
            set
            {
                switch (this.motoType)
                {
                      //SCOOTER
                    case 'S':
                        this.totalPrice = (value+(value/10))+(value * 15 / 100) +(value/15)+(value * 13 / 100);
                        break;
                        //MONTAnnERA
                    case 'M':
                        this.totalPrice = (value + (value * 15/100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13/100);
                        break;
                        //CUADRACICLO
                    case 'C':
                        this.totalPrice = (value + (value * 20/100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13 / 100);
                        break;
                        //PANDILLERA
                    case 'P':
                        this.totalPrice = (value + (value * 25/100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13 / 100);
                        break;
                }
                
            }
            get
            {
                return this.totalPrice;
            }
        } 
        public string IdCliente { get => idCliente; set => idCliente = value; }
        public string IdMoto { get => idMoto; set => idMoto = value; }
        public char PayMethod { get => payMethod; set => payMethod = value; }
        public char MotoType { get => motoType; set => motoType = value; }
    }
}
