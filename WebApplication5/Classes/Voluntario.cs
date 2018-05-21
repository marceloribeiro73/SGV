using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication.Classes
{
    public class Voluntario
    {
        public string sCpf { get; set; }
        public string sPrimeiroNome { get; set; }
        public string sUltimoNome { get; set; }
        public string sDataNasc { get; set; }
        public string sDocIdentificacao { get; set; }
        public string sTipoDocIdentificacao { get; set; }
        public string sOrgaoEmissor {get; set; }
        public string sDataEmissao { get; set; }
        public string sNacionalidade { get; set; }
        public string sTelefoneContato { get; set; }
        public string sTelefoneContato2 { get; set; }
        public string sEmail { get; set; }
        public string sDataAdesao { get; set; }
        public string sPathFoto { get; set; }
        public string sDataCriacao { get; set; }
        public string sStatus { get; set; }
        public string sDataInativacao { get; set; }
        public int iTipoVoluntario { get; set; }
        public string sCodPostal { get; set; }
        public string sLogradouro { get; set; }
        public string sNumero { get; set; }
        public string sComplemento { get; set; }
        public string sBairro { get; set; }
        public string sCidade { get; set; }
        public string sEstadoProvincia { get; set; }
        public string sPais { get; set; }

        public int iMaxHoras {get;set;}

        List<char> oDiasSemana {get; set;}

    }
}