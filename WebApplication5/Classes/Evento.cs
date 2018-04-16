using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WebApplication.Classes
{
    public class Evento
    {
        public int iCodEvento {get;set;}
        public string sNomeEvento {get;set;}
        public string sDataInicio {get;set;}
        public  string sDataFim { get; set; }
        public string sEndereco { get; set; }
        public string sStatus {get; set;}
        public string sDataCriacao {get; set;}
        public string sDataInativação {get; set;}
        public int iTipoEvento {get; set;}
    }
    
}