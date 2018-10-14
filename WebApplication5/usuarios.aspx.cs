using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (chkInativo.Checked)
            {
                string vsVol = txtUsuario.Text;
                dataUsuarios.SelectCommand = string.Format("SELECT U.COD_USUARIO AS 'CODIGO', V.PRIMEIRO_NOME +' '+ V.ULTIMO_NOME AS 'VOLUNTARIO', U.LOGIN_NAME AS 'USUARIO', U.PASSWD AS 'SEGREDO', TU.NOME_TIPO_USUARIO AS 'TIPO', U.STATUS AS 'STATUS', U.DATA_CRIACAO AS 'DATA DE CRIAÇÃO', U.DATA_INATIVACAO AS 'DATA DE INATIVAÇÃO', U.QTD_FALHAS_LOGIN AS 'FALHAS LOGIN', U.DATA_BLOQUEIO AS 'DATA DE BLOQUEIO' FROM USUARIO U, TIPO_USUARIO TU, VOLUNTARIO V WHERE U.TIPO_USUARIO = TU.COD_TIPO_USUARIO AND V.CPF = U.VOLUNTARIO AND LOGIN_NAME LIKE '{0}'",vsVol);
            }
            else
            {
                string vsVol = txtUsuario.Text;
                dataUsuarios.SelectCommand = string.Format("SELECT U.COD_USUARIO AS 'CODIGO', V.PRIMEIRO_NOME +' '+ V.ULTIMO_NOME AS 'VOLUNTARIO', U.LOGIN_NAME AS 'USUARIO', U.PASSWD AS 'SEGREDO', TU.NOME_TIPO_USUARIO AS 'TIPO', U.STATUS AS 'STATUS', U.DATA_CRIACAO AS 'DATA DE CRIAÇÃO', U.DATA_INATIVACAO AS 'DATA DE INATIVAÇÃO', U.QTD_FALHAS_LOGIN AS 'FALHAS LOGIN', U.DATA_BLOQUEIO AS 'DATA DE BLOQUEIO' FROM USUARIO U, TIPO_USUARIO TU, VOLUNTARIO V WHERE U.TIPO_USUARIO = TU.COD_TIPO_USUARIO AND V.CPF = U.VOLUNTARIO AND LOGIN_NAME LIKE '{0}' AND STATUS <> 'I'", vsVol);
            }
            dataUsuarios.DataBind();
        }
    }
}