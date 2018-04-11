

CREATE PROCEDURE sp_sgv_incluir_evento(@nome_evento VARCHAR(64), @data_inicio DATE, @data_fim DATE, @status char, @tipo_evento int)
AS
BEGIN
    IF(SELECT  NOME_EVENTO FROM EVENTO WHERE NOME_EVENTO = @nome_evento) IS NOT NULL
    BEGIN--PRIMEIRO IF
        INSERT INTO EVENTO VALUES (@nome_evento, @data_inicio, @data_fim,@status, getdate(),NULL,@tipo_evento)
        SELECT 'Cadastro Efetuado'  AS 'Retorno'
    END --PRIMEIRO IF
    ELSE
    BEGIN --Primeiro Else
        SELECT 'Cadastro Não Efetuado' AS 'Retorno'
    END -- Primeiro Else
END--End Proc