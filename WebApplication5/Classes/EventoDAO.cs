using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication5.Classes
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

        public int atribuirVoluntarioEvento(string pVolun, int pCodEvento)
        {
            string strCmd = string.Format("INSERT INTO VOLUNTARIO_x_EVENTO VALUES('{0}',{1},getdate(),'P')",pVolun,pCodEvento);
            int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
            if(varRet > 0)
            {
                return 1; //Vinculação Realizada
            }
            else
            {
                return 2; //Falha na Vinculação
            }
        }

        public int desatribuirVolutarioEvento(string pVolun, int pCodEvento)
        {
            string strCmd = string.Format("DELETE FROM VOLUNTARIO_x_EVENTO WHERE VOLUNTARIO = '{0}' AND EVENTO = {1}",pVolun,pCodEvento);
            int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
            if(varRet > 0 )
            {
                return 1; //Desviculação feita com sucesso
            }
            else
            {
                return 2; //Houve falha na Desvinculação do Voluntario
            }
        }

        public Evento BuscarEventoCod(string pCod)
        {
            Evento oRetEvento = null;
            
                string strCmd = string.Format("SELECT * FROM EVENTO WHERE COD_EVENTO = {0}", pCod);
                SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
                if(dr1.Read())
                {
                    oRetEvento = new Evento();
                    oRetEvento.iCodEvento = Convert.ToInt32(dr1["COD_EVENTO"]);
                    oRetEvento.sNomeEvento = Convert.ToString(dr1["NOME_EVENTO"]);
                    oRetEvento.sDataInicio = Convert.ToString(dr1["DATA_INICIO"]);
                    oRetEvento.sDataFim = Convert.ToString(dr1["DATA_FIM"]);
                    oRetEvento.sEndereco = Convert.ToString(dr1["ENDERECO"]);
                    oRetEvento.sStatus = Convert.ToString(dr1["STATUS"]);
                    oRetEvento.sDataCriacao = Convert.ToString(dr1["DATA_CRIACAO"]);
                    oRetEvento.sDataInativação = Convert.ToString(dr1["DATA_INATIVACAO"]);
                    oRetEvento.iTipoEvento = Convert.ToInt32(dr1["TIPO_EVENTO"]);
                    dr1.Close();
                }

               
            

            return oRetEvento;
        }

    }

}