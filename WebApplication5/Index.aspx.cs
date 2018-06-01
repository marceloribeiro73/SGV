using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario oUser = null ;
            Session["usuario"] = oUser;
        }

        protected Usuario carregaUser(string pUser)
        {
            Usuario oUser;
            string strCmd = string.Format("SELECT * FROM USUARIO WHERE LOGIN_NAME = '{0}'", pUser);
            SqlDataReader dr = SqlDB.Instancia.FazerSelect(strCmd);
            if (dr.Read())
            {
                oUser = new Usuario();
                oUser.iCodUsuario = Convert.ToInt32(dr["COD_USUARIO"]);
                oUser.sVoluntario = Convert.ToString(dr["VOLUNTARIO"]);
                oUser.sLoginName = Convert.ToString(dr["LOGIN_NAME"]);
                oUser.sPasswd = Convert.ToString(dr["PASSWD"]);
                oUser.iTipoUsuario = Convert.ToInt32(dr["TIPO_USUARIO"]);
                oUser.cStatus = Convert.ToChar(dr["STATUS"]);
                oUser.sDataCriacao = Convert.ToString(dr["DATA_CRIACAO"]);
                oUser.sDataInativacao = Convert.ToString(dr["DATA_INATIVACAO"]);
                oUser.iQtdErradas = Convert.ToInt32(dr["QTD_FALHAS_LOGIN"]);
                oUser.sDataBolque = Convert.ToString(dr["DATA_BLOQUEIO"]);
                dr.Close();
                return oUser;
            }
            else
            {
                oUser = null;
                return oUser;
            }
        }


        protected void btnLogar_click(object sender, EventArgs e)
        {
            UsuarioDAO ud = new UsuarioDAO();
            int aux = ud.AutenticarUsuario(txtUsuario.Text, txtSenha.Text);
            if (aux == 1)
            {
                Session["usuario"] = carregaUser(txtUsuario.Text);
                Response.Redirect("home.aspx");

            }
            else if(aux == 4)
            {
                lblUserInvalido.Text = "Usuario Bloqueado, contate o Administrador do Sistema.";
                lblUserInvalido.Visible = true;
                txtUsuario.Text = string.Empty;
                txtSenha.Text = string.Empty;
            }
            else if(aux == 5)
            {
                lblUserInvalido.Text = "Usuario inativo, contate o Administrador do Sistema.";
                lblUserInvalido.Visible = true;
                txtUsuario.Text = string.Empty;
                txtSenha.Text = string.Empty;
            }
            else
            {
                lblUserInvalido.Text = "Usuario ou senha invalido, ao errar 3 vezes a senha, o usuario será bloqueado.";
                lblUserInvalido.Visible = true;
                txtUsuario.Text = string.Empty;
                txtSenha.Text = string.Empty;
            }
        }
    }

}