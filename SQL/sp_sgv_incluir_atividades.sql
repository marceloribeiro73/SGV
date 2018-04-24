CREATE PROCEDURE sp_sgv_incluir_atividades(@nome VARCHAR(64), @qtd INT, @duraca INT, @tipo INT)
AS
BEGIN
	INSERT INTO ATIVIDADE VALUES(@nome,@qtd,@duraca,'A',GETDATE(),NULL, @tipo);
END

