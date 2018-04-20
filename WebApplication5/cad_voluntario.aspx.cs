using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class cad_voluntario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Limpar()
        {
            txtCpf.Text = string.Empty;
            txtPrimeiroNome.Text = string.Empty;
            txtUltimoNome.Text = string.Empty;
            txtDataNasc.Text = string.Empty;
            txtDocId.Text = string.Empty;
            txtDataEmmisaoDoc.Text = string.Empty;
            txtNacionalidade.Text = string.Empty;
            txtCep.Text = string.Empty;
            txtLogradouro.Text = string.Empty;
            txtNumero.Text = string.Empty;
            txtComplemento.Text = string.Empty;
            txtBairro.Text = string.Empty;
            txtCidade.Text = string.Empty;
            txtEstadoProvincia.Text = string.Empty;
            txtPais.Text = string.Empty;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string insert = string.Format("insert into voluntario values('{0}', '{1}', '{2}', '{3}','{4}', '{5}', '{6}')",
                txtCpf.Text, txtPrimeiroNome.Text, txtUltimoNome.Text, txtDataNasc.Text, txtDocId.Text, txtDataEmmisaoDoc.Text, txtNacionalidade.Text);

            string insert1 = string.Format("insert into endereco values('{0}', '{1}', '{2}', '{3}','{4}', '{5}', '{6}','{7}')",
                txtCep.Text, txtLogradouro.Text, txtNumero.Text, txtComplemento.Text, txtBairro.Text, txtCidade.Text, txtEstadoProvincia.Text, txtPais.Text);

            if (SqlDB.Instancia.FazerUpdate(insert) < 1)
                Mensagem("Erro na inclusão");

        }

        private void Mensagem(string msg)
        {
            Response.Write(string.Format("<script>alert('{0}');</script>", msg));
        }
    }
}