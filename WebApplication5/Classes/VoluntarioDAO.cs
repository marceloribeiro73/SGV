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
        public bool inserirVoluntario(string pCpf,string pPrimeiroNome, string pUltimoNome, string pDataNasc, string pDocIdentificacao, string pTipoDocIdentificacao, string pDataEmissao, string pNacionalidade,string pTelefoneContato, string pTelefoneContato2, string pEmail, string pDataAdesao,string pTipoVoluntario, string pCodPostal, string pLogradouro, string pNumero, string pComplemento,string pBairro, string pCidade, string pEstadoProvincia, string pPais, string pFoto)
        {
            SqlCommand comando = new SqlCommand("[dbo].[sp_sgv_incluir_voluntario]", SqlDB.Instancia.Connection);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter("@cpf", SqlDbType.VarChar)).Value = pCpf;
            comando.Parameters.Add(new SqlParameter("@primeiro_Nome", SqlDbType.VarChar)).Value = pPrimeiroNome;
            comando.Parameters.Add(new SqlParameter("@utimo_nome", SqlDbType.VarChar)).Value = pUltimoNome;
            comando.Parameters.Add(new SqlParameter("@data_nasc", SqlDbType.Date)).Value = pDataNasc;
            comando.Parameters.Add(new SqlParameter("@doc_identficacao", SqlDbType.Char)).Value = pDocIdentificacao;
            comando.Parameters.Add(new SqlParameter("@tipo_doc_identificacao", SqlDbType.Char)).Value = pTipoDocIdentificacao;
            comando.Parameters.Add(new SqlParameter("@data_emissao", SqlDbType.Date)).Value = pDataEmissao;
            comando.Parameters.Add(new SqlParameter("@nacionalidade", SqlDbType.VarChar)).Value = pNacionalidade;
            comando.Parameters.Add(new SqlParameter("@telefone_contato", SqlDbType.VarChar)).Value = pTelefoneContato;
            comando.Parameters.Add(new SqlParameter("@telefone_contato2", SqlDbType.VarChar)).Value = pTelefoneContato2;
            comando.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = pEmail;
            comando.Parameters.Add(new SqlParameter("@path_foto", SqlDbType.VarChar)).Value = pFoto ;
            comando.Parameters.Add(new SqlParameter("@data_adesao", SqlDbType.Date)).Value = pDataAdesao;
            comando.Parameters.Add(new SqlParameter("@tipo_voluntario", SqlDbType.Int)).Value = pTipoVoluntario;
            comando.Parameters.Add(new SqlParameter("@cod_postal", SqlDbType.VarChar)).Value = pCodPostal;
            comando.Parameters.Add(new SqlParameter("@logradouro", SqlDbType.VarChar)).Value = pLogradouro;
            comando.Parameters.Add(new SqlParameter("@numero", SqlDbType.VarChar)).Value = pNumero;
            comando.Parameters.Add(new SqlParameter("@complemento", SqlDbType.VarChar)).Value = pComplemento;
            comando.Parameters.Add(new SqlParameter("@bairro", SqlDbType.VarChar)).Value = pBairro;
            comando.Parameters.Add(new SqlParameter("@cidade", SqlDbType.VarChar)).Value = pCidade;
            comando.Parameters.Add(new SqlParameter("@estado_provincia", SqlDbType.VarChar)).Value = pEstadoProvincia;
            comando.Parameters.Add(new SqlParameter("@pais", SqlDbType.VarChar)).Value = pPais;
            int rows = comando.ExecuteNonQuery();

            if (rows > 0)
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