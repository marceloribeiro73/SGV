using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication.Classes
{
    public class VoluntarioDAO
    {
        public string inserirVoluntario(Voluntario pVoluntario)
        {           
            if(!pVoluntario.sCpf.Equals(null))
            {
                string strCmd = string.Format("INSERT INTO VOLUNTARIO VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{8}','{9}','{10}','{11}','{12}','{13}',getdate(),'I',{14},{15})",pVoluntario.sCpf,pVoluntario.sPrimeiroNome,pVoluntario.sUltimoNome,pVoluntario.sDataNasc,pVoluntario.sDocIdentificacao,pVoluntario.sTipoDocIdentificacao,pVoluntario.sDataEmissao,pVoluntario.sOrgaoEmissor,pVoluntario.sNacionalidade, pVoluntario.sTelefoneContato, pVoluntario.sTelefoneContato2,pVoluntario.sEmail,pVoluntario.sDataAdesao, pVoluntario.sPathFoto,pVoluntario.iMaxHoras, pVoluntario.iTipoVoluntario);

                string strCmd2 = string.Format("INSERT INTO EDERECO VALUES")

               int aux= SqlDB.Instancia.FazerUpdate(strCmd);


               if(aux > 0)
               {
                   return "Cadastro eferuado com Sucesso.";
               }
               else
               {
                return "Cadastro não Efetuado.";
               }
            }
            else
            {
                return "Cadastro não Efetuado, campo CPF vazio.";
            }
        }
    }
}