using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication5.classes_servicos;

namespace WebApplication.Classes
{
    public class VoluntDAO
    {
        public bool inserirVoluntario(string pPrimeiroNome, string pUltimoNome, string pDataNasc, string pDocIdentificacao, string pTipoDocIdentificacao, string pDataEmissao, string pNacionalidade,
                                       int pTelefoneContato, int pTelefoneContato2, string pEmail, string pDataAdesao, string pDataCriacao, string pDataInativacao, string pTipoVoluntario,
                                       string pCodPostal, string pLogradouro, string pNumero, string pComplemento, string pCidade, string pEstadoProvincia, string pPais)
        {
            SqlCommand comando = new SqlCommand("[dbo].[sp_sgv_incluir_voluntario]", SqlDB.Instancia.Connection);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.Add(new SqlParameter("@primeiro_Nome", SqlDbType.VarChar)).Value = pPrimeiroNome;
            comando.Parameters.Add(new SqlParameter("@utimo_nome", SqlDbType.Date)).Value = pUltimoNome;
            comando.Parameters.Add(new SqlParameter("@data_nasc", SqlDbType.Date)).Value = pDataNasc;
            comando.Parameters.Add(new SqlParameter("@doc_identficacao", SqlDbType.Char)).Value = pDocIdentificacao;
            comando.Parameters.Add(new SqlParameter("@tipo_doc_identificacao", SqlDbType.Int)).Value = pTipoDocIdentificacao;
            comando.Parameters.Add(new SqlParameter("@data_emissao", SqlDbType.VarChar)).Value = pDataEmissao;
            comando.Parameters.Add(new SqlParameter("@nacionalidade", SqlDbType.VarChar)).Value = pNacionalidade;
            comando.Parameters.Add(new SqlParameter("@telefone_contato", SqlDbType.Date)).Value = pTelefoneContato;
            comando.Parameters.Add(new SqlParameter("@telefone_contato2", SqlDbType.Date)).Value = pTelefoneContato2;
            comando.Parameters.Add(new SqlParameter("@email", SqlDbType.Char)).Value = pEmail;
            comando.Parameters.Add(new SqlParameter("@data_adesao", SqlDbType.Int)).Value = pDataAdesao;
            comando.Parameters.Add(new SqlParameter("@data_criacao", SqlDbType.Int)).Value = pDataCriacao;
            comando.Parameters.Add(new SqlParameter("@status", SqlDbType.VarChar)).Value = 'A';
            comando.Parameters.Add(new SqlParameter("@data_inativacao", SqlDbType.VarChar)).Value = pDataInativacao;
            comando.Parameters.Add(new SqlParameter("@tipo_voluntario", SqlDbType.Date)).Value = pTipoVoluntario;
            comando.Parameters.Add(new SqlParameter("@cod_postal", SqlDbType.Date)).Value = pCodPostal;
            comando.Parameters.Add(new SqlParameter("@logradouro", SqlDbType.Char)).Value = pLogradouro;
            comando.Parameters.Add(new SqlParameter("@numero", SqlDbType.Int)).Value = pNumero;
            comando.Parameters.Add(new SqlParameter("@complemento", SqlDbType.VarChar)).Value = pComplemento;
            comando.Parameters.Add(new SqlParameter("@cidade", SqlDbType.VarChar)).Value = pCidade;
            comando.Parameters.Add(new SqlParameter("@estado_provincia", SqlDbType.Date)).Value = pEstadoProvincia;
            comando.Parameters.Add(new SqlParameter("@pais", SqlDbType.Date)).Value = pPais;
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