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
        public Evento buscarEvento (string pNome, int pTipoEvento, bool pInativo)
        {
            Evento oEved = null;
            string strCmd = null;
            if(pInativo == false){
                if(pNome == null){
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, E.TIPO_EVENTO FROM  EVENTO E WHERE  E.TIPO_EVENTO = {0} AND E.STATUS <> 'I'", pTipoEvento);
                }
                else
                {
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, E.TIPO_EVENTO FROM  EVENTO E WHERE  E.TIPO_EVENTO = {0} AND E.NOME_EVENTO ={1} AND E.STATUS <> 'I'", pTipoEvento, pNome); 
                }
            }
            else
            {
                if(pNome == null){
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, E.TIPO_EVENTO FROM  EVENTO E WHERE E.TIPO_EVENTO = {0}, pTipoEvento", pTipoEvento);
                }
                else
                {
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, E.TIPO_EVENTO FROM  EVENTO E WHERE  E.TIPO_EVENTO = {0} AND E.NOME_EVENTO ={1}", pTipoEvento, pNome); 
                }
            }
            if (strCmd != null)
            {
                SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
                if (dr.Read())
                {
                    oEved.iCodEvento = Convert.ToInt32(dr["E.COD_EVENTO"]);
                    oEved.sNomeEvento = Convert.ToString(dr["E.NOME_EVENTO"]);
                    oEved.sDataInicio = Convert.ToString(dr["E.DATA_INICIO"]);
                    oEved.sDataFim = Convert.ToString(dr["E.DATA_FIM"]);
                    oEved.sEndereco = Convert.ToString(dr["E.ENDERECO"]);
                    oEved.sStatus = Convert.ToString(dr["E.STATUS"]);
                    oEved.iTipoEvento = Convert.ToInt32(dr["E.TIPO_EVENTO"]);
                }
                return oEved;
            }
            else
            {
                return oEved;
            }
        }
        

        public bool inserirEvento(string pNome, string pDataInicio, string pDataFim, int pTipo, string pEndereco)
        {
            SqlCommand comando = new SqlCommand("[dbo].[sp_sgv_incluir_evento]", SqlDB.Instancia.Connection);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter("@nome_evento", SqlDbType.VarChar)).Value = pNome;
            comando.Parameters.Add(new SqlParameter("@data_inicio", SqlDbType.Date)).Value = pDataInicio;
            comando.Parameters.Add(new SqlParameter("@data_fim", SqlDbType.Date)).Value = pDataFim;
            comando.Parameters.Add(new SqlParameter("@status", SqlDbType.Char)).Value = 'A';
            comando.Parameters.Add(new SqlParameter("@tipo_evento", SqlDbType.Int)).Value = pTipo;
            comando.Parameters.Add(new SqlParameter("@endereco", SqlDbType.VarChar)).Value = pEndereco;
            int rows = comando.ExecuteNonQuery();

            if(rows > 0)
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