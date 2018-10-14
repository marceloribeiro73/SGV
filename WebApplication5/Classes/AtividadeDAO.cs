using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5.Classes
{
    public class AtividadeDAO
    {
        public int inserirAtividade(Atividade pAtividade)
        {
            Atividade oAtividade = null;
            if(!pAtividade.sNome.Equals(" "))
            {
                if(!pAtividade.iQtdVol.Equals(null))
                {
                    string strCmd = string.Format("SELECT * FROM ATIVIDADE WHERE NOME_ATIVIDADE = '{0}'", pAtividade.sNome);
                    SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
                    if(dr.Read())
                    {
                        dr.Close();
                        return 6;  //Retorno de já existente
                    }
                    else
                    {
                        dr.Close();
                        strCmd = string.Format("INSERT INTO ATIVIDADE VALUES ('{0}',{1},{2}, 'A',getdate())",pAtividade.sNome,pAtividade.iQtdVol,pAtividade.iMedMin);
                        int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
                        if(varRet > 0)
                        {
                            strCmd = string.Format("SELECT COD_ATIVIDADE FROM ATIVIDADE WHERE NOME_ATIVIDADE = '{0}'",pAtividade.iCod);
                            SqlDataReader dr2 = SqlDB.Instancia.FazerSelect(strCmd);
                            if(dr2.Read())
                            {
                                int vCod = Convert.ToInt32(dr2["COD_ATIVIDADE"]);
                                dr2.Close();
                                strCmd = string.Format("INSERT INTO TIPO_VOLUNTARIO_x_ATIVIDADE VALUES ({0},{1})",vCod,pAtividade.iTipoVoluntario);
                                varRet = SqlDB.Instancia.FazerUpdate(strCmd);
                                if(varRet > 0)
                                {
                                    return 1;
                                }
                                else
                                {
                                    return 1; // Erro ao vincular tipo voluntario
                                }
                            }
                            else
                            {
                                return 2; //Atividade não cadastrada
                            }
                        }
                        else
                        {
                            return 2; //Atividade não cadastrada
                        }
                    }
                }
                else
                {
                    return 4; //Qtd não preenchida
                }
            }
            else
            {
                return 5; //Nome não preenchido
            }
        }

        
    }
}