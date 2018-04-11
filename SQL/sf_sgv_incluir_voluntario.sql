--Fuction de inclusao de voluntario
--DATA_CRIACAO 03/04/2018
--POR MARCELO RIBEIRO
--VERSAO 0.1

CREATE PROCEDURE sp_sgv_incluir_voluntario(@cpf VARCHAR(12),@primeiro_Nome VARCHAR(64),@utimo_nome VARCHAR(64),@data_nasc date, @doc_identficacao VARCHAR(15), 
	@tipo_doc_identificacao CHAR, @data_emissao DATE, @nacionalidade VARCHAR(64), @telefone_contato VARCHAR(64), @telefone_contato2 VARCHAR(64), @email VARCHAR(64), 
	@data_adesao DATE, @path_foto VARCHAR(128), @tipo_voluntario INT, @cod_postal VARCHAR(64), @logradouro VARCHAR(128), @numero VARCHAR(12), @complemento VARCHAR(12), 
	@cidade VARCHAR(128), @estado_provincia VARCHAR(128), @pais VARCHAR(128))
AS
BEGIN
  IF(SELECT CPF FROM VOLUNTARIO WHERE CPF = @cpf) IS NULL
  BEGIN
      INSERT INTO VOLUNTARIO VALUES (@cpf,@primeiro_Nome,@utimo_nome,@data_nasc,@doc_identficacao,@tipo_doc_identificacao,@data_emissao,@nacionalidade,@telefone_contato, @telefone_contato2, @email, @data_adesao, @path_foto,getdate(), 'I', NULL, @tipo_voluntario)

      INSERT INTO ENDERECO VALUES (@cpf, @cod_postal, @logradouro, @numero, @complemento, @cidade, @estado_provincia, @pais)

      SELECT  'Cadastrado com Sucesso' AS 'Retorno'
  END--end-if
  ELSE
  BEGIN
    SELECT 'Cadstro não efetuado' AS 'Retorno'
  END--end-else
END--end-Fuction
