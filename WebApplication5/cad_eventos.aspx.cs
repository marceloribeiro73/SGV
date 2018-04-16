using System;
using System.Linq;
using WebApplication.Classes;

namespace WebApplication5
{
    public partial class cad_eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool validaObrigatorio()
        {
           if((txtNomeEvento.Text != string.Empty && txtNomeEvento.Text.Length >0) || (txtDataInicio.Text != string.Empty && txtDataInicio.Text.All(char.IsDigit)) || (txtDataFim.Text != string.Empty && txtDataFim.Text.All(char.IsDigit)))
           {
                return true;
           }
           else
           {
                return false;
           }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            bool bObrPreenchidos = validaObrigatorio();
            if(bObrPreenchidos != true)
            {
                lblAlerta.Text = "Campos obrigatorios não foram preenchidos, para continuar, preencha todos os campos obrigatorios!";
                lblAlerta.Visible = true;
            }
            else
            {
                EventoDAO oEvd = new EventoDAO();
                bool auxRet = oEvd.inserirEvento(txtNomeEvento.Text, txtDataInicio.Text, txtDataFim.Text, Convert.ToInt32(ddlTipoEvento.Text), txtEndereco.Text);
                if(auxRet == true)
                {
                    Response.Write("<script>alert('Cadastro Efetuado');</script>");
                    Response.Redirect("eventos.apsx");
                }
                else
                {
                    Response.Write("<script>alert('Cadastro não Efetuado');</script>");
                }

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("eventos.aspx");
        }
    }
}