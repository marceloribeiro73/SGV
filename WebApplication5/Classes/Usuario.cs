using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication5.Classes
{
    public class Usuario
    {
        public int iCodUsuario { get; set; }
        public string sLoginName { get; set; }
        public string sPasswd { get; set; }
        public char cStatus { get; set; }
        public string sTipoUsuario { get; set; }
    }
}
