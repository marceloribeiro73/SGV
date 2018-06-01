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
        public int AutenticarUsuario(string pUsuario, string pSenha)
        {
            string strCmd = string.Format("SELECT LOGIN_NAME, PASSWD, QTD_FALHAS_LOGIN,STATUS FROM USUARIO WHERE LOGIN_NAME = '{0}'", pUsuario);
            SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
            if (dr1.Read())
            {
                string auxu = Convert.ToString(dr1["LOGIN_NAME"]);
                string auxPC = Convert.ToString(dr1["PASSWD"]);
                int auxQTD = Convert.ToInt32(dr1["QTD_FALHAS_LOGIN"]);
                char auxST = Convert.ToChar(dr1["STATUS"]);
                dr1.Close();
                if(auxST.Equals('A'))
                {
                    if (auxPC.Equals(pSenha))
                    {
                        string strCmd2 = string.Format("UPDATE USUARIO SET QTD_FALHAS_LOGIN = 0 WHERE LOGIN_NAME = '{0}'", pUsuario);
                        int auxZera = SqlDB.Instancia.FazerUpdate(strCmd2);
                        return 1; //Retono login Valido
                    }
                    else
                    {
                        int auxSoma = auxQTD + 1;
                        string strCmd2 = string.Format("UPDATE USUARIO SET QTD_FALHAS_LOGIN = {1} WHERE LOGIN_NAME = '{0}'", pUsuario, auxSoma);
                        int auxZera = SqlDB.Instancia.FazerUpdate(strCmd2);
                        if(auxSoma >= 3)
                        {
                            string strCmd4 = string.Format("UPDATE USUARIO SET STATUS = 'B', DATA_BLOQUEIO = getdate() WHERE LOGIN_NAME = '{0}'", pUsuario);
                            int auxBloq = SqlDB.Instancia.FazerUpdate(strCmd4);
                            return 4; //Retorno Bloqueado
                        }
                        else
                        {
                            return 2; //retorno Errado
                        }
                    }
                }
                else if (auxST.Equals('I'))
                {
                    return 5; //Rerono inativo
                }
                else
                {
                    return 4; //Retorno Bloqueado
                }
            }
            else
            {
                return 2; //retorno Errado
            }
        }
    }
}