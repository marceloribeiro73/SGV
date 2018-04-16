

CREATE PROCEDURE sp_sgv_incluir_evento(@nome_evento VARCHAR(64), @data_inicio DATE, @data_fim DATE, @status char, @tipo_evento int, @endereco VARCHAR(256))
AS
BEGIN
    IF(SELECT  NOME_EVENTO FROM EVENTO WHERE NOME_EVENTO = @nome_evento) IS NULL
    BEGIN--PRIMEIRO IF
        INSERT INTO EVENTO VALUES (@nome_evento, @data_inicio, @data_fim,@endereco,@status, getdate(),NULL,@tipo_evento)
    END --PRIMEIRO IF
END--End Proc