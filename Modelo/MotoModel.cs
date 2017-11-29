using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class MotoModel
    {
        private string model;
        private string annoModelo;
        private string motorSize;
        private string cylinders;
        private string motorType;
        private string type;
        private string imgUrl;
        private float price;
      
            
        public MotoModel()
        {

        }
     
        public MotoModel(string pModel, string pAnnoModelo, string pMotorSize, string pCylinders, string pMotorType, string pType, string pImgUrl, float pPrice)
        {
            this.Model = pModel;
            this.AnnoModelo = pAnnoModelo;
            this.MotorSize = pMotorSize;
            this.Cylinders = pCylinders;
            this.MotorType = pMotorType;
            this.Type = pType;
            this.ImgUrl = pImgUrl;
            this.Price = pPrice;
        }

        public string Model { get => model; set => model = value; }
        public string ImgUrl { get => imgUrl; set => imgUrl = value; }
        public string Type { get => type; set => type = value; }

        public float Price {
            set
            {
                switch (this.type)
                {
                    //SCOOTER
                    case "Scooter":
                        this.price = (value + (value / 10)) + (value * 15 / 100) + (value / 15) + (value * 13 / 100);
                        break;
                    //MONTAnnERA
                    case "Montannera":
                        this.price = (value + (value * 15 / 100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13 / 100);
                        break;
                    //CUADRACICLO
                    case "Cuadraclico":
                        this.price = (value + (value * 20 / 100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13 / 100);
                        break;
                    //PANDILLERA
                    case "Pandillera":
                        this.price = (value + (value * 25 / 100)) + (value * 15 / 100) + (value * 15 / 100) + (value * 13 / 100);
                        break;
                }
            }
            get
            {
                return this.price;
            }
        }
        public string AnnoModelo { get => annoModelo; set => annoModelo = value; }
        public string MotorSize { get => motorSize; set => motorSize = value; }
        public string Cylinders { get => cylinders; set => cylinders = value; }
        public string MotorType { get => motorType; set => motorType = value; }
    }
}
