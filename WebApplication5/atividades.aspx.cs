using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class atividades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["atividade"] = null;
        }

        protected void btnIncluir_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_atividades.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //SqlDataSource2.SelectCommand = string.Format("SELECT A.NOME_ATIVIDADE AS 'NOME DA ATIVIDADE',A.QTD_VOLUNTARIOS AS 'QUANTIDADE IDEAL DE VOLUNTARIOS',A.DURACAO_MEDIA_MINUTOS AS 'dURAÇÃO MEDIA EM MINUTOS',A.STATUS AS 'STATUS',A.DATA_CRIACAO AS 'DATA DE CRIAÇÃO',T.NOME_TIPO_ATIVIDADE AS 'TIPO DE ATIVIDADE' FROM ATIVIDADE A, TIPO_ATIVIDADE T WHERE T.COD_TIPO_ATIVIDADE = A.TIPO_ATIVIDADE AND A.NOME_ATIVIDADE LIKE '%{0}%' AND A.TIPO_ATIVIDADE = {1}", txtNome.Text, /*ddtipoAtividade.Text*/);
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtNome.Text = string.Empty;
            SqlDataSource2.SelectCommand = "SELECT A.NOME_ATIVIDADE AS 'NOME DA ATIVIDADE',A.QTD_VOLUNTARIOS AS 'QUANTIDADE IDEAL DE VOLUNTARIOS',A.DURACAO_MEDIA_MINUTOS AS 'dURAÇÃO MEDIA EM MINUTOS',A.STATUS AS 'STATUS',A.DATA_CRIACAO AS 'DATA DE CRIAÇÃO',T.NOME_TIPO_ATIVIDADE AS 'TIPO DE ATIVIDADE' FROM ATIVIDADE A, TIPO_ATIVIDADE T WHERE T.COD_TIPO_ATIVIDADE = A.TIPO_ATIVIDADE";
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            int aux = grwAtividades.Rows.Count;
            for (int cont = 0; cont < aux; cont++)
            {
                CheckBox check = (CheckBox)grwAtividades.Rows[cont].FindControl("CheckBox1");
                Label lbCod = (Label)grwAtividades.Rows[cont].FindControl("Label1");
                if (check.Checked)
                {
                    Session["atividade"] = lbCod.Text;
                    Response.Redirect("cad_atividade.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Não houve selecão para alteracão.');</script>");
                }
            }
        }

        protected void btnAtivar_Click(object sender, EventArgs e)
        {
            int aux = grwAtividades.Rows.Count;
            for(int i = 0; i < aux; i++)
            {
                string strCmd = null;
                CheckBox check = (CheckBox)grwAtividades.Rows[i].FindControl("Checkox1");
                Label lbNome = (Label)grwAtividades.Rows[i].FindControl("Label1");
                Label lbStatus = (Label)grwAtividades.Rows[i].FindControl("Label2");
                if (check.Checked)
                {
                    if (lbStatus.Text.Equals("A"))
                    {
                         strCmd = string.Format("UPDATE ATIVIDADE SET STATUS = 'I' WHERE NOME_ATIVIDADE = '{0}'", lbNome.Text);
                    }
                    else if (lbStatus.Text.Equals("I"))
                    {
                         strCmd = string.Format("UPDATE ATIVIDADE SET STATUS = 'A' WHERE NOME_ATIVIDADE = '{0}'", lbNome.Text);
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