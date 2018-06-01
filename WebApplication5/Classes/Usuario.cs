using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication5.Classes
{
    public class Usuario
    {
        public int iCodUsuario { get; set; }
        public string sVoluntario { get; set; }
        public string sLoginName { get; set; }
        public string sPasswd { get; set; }
        public int iTipoUsuario { get; set; }
        public char cStatus { get; set; }
        public string sDataCriacao { get; set; }
        public string sDataInativacao { get; set; }
        public int iQtdErradas { get; set; }
        public string sDataBolque { get; set; }
    }
}
