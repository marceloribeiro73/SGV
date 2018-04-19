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
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACÃO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE E.TIPO_EVENTO = T.COD_TIPO_EVENTO AND E.TIPO_EVENTO = {0} AND E.STATUS <> 'I'", pTipoEvento);
                }
                else
                {
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACÃO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE E.TIPO_EVENTO = T.COD_TIPO_EVENTO AND E.TIPO_EVENTO = {0} AND E.NOME_EVENTO ={1} AND E.STATUS <> 'I'", pTipoEvento, pNome); 
                }
            }
            else
            {
                if(pNome == null){
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACÃO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE E.TIPO_EVENTO = T.COD_TIPO_EVENTO AND E.TIPO_EVENTO = {0}, pTipoEvento", pTipoEvento);
                }
                else
                {
                    strCmd = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.ENDERECO, E.STATUS, E.DATA_CRIACÃO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE E.TIPO_EVENTO = T.COD_TIPO_EVENTO AND E.TIPO_EVENTO = {0} AND E.NOME_EVENTO ={1}", pTipoEvento, pNome); 
                }
            }
            if (strCmd != null)
            {
                SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);

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