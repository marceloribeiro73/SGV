using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.classes_servicos;

namespace WebApplication5
{
    public partial class eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["evento"] = null;   
        }

        protected void btnIncluirEvento_Click(object sender, EventArgs e)
        {
            Response.Redirect("cad_eventos.aspx");
        }

        protected void btnInativar_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Mama mia fora ." + grwEventos.Rows.Count + " ');</script>");
            int aux = grwEventos.Rows.Count;
            for (int cont = 0; cont <  aux; cont++)
            {
                //Response.Write("<script>alert('Mama mia ."+ grwEventos.Rows.Count+" ');</script>");
                string strCmd = null;
                CheckBox check = (CheckBox)grwEventos.Rows[cont].FindControl("CheckBox1");
                Label lbCod = (Label)grwEventos.Rows[cont].FindControl("Label1");
                Label lbStat = (Label)grwEventos.Rows[cont].FindControl("label2");
                if (check.Checked == true)
                {
                    if (lbStat.Text.Equals("A"))
                    {
                        strCmd = string.Format("UPDATE EVENTO SET STATUS = 'I' WHERE COD_EVENTO = {0}", lbCod.Text);
                    }else if (lbStat.Text.Equals("I"))
                    {
                        strCmd = string.Format("UPDATE EVENTO SET STATUS = 'A' WHERE COD_EVENTO = {0}", lbCod.Text);
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

        protected void btnBuscarEvento_Click(object sender, EventArgs e)
        {
            if (chkInativos.Checked)
            {
                if(txtNome.Text == "")
                {
                    evento.SelectCommand = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO ,E.DATA_INICIO , E.DATA_FIM , E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE  E.TIPO_EVENTO = {0} AND E.TIPO_EVENTO = T.COD_TIPO_EVENTO",ddlTipoEvento.Text);
                }
                else
                {
                    evento.SelectCommand = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE  E.TIPO_EVENTO = {0} AND E.NOME_EVENTO LIKE '%{1}%' AND E.TIPO_EVENTO = T.COD_TIPO_EVENTO", ddlTipoEvento.Text,txtNome.Text);
                }
            }
            else
            {
                if (txtNome.Text == "")
                {
                    evento.SelectCommand = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE  E.TIPO_EVENTO = {0} AND E.STATUS <> 'I' AND E.TIPO_EVENTO = T.COD_TIPO_EVENTO", ddlTipoEvento.Text);
                }
                else
                {
                    evento.SelectCommand = string.Format("SELECT E.COD_EVENTO, E.NOME_EVENTO,E.DATA_INICIO, E.DATA_FIM, E.STATUS, E.DATA_CRIACAO, E.DATA_INATIVACAO, T.NOME_TIPO_EVENTO FROM  EVENTO E, TIPO_EVENTO T WHERE  E.TIPO_EVENTO = {0} AND E.NOME_EVENTO LIKE '%{1}%' AND E.STATUS <> 'I' AND E.TIPO_EVENTO = T.COD_TIPO_EVENTO", ddlTipoEvento.Text, txtNome.Text);
                }
            }
            
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            Session["evento"] = null;
            int aux = grwEventos.Rows.Count;
            for(int cont =0; cont < aux; cont++)
            {
                CheckBox check = (CheckBox)grwEventos.Rows[cont].FindControl("CheckBox1");
                Label lbCod = (Label)grwEventos.Rows[cont].FindControl("Label1");
                if (check.Checked)
                {
                    Session["evento"] = lbCod.Text;
                    Response.Redirect("cad_eventos.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Não houve selecão para atribuição.');</script>");
                }
            }
        }

        
            

        protected void btnAtribuir_Click(object sender, EventArgs e)
        {
            Session["evento"] = null;
            int aux = grwEventos.Rows.Count;
            for (int cont = 0; cont < aux; cont++)
            {
                CheckBox check = (CheckBox)grwEventos.Rows[cont].FindControl("CheckBox1");
                Label lbCod = (Label)grwEventos.Rows[cont].FindControl("Label1");
                if (check.Checked)
                {
                    Session["evento"] = lbCod.Text;
                    Response.Redirect("atribuicaoVol.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Não houve selecão para alteracão.');</script>");
                }
            }
        }
    }
}