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
        /*public Evento buscarEvento (string pNome, int pTipoEvento, bool pInativo)
        {
            if (pNome.Equals(null))
            {
                if
            }
        }*/

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