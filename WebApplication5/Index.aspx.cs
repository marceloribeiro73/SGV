using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Classes;

namespace WebApplication5
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogar_click(object sender, EventArgs e)
        {
            UsuarioDAO ud = new UsuarioDAO();
            bool aux = ud.AutenticarUsuario(txtUsuario.Text, txtSenha.Text);
            if (aux)
            {
                Response.Redirect("home.aspx");

            }
            else
            {
                lblUserInvalido.Visible = true;
                txtSenha.Text = null;
                txtUsuario.Text = null;
            }
        }
    }

}