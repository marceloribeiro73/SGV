using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication5.Classes
{
    public class UsuarioDAO
    {
        public bool AutenticarUsuario(string pUsuario, string pSenha)
        {
            string strCmd = string.Format("SELECT STA=dbo.sf_sgv_login('{0}','{1}')",pUsuario,pSenha);
            SqlDataReader dRetorno = SqlDB.Instancia.FazerSelect(strCmd);
            string auxAutenticacao = null;
            if (dRetorno.Read())
            {
                auxAutenticacao = Convert.ToString(dRetorno["STA"]);
            }
            dRetorno.Close();
            if(auxAutenticacao != null)
            {
                if (auxAutenticacao.Equals("yes"))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}