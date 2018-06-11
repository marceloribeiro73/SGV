using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class voluntarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = string.Format("SELECT V.CPF AS 'CPF', V.PRIMEIRO_NOME AS 'PRIMEIRO NOME',V.ULTIMO_NOME AS 'ULTIMO NOME', V.DATA_NASC AS 'DATA DE NASCIMENTO',V.DATA_ADESAO AS 'DATA DE ADESÃO', T.NOME_TIPO_VOLUNTARIO AS 'TIPO VOLUNTARIO', V.STATUS AS 'STATUS'FROM VOLUNTARIO V, TIPO_VOLUNTARIO T WHERE V.TIPO_VOLUNTARIO = T.COD_TIPO_VOLUNTARIO AND V.CPF LIKE '%{0}%' AND V.PRIMEIRO_NOME LIKE '%{1}%' AND V.UTIMO_NOME LIKE '%{2}%'",txtCPF.Text,txt1Nome.Text,txt2Nome.Text);
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtCPF.Text = string.Empty;
            txt1Nome.Text = string.Empty;
            txt2Nome.Text = string.Empty;
            SqlDataSource1.SelectCommand = "SELECT V.CPF AS 'CPF', V.PRIMEIRO_NOME AS 'PRIMEIRO NOME',V.UTIMO_NOME AS 'ULTIMO NOME', V.DATA_NASC AS 'DATA DE NASCIMENTO', V.DATA_ADESAO AS 'DATA DE ADESÃO', T.NOME_TIPO_VOLUNTARIO AS 'TIPO VOLUNTARIO', V.STATUS AS 'STATUS' FROM VOLUNTARIO V, TIPO_VOLUNTARIO T WHERE V.TIPO_VOLUNTARIO = T.COD_TIPO_VOLUNTARIO";
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_voluntario.aspx");
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            int aux = grwVoluntarios.Rows.Count;
            for(int i=0; i < aux; i++)
            {
                CheckBox check = (CheckBox)grwVoluntarios.Rows[i].FindControl("CheckBox1");
                Label lblCpf = (Label)grwVoluntarios.Rows[i].FindControl("Label1");
                if (check.Checked)
                {
                    Session["voluntario"] = lblCpf.Text;
                    Response.Redirect("cad_voluntario.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Não houve selecão para alteracão.');</script>");
                }
            }
        }

        protected void btnInativarAtivar_Click(object sender, EventArgs e)
        {
            int aux = grwVoluntarios.Rows.Count;
            for(int cont =0; cont < aux; cont++)
            {
                string strCmd = null;
                CheckBox check = (CheckBox)grwVoluntarios.Rows[cont].FindControl("CheckBox1");
                Label lbCpf = (Label)grwVoluntarios.Rows[cont].FindControl("Label1");
                Label lbStatus = (Label)grwVoluntarios.Rows[cont].FindControl("Label2");
                if(check.Checked == true)
                {
                    if (lbStatus.Text.Equals("A"))
                    {
                        strCmd = string.Format("UPDATE VOLUNTARIO SET STATUS = 'I' WHERE CPF = '{0}'", lbCpf.Text);
                    }else if (lbStatus.Text.Equals("I"))
                    {
                        strCmd = string.Format("UPDATE VOLUNTARIO SET STATUS = 'A' WHERE CPF = '{0}'", lbCpf.Text);
                    }
                    else
                    {
                        strCmd = null;
                    }
                    if(strCmd != null)
                    {
                        SqlDB.Instancia.FazerUpdate(strCmd);
                        Response.Write("<script>alert('Status Alterado');</script>");
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        Response.Write("<script>alert('Status não pode ser alterado.');</script>");
                    }
                }
            }
        }
    }
}