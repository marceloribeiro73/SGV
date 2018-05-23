using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication.Classes
{
    public class VoluntarioDAO
    {
        public string inserirVoluntario(Voluntario pVoluntario)
        {           
            if(!pVoluntario.sCpf.Equals(null))
            {
                string strCmd = string.Format("INSERT INTO VOLUNTARIO VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{8}','{9}','{10}','{11}','{12}','{13}',getdate(),'I',{14},{15})",pVoluntario.sCpf,pVoluntario.sPrimeiroNome,pVoluntario.sUltimoNome,pVoluntario.sDataNasc,pVoluntario.sDocIdentificacao,pVoluntario.sTipoDocIdentificacao,pVoluntario.sDataEmissao,pVoluntario.sOrgaoEmissor,pVoluntario.sNacionalidade, pVoluntario.sTelefoneContato, pVoluntario.sTelefoneContato2,pVoluntario.sEmail,pVoluntario.sDataAdesao, pVoluntario.sPathFoto,pVoluntario.iMaxHoras, pVoluntario.iTipoVoluntario);

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
    }
}