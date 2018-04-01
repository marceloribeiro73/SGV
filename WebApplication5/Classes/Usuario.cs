using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication5.Classes
{
    public class Usuario
    {
        public int Cod_usuario { get; set; }
        public string Login_name { get; set; }
        public string Passwd { get; set; }
        public char Status { get; set; }
        public string Tipo_usuario { get; set; }
    }
}