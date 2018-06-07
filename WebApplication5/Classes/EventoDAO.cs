using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication.Classes
{
    public class EventoDAO
    {

        public bool inserirEvento(string pNome, string pDataInicio, string pDataFim, int pTipo, string pEndereco)
        {
            string strCmd = string.Format("INSERT INTO EVENTO VALUES ('{0}','{1}','{2}','{3}','A',getdate(),null,{4})", pNome,pDataInicio,pDataFim,pEndereco,pTipo);
            int aux = SqlDB.Instancia.FazerUpdate(strCmd);
            if(aux > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }

}