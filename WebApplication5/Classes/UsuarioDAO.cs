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

        public int cadUsuario(string pEmail , string pCpf, int pTipoVol)
        {
            string sSenha = null;
            for(int i = 0; i <= 6; i++)
            {
                sSenha = sSenha+ pCpf[i];
            }
            int iTpUser = 0;
            if(pTipoVol == 1)
            {
                iTpUser =1;//Admin
            }
            else if (pTipoVol == 2 || pTipoVol == 3)
            {
                iTpUser=2; //
            }
            else
            {
                return 9; // Erro tipo de voluntario não encontrado
            }
            int varRet = 0;
            string strCmd = string.Format("INSERT INTO USUARIO VALUES ('{0}','{1}','{2}',{3},'I',getdate(),null,0,null)",pCpf,pEmail,sSenha,iTpUser);
            if(iTpUser != 0 && !strCmd.Equals(null))
            {
                varRet = SqlDB.Instancia.FazerUpdate(strCmd);
                if(varRet > 0)
                {
                    return 1; // Sucesso ao cadastrar
                }
                else
                {
                    return 2; //Erro ao inserir
                }
            }
            else
            {
                return 2;//erro ao inserir
            }
        }
    }
}