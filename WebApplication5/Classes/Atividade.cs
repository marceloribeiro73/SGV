using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WebApplication.Classes
{
    public class Atividade
    {
        public int oCod { get; set; }
        public string sNome { get; set; }
        public int iQtdVol { get; set; }
        public int iMedMin { get; set; }
        public string sStatus { get; set; }
        public string sDataCriacao { get; set; }
        public string sDatainativacao { get; set; }
        public int iTipo { get; set; }
    }

}