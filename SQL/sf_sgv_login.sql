--Fuction de login

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
		END ELSE
		BEGIN
			SET @varRetorno = 'not'
		END
	END ELSE
	BEGIN
		SET @varRetorno = 'not'
	END
	RETURN(@varRetorno)
END