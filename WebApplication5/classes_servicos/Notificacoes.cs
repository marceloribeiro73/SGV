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
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, SGV_DEV.DBO.VOLUNTARIO_X_ATIVIDADE_X_EVENTO VAE WHERE V.CPF = VAE.VOLUNTARIO AND V.STATUS = 'P' AND V.CPF = '{0}'", pCpf);
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
            string strCmd = string.Format("SELECT COUNT(V.CPF) AS 'PENDENCIAS' FROM VOLUNTARIO V, VOLUNTARIO_X_ATIVIDADE_X_EVENTO VAE WHERE V.CPF = VAE.VOLUNTARIO AND VAE.QUANTIDADE_HORAS_DECLARADA <= 0 AND V.STATUS = 'A' AND V.CPF = '{0}'", pCpf);
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