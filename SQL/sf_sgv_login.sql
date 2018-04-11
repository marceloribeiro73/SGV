--Fuction de login
--DATA_CRIACAO 01/04/2018
--POR MARCELO RIBEIRO
--VERSAO 0.2
--ALTERAÇÕES: ADICIONAR RECURSO DE BLOQUEIO DE USUARIO POR TENTATIVAS FALHADAS

CREATE FUNCTION sf_sgv_login (@login_name VARCHAR(64),@passwd VARCHAR(64))
RETURNS VARCHAR(64)
AS
BEGIN
	DECLARE @varRetorno VARCHAR(64)
	IF(SELECT LOGIN_NAME FROM USUARIO WHERE LOGIN_NAME = @login_name) IS NOT NULL
	BEGIN
		IF(SELECT PASSWD FROM USUARIO WHERE LOGIN_NAME = @login_name) = @passwd
		BEGIN
			SET @varRetorno = 'yes'
		END-- END-IF
		ELSE
		BEGIN
			DECLARE @varQtdFalha INT
			SET @varQtdFalha = (
				SELECT QTD_FALHAS_LOGIN FROM USUARIO WHERE LOGIN_NAME = @login_name
			)
			IF @varQtdFalha >= 3
			BEGIN
				EXEC sp_sgv_bloquear_usuario @login_name
				SET @varRetorno = 'bloq'
			END--END-IF
			SET @varRetorno = 'not'
		END--END- ELSE

	END --END-IF
	ELSE
	BEGIN
		SET @varRetorno = 'not'
	END --END-ELSE
	RETURN(@varRetorno)
END--END-FUNCTION
