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

        public int CadUsuario(string pEmail , string pCpf, int pTipoVol)
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

        public Usuario BuscarUsuario(string pVoluntario)
        {
            Usuario oVolRet;
            if (!pVoluntario.Equals("") || pVoluntario.Length != 11)
            {
                string strCmd = string.Format("SELECT USUARIO.COD_USUARIO,USUARIO.VOLUNTARIO, USUARIO.LOGIN_NAME, USUARIO.PASSWD,USUARIO.TIPO_USUARIO, USUARIO.STATUS,USUARIO.DATA_CRIACAO, USUARIO.DATA_INATIVACAO, USUARIO.QTD_FALHAS_LOGIN, USUARIO.DATA_BLOQUEIO FROM USUARIO WHERE USUARIO.VOLUNTARIO = '{0}'", pVoluntario);
                try {
                    SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
                    if (dr1.Read())
                    {
                        oVolRet = new Usuario
                        {
                            sVoluntario = Convert.ToString(pVoluntario),
                            iCodUsuario = Convert.ToInt32(dr1["USUSARIO.COD_USUARIO"]),
                            sLoginName = Convert.ToString(dr1["USUARIO.LOGIN_NAME"]),
                            sPasswd = Convert.ToString(dr1["USUARIO.PASSWD"]),
                            iTipoUsuario = Convert.ToInt32(dr1["USUARIO.TIPO_USUARIO"]),
                            cStatus = Convert.ToChar(dr1["USUARIO.STATTUS"]),
                            sDataCriacao = Convert.ToString(dr1["USUARIO.DATA_CRIACAO"]),
                            sDataInativacao = Convert.ToString(dr1["USUARIO.DATA_INATIVACAO"]),
                            iQtdErradas = Convert.ToInt32(dr1["USUARIO.QTD_FALHAS_LOGIN"]),
                            sDataBolque = Convert.ToString(dr1["USUARIO.DATA_BLOQUEIO"])
                        };

                        dr1.Close();
                        return oVolRet;
                    }
                    else
                    {
                        return null;
                    }
                }
                catch (SqlException e)
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public string AlteraStaus(string pVoluntario)
        {
            string varRet;
            UsuarioDAO UDaux = new UsuarioDAO();
            if(!pVoluntario.Equals(null))
            {
                Usuario oUser = new Usuario();
                oUser = UDaux.BuscarUsuario(pVoluntario);
                if(oUser.sVoluntario == pVoluntario)
                {
                    string strCmd = null;
                    string auxStatus = null;
                    if(oUser.cStatus.Equals("I"))
                    {
                        auxStatus = "A";
                    }
                    else if(oUser.cStatus.Equals("A"))
                    {
                        auxStatus = "I";
                    }
                    if(!auxStatus.Equals(null))
                    {
                        strCmd = string.Format("UPADATE USUARIO SET USUARIO.STATUS = '{0}' WHERE USUSARIO.VOLUNTARIO = '{1}'", auxStatus,pVoluntario);
                    }
                    if(!strCmd.Equals(null))
                    {
                        try
                        {
                            int rowsUpdate = SqlDB.Instancia.FazerUpdate(strCmd);
                            if(rowsUpdate > 0)
                            {
                                return string.Format("Status do Usuario {0} foi alterado para {1}.",oUser.sLoginName,auxStatus);
                            }
                        }
                        catch(SqlException sqle)
                        {
                            return sqle.Message;
                        }
                        catch(ArgumentNullException nulle)
                        {
                            return nulle.Message;
                        }
                        catch(HttpException httpe)
                        {
                            return httpe.Message;
                        }
                    }

                }
                return "Status não alterado.";

            }
            return "Status não alterado."; 
        }
    }
}