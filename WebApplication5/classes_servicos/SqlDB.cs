using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication5.classes_servicos
{
    public class SqlDB
    {
        private static SqlDB instancia;

        public static SqlDB Instancia
        {
            get
            {
                if (instancia == null)
                {
                    instancia = new SqlDB();
                }
                return instancia;
            }
        }

        private SqlDB()
        {
            AbrirConex();
        }

        private SqlConnection conexAtual;
        public SqlConnection Connection
        {
            get
            {
                return conexAtual;
            }
        }

        private SqlDataReader dataReaderAtual;
        public void CloseDataReader()
        {
            dataReaderAtual.Close();
            dataReaderAtual = null;
        }

        public string StringConex
        {
            get
            {
                SqlConnectionStringBuilder scb = new SqlConnectionStringBuilder()
                {
                    DataSource = "athena-sgv.database.windows.net",
                    InitialCatalog = "SGV_DEV",
                    UserID = "marcelo.ribeiro",
                    Password = "73System#"
                };

                return scb.ToString();
            }
        }

        public SqlConnection AbrirConex()
        {
            SqlConnection conex = new SqlConnection(StringConex);
            conex.Open();
            conexAtual = conex;
            return conex;
        }

        public SqlCommand CriarComando(string sComando)
        {
            SqlCommand cmd = new SqlCommand(sComando, conexAtual);
            return cmd;
        }

        public SqlDataReader FazerSelect(string sSelect)
        {
            if (dataReaderAtual != null)
            {
                CloseDataReader();
            }

            SqlCommand cmd = CriarComando(sSelect);
            dataReaderAtual = cmd.ExecuteReader();
            return dataReaderAtual;
        }

        public int FazerUpdate(string sUpdate)
        {
            if (dataReaderAtual != null)
            {
                CloseDataReader();
            }
            SqlCommand cmd = CriarComando(sUpdate);
            return cmd.ExecuteNonQuery();
        }


    }
}
