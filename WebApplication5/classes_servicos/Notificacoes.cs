using System.Data.SqlClient;
using WebApplication5.classes_servicos;
using System;

namespace WebApplication5
{
    public class Notificacoes
    {
        public int adminPendenciasVolunatrio()
        {
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, TERMO_ADSAO TA WHERE V.CPF =  TA.VOLUNTARIO AND  TA.PATH_TERMO = NULL OR V.CPF   NOT IN (SELECT V.CPF FROM VOLUNTARIO V, TERMO_ADSAO TA WHERE V.CPF = TA.VOLUNTARIO)");
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr1.Read())
            {
                string aux = Convert.ToString(dr1["PENDENCIAS"]);
                return Convert.ToInt32(aux);
            }
            else
            {
                return 0;
            }
        }

        public int adminUserBloq()
        {
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, USUARIO U WHERE V.CPF = U.VOLUNTARIO AND U.STATUS = 'B'");
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr1.Read())
            {
                string aux = Convert.ToString(dr1["PENDENCIAS"]);
                return Convert.ToInt32(aux);
            }
            else
            {
                return 0;
            }
        }

        public int userPendentesAceitacao(string pCpf)
        {
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, EVENTO E, VOLUNTARIO_x_EVENTO VE WHERE V.CPF = VE.VOLUNTARIO AND E.COD_EVENTO = VE.EVENTO AND V.STATUS = 'P' AND V.CPF = '{0}'", pCpf);
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr1.Read())
            {
                string aux = Convert.ToString(dr1["PENDENCIAS"]);
                return Convert.ToInt32(aux);
            }
            else
            {
                return 0;
            }
        }

        public int userPendentesDeclaracao(string pCpf)
        {
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, EVENTO E, VOLUNTARIO_x_EVENTO VE WHERE V.CPF = VE.VOLUNTARIO AND E.COD_EVENTO = VE.EVENTO AND V.STATUS = 'P' AND V.CPF = '{0}'", pCpf);
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if(dr1.Read())
            {
                string aux = Convert.ToString(dr1["PENDENCIAS"]);
                return Convert.ToInt32(aux);
            }
            else
            {
                return 0;
            }
        }
    }
}