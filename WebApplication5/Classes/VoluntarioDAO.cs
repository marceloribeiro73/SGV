using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication5.Classes
{
    public class VoluntarioDAO
    {
        public string inserirVoluntario(Voluntario pVoluntario)
        {           
            if(!pVoluntario.sCpf.Equals(null))
            {
                string strCmd = string.Format("INSERT INTO VOLUNTARIO VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}',getdate(),'I',{14},{15})", pVoluntario.sCpf,pVoluntario.sPrimeiroNome,pVoluntario.sUltimoNome,pVoluntario.sDataNasc,pVoluntario.sDocIdentificacao,pVoluntario.sTipoDocIdentificacao,pVoluntario.sDataEmissao,pVoluntario.sOrgaoEmissor,pVoluntario.sNacionalidade, pVoluntario.sTelefoneContato, pVoluntario.sTelefoneContato2,pVoluntario.sEmail,pVoluntario.sDataAdesao, pVoluntario.sPathFoto,pVoluntario.iMaxHoras, pVoluntario.iTipoVoluntario);

                string strCmd2 = string.Format("INSERT INTO ENDERECO VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')",pVoluntario.sCpf, pVoluntario.sCodPostal, pVoluntario.sLogradouro,pVoluntario.sNumero, pVoluntario.sComplemento,pVoluntario.sBairro,pVoluntario.sCidade,pVoluntario.sEstadoProvincia,pVoluntario.sPais);

                int aux= SqlDB.Instancia.FazerUpdate(strCmd);
                int aux2 = SqlDB.Instancia.FazerUpdate(strCmd2);

                int aux3 = -1;

                foreach(int i in pVoluntario.oDiasSemana)
                {
                    if(aux3 == -1)
                    {
                        aux3 = 0;
                    }
                    string strCmd3 = string.Format("INSERT INTO DIAS_SEMANA_VOLUNTARIO VALUES('{0}', {1})",pVoluntario.sCpf, i);

                    aux3 = aux3 + SqlDB.Instancia.FazerUpdate(strCmd3);

                }

               if(aux > 0 && aux2 > 0 && aux3 > 0)
               {
                   return "Cadastro eferuado com Sucesso.";
               }
               else
               {
                return "Cadastro não Efetuado.";
               }
            }
            else
            {
                return "Cadastro não Efetuado, campo CPF vazio.";
            }
        }
        public string alterarVoluntario(Voluntario pVoluntario)
        {
            string strCmd1 = string.Format("UPDATE VOLUNTARIO SET TELEFONE_CONTATO = '{0}', TELEFONE_CONTATO2 = '{1}', EMAIL = '{2}', PATH_FOTO = '{3}', MAX_HORAS_SEMANIS = {4} , TIPO_VOLUNTARIO = {5} WHERE CPF = '{6}'", pVoluntario.sTelefoneContato, pVoluntario.sTelefoneContato2, pVoluntario.sEmail, pVoluntario.sPathFoto, pVoluntario.iMaxHoras, pVoluntario.iTipoVoluntario, pVoluntario.sCpf);

            string strCmd2 = string.Format("UPDATE ENDERECO SET COD_POSTAL = '{0}', LOGRADOURO = '{1}', NUMERO = '{2}', COMPLEMENTO = '{3}', BAIRRO = '{4}', CIDADE = '{5}', ESTADO_PROVINCIA = '{6}', PAIS = '{7}' WHERE CPF = '{8}'", pVoluntario.sCodPostal, pVoluntario.sLogradouro, pVoluntario.sNumero, pVoluntario.sBairro, pVoluntario.sCidade, pVoluntario.sEstadoProvincia, pVoluntario.sPais,    pVoluntario.sCpf);
            
            string strCmdDel = string.Format("DELETE FROM DIAS_SEMANA_VOLUNTARIO WHERE VOLUNTARIO = '{0'}", pVoluntario.sCpf);

            int vRetDel = SqlDB.Instancia.FazerUpdate(strCmdDel);

            int vRet = SqlDB.Instancia.FazerUpdate(strCmd1);
            vRet = vRet + SqlDB.Instancia.FazerUpdate(strCmd2);

            int varRetDias = 0;
            foreach(int i in pVoluntario.oDiasSemana)
            {
                string strcmd3 = string.Format("INSERT INTO DIAS_SEMANA_VOLUNTARIO VALUES ('{0}', {1})", pVoluntario.sCpf, i);
                varRetDias = varRetDias + SqlDB.Instancia.FazerUpdate(strcmd3);
            }

            if(vRet > 1)
            {
                return "Alteração realizada com sucesso.";
            }
            else
            {
                return "Alteração não pode ser realizada, verifique os campos e tente novamente.";
            }

        }

        public int aceitarEvento(string pCpf, int pEvento)
        {
            string strCmd = string.Format("UPDATE VOLUNTARIO_x_EVENTO SET STATUS = 'Z' WHERE VOLUNTARIO = '{0}' AND EVENTO = {1} ", pCpf, pEvento);
            int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
            if(varRet > 0)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }

        public int recusarEvento(string pCpf, int pEvento)
        {
            string strCmd = string.Format("UPDATE VOLUNTARIO_x_EVENTO SET STATUS = 'R' WHERE VOLUNTARIO = '{0}' AND EVENTO = {1} ", pCpf, pEvento);
            int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
            if(varRet > 0)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }

        public Voluntario buscarVoluntario(string pCpf)
        {
            Voluntario oVl =null;
            if(!pCpf.Equals(null))
            {
                string strCmd = string.Format ("SELECT * FROM VOLUNTARIO WHERE CPF = '{0}'",pCpf);
                SqlDataReader dr1 = SqlDB.Instancia.FazerSelect(strCmd);
                if(dr1.Read())
                {
                    oVl=new Voluntario();
                    oVl.sCpf = Convert.ToString(dr1["CPF"]);
                    oVl.sPrimeiroNome = Convert.ToString(dr1["PRIMEIRO_NOME"]);
                    oVl.sUltimoNome = Convert.ToString(dr1["ULTIMO_NOME"]);
                    oVl.sDataNasc = Convert.ToString(dr1["DATA_NASC"]);
                    oVl.sDocIdentificacao = Convert.ToString(dr1["DOC_IDENTIFICACAO"]);
                    oVl.sTipoDocIdentificacao = Convert.ToString(dr1["TIPO_DOC_IDENTIFICACAO"]);
                    oVl.sDataEmissao = Convert.ToString(dr1["DATA_EMISSAO"]);
                    oVl.sOrgaoEmissor = Convert.ToString(dr1["ORGAO_EMISSOR"]);
                    oVl.sNacionalidade = Convert.ToString(dr1["NACIONALIDADE"]);
                    oVl.sTelefoneContato = Convert.ToString(dr1["TELEFONE_CONTATO"]);
                    oVl.sTelefoneContato2 = Convert.ToString(dr1["TELEFONE_CONTATO2"]);
                    oVl.sEmail = Convert.ToString(dr1["EMAIL"]);
                    oVl.sDataAdesao = Convert.ToString(dr1["DATA_ADESAO"]);
                    oVl.sPathFoto = Convert.ToString(dr1["PATH_FOTO"]);
                    oVl.sDataCriacao = Convert.ToString(dr1["DATA_CRIACAO"]);
                    oVl.sStatus = Convert.ToString(dr1["STATUS"]);
                    oVl.iMaxHoras = Convert.ToInt32(dr1["MAX_HORAS_SEMANAIS"]);
                    oVl.iTipoVoluntario = Convert.ToInt32(dr1["TIPO_VOLUNTARIO"]);
                    dr1.Close();
                }
                return oVl;
            }
            else
            {
                return oVl;
            }

        }

        public int declararHoras(int pEvento, string pVoluntario, int pHoras, DateTime pData)
        {
            
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            Calendar calendar = dfi.Calendar;
            int aux = calendar.GetWeekOfYear(pData,dfi.CalendarWeekRule,dfi.FirstDayOfWeek);
            string strCmd = string.Format("INSERT INTO DECLARACAO_HORAS VALUES ('{0}',{1},{2},{3},{4},getdate())", pVoluntario, pEvento, pHoras,aux ,pData.Year.ToString());
            int varRet = SqlDB.Instancia.FazerUpdate(strCmd);
            return varRet;
        }
        
    }
}